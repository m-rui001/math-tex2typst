#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A negatively pinched Kähler threefold \
without bounded holomorphic coordinates]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

A bounded domain in $bb(C)^n$ has bounded holomorphic coordinate functions whose differentials are independent everywhere. The negatively curved uniformization problem asks whether curvature and completeness can force a complex manifold to possess such coordinates. In complex dimension one, a complete simply connected surface whose curvature is bounded above by a negative constant is biholomorphic to the disk. In higher dimension, the existence of bounded holomorphic coordinates is a separate global analytic requirement.

An early formulation appears in H. Wu’s work on normal families #cite(label("WuNormal1967")) p. 195, question (1). He asks whether a complete simply connected Kähler manifold with nonpositive real sectional curvature and holomorphic sectional curvature bounded above by a negative constant is biholomorphic to a bounded domain. Wu and Yau state the two-sided real-sectional version with a bounded pseudoconvex domain as conclusion #cite(label("WuYauSurvey2019")) Conjecture 4.3, p. 18: if a simply connected complete Kähler manifold has every real sectional curvature between two negative constants, must it be biholomorphic to a bounded domain in its complex dimension?

The unit ball is already too restrictive a candidate in higher dimension. Mostow and Siu constructed compact negatively curved Kähler surfaces not covered by the ball #cite(label("MostowSiu1980")). Deraux reviews their construction and obtains three-dimensional examples #cite(label("Deraux2005")). Their lifted metrics on the universal covers have two-sided negative sectional bounds by compactness. These non-ball results, however, do not exclude a biholomorphism to some other bounded domain; that is the stronger obstruction sought here.

Here and throughout, sectional curvature refers to the underlying real Riemannian metric, and completeness means geodesic completeness. A bounded holomorphic map is a holomorphic map with bounded image in its Euclidean target.

#thm([Theorem 1.1.])[
  #emph[There exist a contractible domain $M subset bb(C)^3$, a smooth complete Kähler metric $g$ on $M$, and finite constants $0 < A lt.eq B$ such that 
$ - B lt.eq K_g \( sigma \) lt.eq - A < 0 $

 for every real two-plane $sigma subset T_p M$ and every $p in M$. No bounded holomorphic map $F : M arrow.r bb(C)^3$ has a nowhere-vanishing Jacobian determinant. In particular, $M$ is not biholomorphic to a bounded domain in $bb(C)^3$.]
] <main:theorem>

Theorem 1 gives a negative answer to the stated uniformization question, and its curvature hypotheses also place the example within Wu’s earlier question. The example has two bounded nonconstant holomorphic functions, supplied by its base coordinates. Its analytic obstruction concerns a fixed triple of bounded functions with independent differentials at every point. The domain is nevertheless Stein: the construction supplies a smooth strictly plurisubharmonic exhaustion (Lemma 21), so Grauert’s solution of the Levi problem applies #cite(label("GrauertLevi1958")) Theorem 2 and Section 3.4. Thus the obstruction is to bounded holomorphic coordinates, not to holomorphic convexity.

=== 1.1 Intrinsic metrics and bounded functions <intrinsic-metrics-and-bounded-functions>

Two-sided negative real sectional curvature has strong consequences for intrinsic complex geometry. Greene and Wu established the lower comparison for the Bergman metric #cite(label("GreeneWu1979")); Wu and Yau recall that result and prove the complementary upper bound #cite(label("WuYauInvariant2020")) Theorems 4 and 6. Under completeness and simple connectivity, Wu and Yau then compare the Bergman, Kobayashi–Royden, complete negative Kähler–Einstein, and original metrics #cite(label("WuYauInvariant2020")) Corollary 7. The Bergman metric uses square-integrable holomorphic top-degree forms. These comparisons do not supply a fixed tuple of bounded holomorphic functions with independent differentials everywhere. Applied to the example in Theorem 1, they show that all these intrinsic metrics can be complete and mutually comparable while no such tuple exists.

The existence of even one nonconstant bounded holomorphic function is a related question with a different conclusion. The companion paper #cite(label("OpenAIOneSided2026")) Theorem 1.1 constructs, in a sufficiently large fixed finite complex dimension, a domain diffeomorphic to Euclidean space with a complete Kähler metric of real sectional curvature at most $- 1$ and only constant bounded holomorphic functions. Its curvature is unbounded below. Here both curvature bounds are finite and uniform, while the two bounded base coordinates remain. The two constructions and their proofs are independent.

=== 1.2 Construction and proof strategy <construction-and-proof-strategy>

We construct $M$ as a family of discs over the unit ball $bb(B) = { z in bb(C)^2 : \| z \| < 1 }$. A smooth real function $phi.alt$ on $bb(B)$ determines

$ M_phi.alt = { \( z \, w \) in bb(B) times bb(C) : e^(phi.alt \( z \)) \| w \|^2 < 1 } . $

Thus the disc above $z$ has radius $e^(- phi.alt \( z \) \/ 2)$. Put $psi \( z \) = - log \( 1 - \| z \|^2 \)$. Our metric is the complex Hessian of

$ lambda psi \( z \) - log #scale(x: 120%, y: 120%)[\(] 1 - e^(phi.alt \( z \)) \| w \|^2 #scale(x: 120%, y: 120%)[\)] \, $

with the real-metric convention specified in Section 2. This is a specialization of Calabi’s construction from a base potential and a radial function of a Hermitian fiber norm #cite(label("Calabi1979")) Section 3, equations (3.1)–(3.2). The momentum formulation of Hwang and Singer develops this framework for general base and bundle data #cite(label("HwangSinger2002")).

For the logarithmic radial potential used here, Hao, Chen, and Wang prove holomorphic and real sectional pinching results when the bundle curvature determines the base metric #cite(label("HaoChenWang2025")) Theorems 1 and 2. Hao, Chen, Wang, and Zhang obtain related results for complete Kähler–Einstein disk-bundle metrics under Einstein and curvature hypotheses on the base #cite(label("HaoChenWangZhang2026")) Sections 4.2–4.3. The estimate needed here concerns all real two-planes when the base form $lambda partial macron(partial) psi$ and the fiber-weight curvature $partial macron(partial) phi.alt$ are independent. We assume upper and lower bounds for the latter form and bounds for the component derivatives needed for curvature, expressed in centered ball coordinates. No curvature sign for the metric $partial macron(partial) phi.alt$ is assumed. We derive and estimate the full curvature tensor under precisely these hypotheses.

The analytic task is to choose $phi.alt$ so that it has these derivative bounds but cannot dominate a holomorphic real part, even after adding the logarithmic boundary allowance forced by Cauchy’s estimate for a Jacobian. To do this, we construct radii $r_N arrow.t 1$ and positive probabilities $mu_N$ on the unit sphere $S subset bb(C)^2$ such that

$ integral_S (phi.alt \( r_N xi \) + 4 log frac(1, 1 - r_N)) thin d mu_N \( xi \) arrow.r - oo \, $

while $integral_S "Re" H \( r_N xi \) thin d mu_N \( xi \) = "Re" H \( 0 \)$ for every holomorphic $H$ on $bb(B)$. The two averages exclude any holomorphic real part bounded above by the tested function plus a constant. The probabilities preserve holomorphic evaluation at the origin, but such measures need not preserve the logarithmic mean inequality for holomorphic functions: Hedenmalm gives an explicit example of this distinction #cite(label("Hedenmalm1989")) Theorem 3.7.

The construction proceeds at degrees $k_j = Q^j$ for one fixed large integer $Q$. At each degree we sum homogeneous peaks centered on a separated set of complex lines. The projective packing and power-sum estimate have a direct antecedent in Ryll and Wojtaszczyk #cite(label("RyllWojtaszczyk1983")) Section 2. A radial correction around each peak annihilates every holomorphic moment exactly. Separation of the degrees makes the corrections compatible with positivity at every stage. Regularized logarithms built from the peak polynomials then have a fixed negative average, which survives all subsequent corrections. Summing these logarithms with a sufficiently large fixed coefficient makes their negative averages dominate the boundary allowance. Low degrees vary little in a centered chart, while high degrees are exponentially small; this gives the uniform derivatives through order four needed for curvature.

The geometric task has its own delicate point. To prove negative curvature, we must show that its negated numerator is positive on every real two-plane. After rescaling the base directions, the leading expression is nonnegative but can vanish on planes with nonzero base and fiber projections. On these limiting planes the contribution of the potentially largest error term vanishes as well. This cancellation gives stronger error control near the degenerate planes and proves strict negativity for one sufficiently large base parameter $lambda$. With $lambda$ fixed, compactness on bounded fiber ranges and a uniform limiting tensor at the fiber boundary give both finite curvature bounds.

Section 2 states the two precise ingredients and derives Theorem 1 from them by Cauchy estimates for a putative Jacobian. Sections 3–4 construct the peaks and positive representing densities; Sections 5–6 establish their logarithmic tests and the controlled potential. Section 7 proves completeness. Sections 8–9 compute the curvature and prove the two-sided estimate, including the limiting planes just described.

== 2 Two inputs and the bounded-map obstruction <sec:reduction>

The construction separates a problem about functions on the ball from a curvature estimate. The first input is a strictly plurisubharmonic function with controlled derivatives and an obstruction to a prescribed holomorphic real-part bound. The second turns its complex Hessian bounds into a complete metric with uniformly negative real sectional curvature. We state both inputs precisely and then prove their implication for Theorem 1.

=== 2.1 Centered charts and the two propositions <centered-charts-and-the-two-propositions>

Let $bb(B) = { z in bb(C)^2 : \| z \| < 1 }$ and put

$ psi \( z \) = - log \( 1 - \| z \|^2 \) \, #h(2em) I = \( psi_(i macron(j)) \) . $

Here a complex Hessian is also viewed as a Hermitian form, linear in its first argument. To center coordinates at a point $z_0 in bb(B)$, let $r = \| z_0 \|$, choose a unitary map $U$ with $U \( r \, 0 \) = z_0$, and set

#[#set math.equation(numbering: n => "(2.1)")
 $ T = U compose T_r \, #h(2em) T_r \( zeta \) = (frac(r + zeta_1, 1 + r zeta_1) \, frac(sqrt(1 - r^2) thin zeta_2, 1 + r zeta_1)) . $ <base:charts>]

These maps are ball automorphisms with $T \( 0 \) = z_0$. The identity

$ 1 - \| T_r \( zeta \) \|^2 = frac(\( 1 - r^2 \) \( 1 - \| zeta \|^2 \), \| 1 + r zeta_1 \|^2) $

shows that $T^(*) I$ has the same expression in $zeta$ as $I$ has in $z$: the additional terms in $psi compose T$ are constant or pluriharmonic. In particular, this matrix is the identity at $0$ and has zero first derivatives there. We call (2.1) the centered ball charts.

For a smooth real function $phi.alt$ on $bb(B)$, write $h = partial macron(partial) phi.alt$ and, in a centered chart $T$, write

$ h_(i macron(j))^T \( zeta \) = partial_(zeta_i) partial_(macron(zeta)_j) \( phi.alt compose T \) \( zeta \) . $

The uniform control needed below is the existence of constants $0 < c lt.eq C < oo$ such that, for every centered chart,

#[#set math.equation(numbering: n => "(2.2)")
 $ c thin upright("Id") lt.eq h^T \( 0 \) lt.eq C thin upright("Id") $ <base:control>]

and

#[#set math.equation(numbering: n => "(2.3)")
 $ lr(|partial_k h_(i macron(j))^T \( 0 \)|) + lr(|partial_(macron(ell)) h_(i macron(j))^T \( 0 \)|) + lr(|partial_k partial_(macron(ell)) h_(i macron(j))^T \( 0 \)|) lt.eq C #h(2em) \( i \, j \, k \, ell in { 1 \, 2 } \) . $ <base:jets>]

The derivatives here are ordinary derivatives of the displayed component functions. In invariant form, (2.2) says $c I lt.eq h lt.eq C I$.

#thm([Proposition 2.1.])[
  (A controlled potential).  #emph[There exist $phi.alt in C^oo \( bb(B) \, bb(R) \)$ and a finite constant $C$ for which (2.2) and (2.3) hold with $c = 1$, and such that no $H in cal(O) \( bb(B) \)$ and $C_H in bb(R)$ satisfy 
#[#set math.equation(numbering: n => "(2.4)")
 $ "Re" H \( z \) lt.eq C_H + 4 log frac(1, 1 - \| z \|) + phi.alt \( z \) #h(2em) \( z in bb(B) \) . $ <base:no-minorant>]

]
] <base:existence>

For any smooth real $phi.alt$ on $bb(B)$, define its Hartogs domain by

#[#set math.equation(numbering: n => "(2.5)")
 $ M_phi.alt = { \( z \, w \) in bb(B) times bb(C) : t \( z \, w \) < 1 } \, #h(2em) t \( z \, w \) = e^(phi.alt \( z \)) \| w \|^2 . $ <metric:domain>]

For $lambda > 0$ define the potential and its complex Hessian by

#[#set math.equation(numbering: n => "(2.6)")
 $ cal(K)_lambda = lambda psi - log \( 1 - t \) \, #h(2em) hat(g)_lambda = partial macron(partial) cal(K)_lambda . $ <metric:potential>]

Our real metric convention is $g_lambda = 2 "Re" hat(g)_lambda$: if a real vector $X$ has $\( 1 \, 0 \)$ part $u$, then $g_lambda \( X \, X \) = 2 hat(g)_lambda \( u \, u \)$.

#thm([Proposition 2.2.])[
  (Hartogs metric transfer).  #emph[Let $phi.alt in C^oo \( bb(B) \, bb(R) \)$ satisfy (2.2) and (2.3) for fixed $0 < c lt.eq C < oo$. There is a finite $lambda_0 = lambda_0 \( c \, C \) > 0$ such that, for every $lambda gt.eq lambda_0$, the domain $M_phi.alt$ in (2.5) is contractible and the tensor $g_lambda = 2 "Re" hat(g)_lambda$ defined by (2.6) is a smooth geodesically complete Kähler metric. For this fixed $lambda$ there are constants $0 < A_lambda lt.eq B_lambda < oo$ such that 
$ - B_lambda lt.eq K_(g_lambda) \( sigma \) lt.eq - A_lambda < 0 $

 for every point of $M_phi.alt$ and every real two-plane $sigma$ in its tangent space.]
] <metric:transfer>

The proof of Proposition 2 occupies the analytic construction below. The global geometry and curvature calculation in Sections 7–9 prove Proposition 3. We first establish the short argument that connects their conclusions to bounded holomorphic maps.

=== 2.2 The Jacobian on the zero section <the-jacobian-on-the-zero-section>

#thm([Lemma 2.3.])[
  #emph[Let $phi.alt in C^oo \( bb(B) \, bb(R) \)$ have the nonexistence property in Proposition 2: no holomorphic $H$ and real constant $C_H$ satisfy (2.4). Then no bounded holomorphic map $F : M_phi.alt arrow.r bb(C)^3$ has a nowhere-vanishing complex Jacobian determinant.]
] <map:obstruction>

#proof[
  Suppose that $F = \( F_1 \, F_2 \, F_3 \)$ is such a map, and choose $B gt.eq 1$ so that $\| F_ell \| lt.eq B$ on $M_phi.alt$ for every component. Since $M_phi.alt$ is open in $bb(C)^3$, its coordinates $\( z_1 \, z_2 \, w \)$ are global. The function
  $ d \( z \) = det frac(partial \( F_1 \, F_2 \, F_3 \), partial \( z_1 \, z_2 \, w \)) \( z \, 0 \) $
  is holomorphic and nowhere zero on $bb(B)$.
  Fix $z in bb(B)$ and put $delta = 1 - \| z \|$. The restriction $F_ell \( thin dot.op thin \, 0 \)$ is bounded and holomorphic on the entire base ball. For $j = 1 \, 2$, the disk ${ z + zeta e_j : \| zeta \| < delta }$ is contained in that ball. Cauchy’s estimate, applied on disks with radii tending to $delta$, gives
  #[#set math.equation(numbering: n => "(2.7)")
   $ \| partial_(z_j) F_ell \( z \, 0 \) \| lt.eq B delta^(- 1) . $ <map:base-cauchy>]
  For this fixed $z$, the fiber in $M_phi.alt$ is the disk of radius $e^(- phi.alt \( z \) \/ 2)$. Cauchy’s estimate on this disk gives
  #[#set math.equation(numbering: n => "(2.8)")
   $ \| partial_w F_ell \( z \, 0 \) \| lt.eq B e^(phi.alt \( z \) \/ 2) . $ <map:fiber-cauchy>]
  In particular, the base estimate requires no uniform fiber radius near $z$; it is taken entirely on the zero section.
  The six terms in the determinant expansion, together with (2.7) and (2.8), yield
  $ \| d \( z \) \| lt.eq 6 B^3 delta^(- 2) e^(phi.alt \( z \) \/ 2) \, $
  and hence
  #[#set math.equation(numbering: n => "(2.9)")
   $ log \| d \( z \) \|^2 lt.eq 2 log 6 + 6 log B + 4 log frac(1, 1 - \| z \|) + phi.alt \( z \) . $ <map:determinant-bound>]
  Because $bb(B)$ is simply connected and $d$ has no zeros, it has a global holomorphic logarithm $ell$. For example, a primitive of the closed holomorphic one-form $d^(- 1) partial d$, with a suitable constant, satisfies $e^ell = d$. The holomorphic function $H = 2 ell$ has $"Re" H = log \| d \|^2$, so (2.9) contradicts (2.4). ◻
]

#proof[
  Choose $phi.alt$ from Proposition 2, and then choose $lambda$ as in Proposition 3. The domain $M = M_phi.alt subset bb(C)^3$ is contractible and carries the asserted smooth complete Kähler metric with two uniform negative real-sectional bounds. Lemma 4 excludes a bounded holomorphic map to $bb(C)^3$ with nowhere-vanishing Jacobian. A biholomorphism to a bounded domain would be such a map: the chain rule applied to its holomorphic inverse makes its Jacobian invertible everywhere. ◻
]

The logarithm argument uses nonvanishing along the entire zero section. It gives no assertion that a bounded map’s determinant vanishes identically. Nor are all bounded holomorphic functions constant: $z_1$ and $z_2$ are nonconstant bounded holomorphic functions on $M_phi.alt$.

== 3 Separated homogeneous peaks <sec:peaks>

We begin the construction of the potential in Proposition 2. Its analytic requirement will follow from increasingly negative averages against positive measures that preserve holomorphic means. The following observation explains the role of those measures before we construct them.

Write $S = { xi in bb(C)^2 : \| xi \| = 1 }$, and let $sigma$ be its surface measure normalized to have mass one. A probability measure $mu$ on $S$ #emph[represents holomorphic evaluation at zero] if

$ integral_S p \( xi \) thin d mu \( xi \) = p \( 0 \) quad upright("for every holomorphic polynomial ") p . $

#thm([Lemma 3.1.])[
  (Representing-mean criterion).  #emph[Let $u$ be a continuous real function on $bb(B)$. Suppose there are radii $0 < r_N < 1$ and representing probabilities $mu_N$ on $S$ such that 
$ integral_S u \( r_N xi \) thin d mu_N \( xi \) arrow.r - oo . $

 Then no holomorphic function $H$ on $bb(B)$ and constant $C_H$ satisfy $"Re" H lt.eq C_H + u$ on $bb(B)$.]
] <peaks:mean-criterion>

#proof[
  For each fixed $r_N < 1$, the Taylor polynomials of $H$ converge uniformly on $r_N S$. The representing identities therefore give
  $ integral_S "Re" H \( r_N xi \) thin d mu_N \( xi \) = "Re" H \( 0 \) . $
  Integrating the proposed inequality contradicts the assumed limit. ◻
]

We will apply this criterion to $u \( z \) = phi.alt \( z \) + 4 log \( 1 \/ \( 1 - \| z \| \) \)$. The first ingredient is a supply of homogeneous polynomials with many separated peaks. Their uniform bounds will also control the derivatives of the eventual potential.

=== 3.1 Projective packing and polynomial bounds <projective-packing-and-polynomial-bounds>

The projective distance and separated-power estimate used here occur in the direct construction of Ryll and Wojtaszczyk #cite(label("RyllWojtaszczyk1983")) p. 112 and Lemma 2.7. We give the packing argument with a Gaussian tail and an adjustable spacing parameter, since the density corrections will require both. Related constructions with peaks localized in nonisotropic sphere balls appear in Aleksandrov #cite(label("Aleksandrov1983")) Lemmas 2–3; the caps used here are invariant under a common phase rotation.

Identify complex lines in $bb(C)^2$ with points of $bb(C P)^1$. For unit representatives define

$ d \( \[ xi \] \, \[ p \] \) = sqrt(1 - \| chevron.l xi \, p chevron.r \|^2) \, $

where the Hermitian inner product is linear in its first argument. This equals the operator norm distance between the rank-one orthogonal projections onto the two lines: their difference has trace zero and eigenvalues $plus.minus sqrt(1 - \| chevron.l xi \, p chevron.r \|^2)$. The triangle inequality for the operator norm therefore proves that $d$ is a metric. We also write $d \( xi \, p \)$ when the representatives are understood.

In unitary coordinates with $xi_1 = chevron.l xi \, p chevron.r$, write

$ xi = \( e^(i theta) cos v \, e^(i gamma) sin v \) \, #h(2em) 0 lt.eq v lt.eq pi \/ 2 . $

The round volume element is $cos v sin v thin d v thin d theta thin d gamma$. After normalization and the change of variable $u = cos^2 v$, this gives

#[#set math.equation(numbering: n => "(3.1)")
 $ d sigma = d u thin frac(d theta, 2 pi) frac(d gamma, 2 pi) \, #h(2em) 0 lt.eq u lt.eq 1 . $ <peaks:sphere-measure>]

In particular, a projective cap $d \( xi \, p \) < s$ has measure $s^2$ for $0 lt.eq s lt.eq 1$.

Fix $D_0 gt.eq 1$. For an integer $k gt.eq D_0^2$, choose a maximal $D_0 \/ sqrt(k)$-separated set of lines, and choose one unit representative $p$ for each line. Let $cal(P)_k$ denote this set of representatives and $N_k = \| cal(P)_k \|$. Define the homogeneous holomorphic polynomial

#[#set math.equation(numbering: n => "(3.2)")
 $ P_k \( z \) = sum_(p in cal(P)_k) chevron.l z \, p chevron.r^k . $ <peaks:polynomial>]

The representatives may be chosen arbitrarily; the estimates below hold for every such choice.

#thm([Lemma 3.2.])[
  (Peak bounds).  #emph[There are absolute constants $C \, c > 0$, independent of $D_0 gt.eq 1$, such that 
#[#set math.equation(numbering: n => "(3.3)")
 $ k / D_0^2 lt.eq N_k lt.eq frac(4 k, D_0^2) $ <peaks:count>]

 and, for every $xi in S$ and $u gt.eq 0$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ sum_(p in cal(P)_k\
sqrt(k) d \( xi \, p \) gt.eq u) \| chevron.l xi \, p chevron.r \|^k lt.eq C e^(- c u^2) . $ <peaks:gaussian>]

 Consequently, 
#[#set math.equation(numbering: n => "(3.5)")
 $ \| P_k \( z \) \| lt.eq C \| z \|^k quad \( z in bb(C)^2 \) \, #h(2em) integral_S \| P_k \| thin d sigma lt.eq frac(2 N_k, k + 2) . $ <peaks:global>]

]
] <peaks:bounds>

#proof[
  Put $rho = D_0 \/ sqrt(k) lt.eq 1$. Maximality gives a covering by caps of radius $rho$, and separation gives disjoint interiors for caps of radius $rho \/ 2$. Their measures yield $1 lt.eq N_k rho^2$ and $N_k rho^2 \/ 4 lt.eq 1$, proving (3.3).
  We also need a local count whose constant does not depend on $D_0$. About the centers within distance $u \/ sqrt(k)$ of a fixed line, place caps of radius $1 \/ \( 3 sqrt(k) \)$. Their interiors are disjoint, and they lie inside the cap of radius $\( u + 1 \/ 3 \) \/ sqrt(k)$ about that line. Comparing measures bounds their number by $9 \( u + 1 \/ 3 \)^2$ when the latter radius is at most one. Otherwise their number is at most $9 k lt.eq 9 \( u + 1 \/ 3 \)^2$, by comparison with the whole space. Thus the local count is at most $C \( 1 + u \)^2$ in all cases.
  Since
  $ \| chevron.l xi \, p chevron.r \|^k = \( 1 - d \( xi \, p \)^2 \)^(k \/ 2) lt.eq e^(- k d \( xi \, p \)^2 \/ 2) \, $
  the contribution from the annulus $n lt.eq sqrt(k) d \( xi \, p \) < n + 1$ is at most $C \( n + 2 \)^2 e^(- n^2 \/ 2)$. Summing these bounds from $n = floor.l u floor.r$ onward proves (3.4): the polynomial factor is absorbed by a weaker Gaussian exponent, and the range $0 lt.eq u lt.eq 2$ is absorbed by the constant. Setting $u = 0$ and using homogeneity gives the first assertion in (3.5), including points outside the unit ball. Finally, (3.1) gives
  $ integral_S \| chevron.l xi \, p chevron.r \|^k thin d sigma = integral_0^1 u^(k \/ 2) thin d u = frac(2, k + 2) . $
  The triangle inequality proves the stated integral bound. ◻
]

=== 3.2 Patches and a radial profile <patches-and-a-radial-profile>

For a fixed $R_0 > 0$ and a center $p in cal(P)_k$, use the adapted coordinates above and put

#[#set math.equation(numbering: n => "(3.6)")
 $ y = - k log \| xi_1 \| \, #h(2em) cal(U)_(k \, p) = { xi in S : 0 lt.eq y < R_0 } . $ <peaks:patch-definition>]

The set $y = 0$ is the phase circle through $p$. Every patch is invariant under multiplication of $xi$ by a common phase.

#thm([Lemma 3.3.])[
  (Patch estimates).  #emph[Fix $R_0 > 0$. If $D_0 > max { 1 \, 2 sqrt(2 R_0) }$ and $k gt.eq max { D_0^2 \, 2 R_0 }$, the patches $cal(U)_(k \, p)$ are pairwise disjoint. On each patch, 
#[#set math.equation(numbering: n => "(3.7)")
 $ d sigma = 2 / k e^(- 2 y \/ k) thin d y thin frac(d theta, 2 pi) frac(d gamma, 2 pi) \, $ <peaks:patch-measure>]

 and 
#[#set math.equation(numbering: n => "(3.8)")
 $ \| P_k \( xi \) - e^(- y) e^(i k theta) \| lt.eq C e^(- c \( D_0 - sqrt(2 R_0) \)^2) . $ <peaks:single-peak>]

 Outside their union, 
#[#set math.equation(numbering: n => "(3.9)")
 $ \| P_k \( xi \) \| lt.eq C e^(- c R_0) . $ <peaks:off-patch>]

 The constants $C \, c$ can be chosen independently of $R_0 \, D_0 \, k$.]
] <peaks:patches>

#proof[
  The projective radius of a patch is $sqrt(1 - e^(- 2 R_0 \/ k)) lt.eq sqrt(2 R_0 \/ k)$, so the separation of the centers makes the patches disjoint. Formula (3.7) follows from $\| xi_1 \|^2 = e^(- 2 y \/ k)$ in (3.1).
  If $xi in cal(U)_(k \, p)$ and $p' eq.not p$ is another center, the metric triangle inequality gives
  $ sqrt(k) d \( xi \, p' \) gt.eq D_0 - sqrt(2 R_0) . $
  The peak from $p$ is exactly $e^(- y) e^(i k theta)$. Summing all other peaks by (3.4) proves (3.8). Outside every patch, each center satisfies
  $ k d \( xi \, p \)^2 gt.eq k \( 1 - e^(- 2 R_0 \/ k) \) gt.eq R_0 . $
  The final inequality uses $k gt.eq 2 R_0$ and $1 - e^(- v) gt.eq v \/ 2$ for $0 lt.eq v lt.eq 1$. Another application of (3.4) proves (3.9). ◻
]

The density correction will use a radial profile with an exact weighted cancellation. The following choice also supplies the strict inequality needed for the logarithmic tests later.

#thm([Lemma 3.4.])[
  (Radial profiles).  #emph[Fix $1 < a < 2$ and put $alpha = log a$. One can choose $0 < s_1 < 1$, smooth real functions $f \, b$ on $\[ 0 \, oo \)$, and $R_0 > 0$ such that 
#[#set math.equation(numbering: n => "(3.10)")
 $ alpha^2 - 2 s_1 \( cosh alpha - 1 \) < 0 \, $ <peaks:profile-negativity>]

 
#[#set math.equation(numbering: n => "(3.11)")
 $ parallel f parallel_oo < 1 \, quad f = - s_1 med upright("on ") \[ 0 \, alpha \] \, quad integral_0^oo e^(- y) f \( y \) thin d y = 0 \, quad b' - b = f \, quad b \( 0 \) = 0 . $ <peaks:profile-identities>]

 Both functions vanish on a neighborhood of $\[ R_0 \, oo \)$. Moreover, $R_0$ can be chosen so that $\| a P_k \| lt.eq 1 \/ 2$ off the patches whenever the hypotheses of Lemma 7 hold.]
] <peaks:profiles>

#proof[
  The strict inequality $2 \( cosh alpha - 1 \) > alpha^2$ allows a choice
  $ frac(alpha^2, 2 \( cosh alpha - 1 \)) < s_1 < 1 . $
  Since $a < 2$, this choice also satisfies $s_1 \( 1 - e^(- alpha) \) < e^(- alpha)$. Choose a small $delta > 0$ and a smooth cutoff $chi$, equal to one on $\[ 0 \, alpha \]$, between zero and one, and zero for $y gt.eq alpha + delta$. For sufficiently small $delta$,
  $ N = s_1 integral_0^oo e^(- y) chi \( y \) thin d y < e^(- \( alpha + 2 delta \)) . $
  Choose a smooth compactly supported function $nu$, supported strictly after $alpha + 2 delta$, with $0 lt.eq nu lt.eq 1$, and with
  $ P = integral_0^oo e^(- y) nu \( y \) thin d y > N . $
  Such a function is obtained by approximating the indicator of a sufficiently long interval beginning just after $alpha + 2 delta$. Then $f = - s_1 chi + \( N \/ P \) nu$ has the required plateau and weighted integral. The two supports are disjoint, so $parallel f parallel_oo lt.eq max { s_1 \, N \/ P } < 1$.
  Define
  $ b \( y \) = e^y integral_0^y e^(- v) f \( v \) thin d v . $
  It satisfies $b' - b = f$ and $b \( 0 \) = 0$. Beyond the support of $f$, the integral is exactly zero by the weighted cancellation, so $b$ also has compact support. Near zero, $b \( y \) = - s_1 \( e^y - 1 \)$, which is smooth up to the boundary of the half-line. Smoothness here does not require extending $f$ by zero to negative arguments. Finally choose $R_0$ larger than both supports, and enlarge it further until $a C e^(- c R_0) lt.eq 1 \/ 2$ in (3.9). ◻
]

The plateau $0 lt.eq y lt.eq alpha$ is exactly the region where the model peak $a e^(- y)$ has modulus at least one. For the profiles just constructed, the integral of $log \| 1 - a e^(- y) e^(i t') \|^2$ against $\( 1 + f \( y \) cos t' \) thin d y thin d t' \/ \( 2 pi \)$ on $\[ 0 \, R_0 \] times \[ 0 \, 2 pi \]$ equals $alpha^2 - 2 s_1 \( cosh alpha - 1 \)$, as calculated in (5.7). Thus the strict profile inequality prescribes a negative logarithmic integral, while the weighted cancellation will preserve holomorphic moments.

Fix these profiles and $R_0$ from now on. The spacing $D_0$ and the degrees will remain available to be chosen sufficiently large. In particular, enlarging $D_0$ later improves the single-peak approximation without altering the profiles.

== 4 Positive representing densities <sec:densities>

We now construct the representing probabilities required by Lemma 5. Each step adds an oscillation on the current patches. A radial integration by parts makes every holomorphic moment of that oscillation vanish exactly. The separation between consecutive degrees will ensure that the new density stays positive.

Keep the profiles $f \, b \, R_0$ from Lemma 8 fixed, and put

$ c_0 = frac(1 - parallel f parallel_oo, 4) > 0 . $

Fix any $D_0 > max { 1 \, 2 sqrt(2 R_0) }$. For an integer $Q gt.eq 2$ large enough that every degree below meets the patch thresholds, put

#[#set math.equation(numbering: n => "(4.1)")
 $ k_j = Q^j \, #h(2em) ell_0 = 0 \, #h(2em) ell_j = sum_(l = 1)^j k_l quad \( j gt.eq 1 \) . $ <density:degrees>]

Thus $ell_(j - 1) < k_j$ and $ell_j < 2 k_j$. At each degree use any of the separated sets and patches constructed in Section 3.

Start with $W_0 = 1$. At stage $j$, set $k = k_j$. For each $p in cal(P)_k$ let

$ S_p \( theta \) = W_(j - 1) \( e^(i theta) p \) . $

To determine the correction, consider a phase mode $e^(i s theta)$ with $\| s \| lt.eq ell_(j - 1)$, the frequency range maintained below. Multiplication by $e^(i k theta)$ shifts it to frequency $m = k + s > 0$; its conjugate can pair with the holomorphic monomial $xi_1^m = e^(- m y \/ k) e^(i m theta)$. After canceling the surface-measure factor $e^(- 2 y \/ k)$, its radial moment will vanish if its coefficient is $b' - \( m \/ k \) b$, because

$ e^(- m y \/ k) (b' - m / k b) = frac(d, d y) (e^(- m y \/ k) b) \, #h(2em) b \( 0 \) = b \( R_0 \) = 0 . $

The identity $f = b' - b$ therefore prescribes the coefficient $f - \( s \/ k \) b$ for this mode. Summing the modes leads to the following definition in the adapted coordinates of $cal(U)_(k \, p)$:

#[#set math.equation(numbering: n => "(4.2)")
 $ A_(j \, p) \( xi \) & = e^(2 y \/ k) "Re" [e^(i k theta) (f \( y \) S_p \( theta \) - b \( y \) frac(S'_p \( theta \), i k))] \,\
W_j & = W_(j - 1) + sum_(p in cal(P)_k) A_(j \, p) \, $ <density:recursion>]

where each correction is extended by zero off its patch. The prime on $S_p$ denotes differentiation in $theta$. This recursion is defined without assuming positivity; that property will be proved for one fixed sufficiently large $Q$.

#thm([Lemma 4.1.])[
  (Smoothness of the corrections).  #emph[Every $W_j$ defined by (4.2) is a smooth real function on $S$.]
] <density:smooth>

#proof[
  Proceed by induction, beginning with $W_0 = 1$. The restriction $S_p$ is a smooth periodic function. To check the central circle of a patch, use the smooth coordinates
  $ \( theta \, zeta \) mapsto \( e^(i theta) sqrt(1 - \| zeta \|^2) \, zeta \) \, #h(2em) y = - k / 2 log \( 1 - \| zeta \|^2 \) . $
  All terms of (4.2) are smooth in these coordinates, including at $zeta = 0$. They do not depend on the transverse polar angle $gamma$, which would be singular there. Their dependence on $theta$ is periodic, so it defines a smooth function along the full central circle. At the outer boundary, $f$ and $b$ vanish in a collar of $R_0$; hence the correction is identically zero in a collar of the patch boundary. Its extension by zero is therefore smooth. Summing the finitely many corrections proves the induction. ◻
]

Let $T$ denote the phase derivative on $S$,

$ T W \( xi \) = frac(d, d omega) W \( e^(i omega) xi \)\|_(omega = 0) . $

A horizontal vector $Z in T_xi S$ will always mean a #emph[Euclidean unit] real tangent vector satisfying the complex equation $chevron.l Z \, xi chevron.r = 0$.

A function has phase bandwidth at most $ell$ if, on every orbit $omega mapsto e^(i omega) xi$, it is a trigonometric polynomial with frequencies in $\[ - ell \, ell \]$. Its orbitwise mean is the constant coefficient of this polynomial.

#thm([Theorem 4.2.])[
  (Uniform representing densities).  #emph[There is a constant $K_(*) > 0$, depending only on the fixed profiles $f \, b$ and $R_0$, with the following property. For every fixed $D_0 > max { 1 \, 2 sqrt(2 R_0) }$ there is an integer threshold $Q_0$ such that, for every integer $Q gt.eq Q_0$ and every choice of the separated sets above, the recursion (4.2) has the following properties for all $j gt.eq 1$:]
  + #emph[$W_j$ is smooth and strictly positive, and $W_j thin d sigma$ represents holomorphic evaluation at zero. In particular it is a probability measure.]
  + #emph[Under global phase rotation, $W_j$ has frequencies only between $- ell_j$ and $ell_j$, and its mean on every phase orbit is exactly one.]
  + #emph[At every point of $S$, 
#[#set math.equation(numbering: n => "(4.3)")
 $ c_0 W_(j - 1) lt.eq W_j lt.eq 2 W_(j - 1) \,\
\| Z W_j \| lt.eq K_(*) sqrt(k_j) thin W_j \, #h(2em) \| T W_j \| lt.eq K_(*) k_j W_j $ <density:uniform-bounds>]

 for every unit horizontal vector $Z$.]
  #emph[The threshold $Q_0$ may also be enlarged to impose any fixed lower threshold on the degrees $k_j$.]
] <density:main>

We first prove the exact moment and frequency assertions; they hold before positivity is known. The remainder of the theorem, including the order of choices of $K_(*)$ and $Q_0$, is proved in the next subsection.

=== 4.1 Exact moments and phase frequencies <exact-moments-and-phase-frequencies>

#thm([Lemma 4.3.])[
  (Moment preservation).  #emph[For every stage of (4.2), the phase bandwidth of $W_j$ is at most $ell_j$, its orbitwise mean is one, and 
#[#set math.equation(numbering: n => "(4.4)")
 $ integral_S p \( xi \) W_j \( xi \) thin d sigma \( xi \) = p \( 0 \) quad upright("for every holomorphic polynomial ") p . $ <density:representing>]

 Each individual correction has zero integral against every such polynomial, including the constant polynomial.]
] <density:moments>

#proof[
  At stage zero the phase assertions are immediate. The polynomial identity for $sigma$ follows by global phase averaging: every nonconstant homogeneous holomorphic polynomial has nonzero positive phase frequency.
  Assume the assertions through stage $j - 1$, and write $k = k_j$. The central restriction has a finite expansion
  $ S_p \( theta \) = sum_(\| s \| lt.eq ell_(j - 1)) hat(S)_p \( s \) e^(i s theta) \, #h(2em) hat(S)_p \( 0 \) = 1 . $
  Since $b' - b = f$, the bracket in (4.2) is
  $ sum_s hat(S)_p \( s \) (b' - frac(k + s, k) b) e^(i s theta) . $
  All integers $m = k + s$ are positive because $ell_(j - 1) < k$. The patch and $y$ are invariant under global phase rotation, whereas $theta$ increases by the rotation angle. Hence the correction has frequencies in
  #[#set math.equation(numbering: n => "(4.5)")
   $ \[ k - ell_(j - 1) \, k + ell_(j - 1) \] med union med \[ - k - ell_(j - 1) \, - k + ell_(j - 1) \] . $ <density:bandwidth>]
  They omit zero. Multiplying by a function of $y$ and extending by zero across the invariant patch boundary do not alter these frequencies. The bandwidth of $W_j$ is thus at most $k + ell_(j - 1) = ell_j$, and its orbitwise mean remains one.
  For the full moment calculation, use an adapted monomial $xi_1^n xi_2^l$, with nonnegative integers $n \, l$. If $l > 0$, averaging in the transverse phase $gamma$ gives zero. If $l = n = 0$, averaging in $theta$ gives zero because all $m = k + s$ are positive. Suppose then that $l = 0$ and $n gt.eq 1$. As $b$ is real, the correction is
  $ A_(j \, p) = e^(2 y \/ k) / 2 sum_s (hat(S)_p \( s \) e^(i \( k + s \) theta) + overline(hat(S)_p \( s \)) e^(- i \( k + s \) theta)) (b' - frac(k + s, k) b) . $
  Since $xi_1^n = e^(- n y \/ k) e^(i n theta)$, only the conjugate frequency with $k + s = n$ can survive the $theta$ integration. Formula (3.7) gives exactly
  $ integral_(cal(U)_(k \, p)) xi_1^n A_(j \, p) thin d sigma & = overline(hat(S)_p \( n - k \)) / k integral_0^(R_0) e^(- n y \/ k) (b' - n / k b) d y\
 & = overline(hat(S)_p \( n - k \)) / k [e^(- n y \/ k) b \( y \)]_0^(R_0) = 0 . $
  Here a coefficient outside the previous bandwidth is zero. The factor $2 \/ k$ in surface measure combines with the $1 \/ 2$ from the real part to leave $1 \/ k$. Both endpoint terms vanish because $b \( 0 \) = b \( R_0 \) = 0$. The argument applies to every degree $n$, without a degree cutoff. Unitary changes of coordinates preserve holomorphic polynomials, so each correction annihilates every polynomial in the original coordinates. Adding the corrections proves (4.4) and completes the induction. ◻
]

In particular, every $W_j$ has total integral one. What remains for Theorem 10 is to prove that these exact representing densities are positive with the uniform derivative bounds. The next estimates accomplish this with a single choice of $Q$, independent of the number of stages.

=== 4.2 Uniform positivity and derivative estimates <uniform-positivity-and-derivative-estimates>

We now prove the remaining assertions of Theorem 10. The main point is to choose one derivative constant $K_(*)$, followed by one threshold for $Q$, that works at every stage. A phase derivative of the correction in (4.2) involves $S''_p$. We obtain a bound for this derivative from the frequency support and the estimates already proved at earlier stages.

#thm([Lemma 4.4.])[
  (Growth along phase orbits).  #emph[Suppose $Q gt.eq 2$, $k_j = Q^j$, and the positive functions $W_0 = 1 \, W_1 \, dots.h \, W_n$, with $n gt.eq 1$, satisfy 
$ c_0 W_(j - 1) lt.eq W_j lt.eq 2 W_(j - 1) \, #h(2em) \| T W_j \| lt.eq K_(*) k_j W_j quad \( 1 lt.eq j lt.eq n \) . $

 Put 
$ R = 2 / c_0 \, #h(2em) beta = log_2 R . $

 For every $p in S$, the function $S_p \( theta \) = W_n \( e^(i theta) p \)$ satisfies 
#[#set math.equation(numbering: n => "(4.6)")
 $ S_p \( theta + u \) lt.eq e^(K_(*)) R \( 1 + k_n \| u \| \)^beta S_p \( theta \) \, #h(2em) \| u \| lt.eq pi . $ <density:orbit-growth-bound>]

 In particular, the constants in this bound are independent of $Q \, n \, p$.]
] <density:orbit-growth>

#proof[
  Choose the largest $1 lt.eq l lt.eq n$ such that $k_l \| u \| lt.eq 1$, or put $l = 0$ if no such index exists. The comparisons between successive densities give
  $ frac(W_n \( e^(i \( theta + u \)) p \), W_n \( e^(i theta) p \)) lt.eq R^(n - l) frac(W_l \( e^(i \( theta + u \)) p \), W_l \( e^(i theta) p \)) . $
  When $l gt.eq 1$, logarithmic differentiation and the phase derivative bound show that the last ratio is at most $exp \( K_(*) k_l \| u \| \) lt.eq e^(K_(*))$. For $l = 0$ it equals one. If $l = n$, this already proves the assertion. Otherwise the maximality of $l$, including the case $l = 0$, gives
  $ k_n \| u \| > Q^(n - l - 1) gt.eq 2^(n - l - 1) . $
  It follows that $R^(n - l) lt.eq R \( 1 + k_n \| u \| \)^beta$, proving (4.6). ◻
]

#thm([Lemma 4.5.])[
  (A weighted derivative bound).  #emph[Fix $A gt.eq 1$ and $beta gt.eq 0$. Let $q gt.eq 1$ be an integer, and let $s$ be a positive trigonometric polynomial of degree at most $2 q$. Suppose that 
$ s \( theta + u \) lt.eq A \( 1 + q \| u \| \)^beta s \( theta \) #h(2em) \( theta in bb(R) \, med \| u \| lt.eq pi \) . $

 There is a constant $C \( A \, beta \)$, independent of $q \, s$, such that 
$ \| s'' \( theta \) \| lt.eq C \( A \, beta \) q^2 s \( theta \) . $

]
] <density:weighted-derivative>

#proof[
  Choose a fixed smooth compactly supported function $chi : bb(R) arrow.r bb(R)$ which equals one on $\[ - 2 \, 2 \]$, and put
  $ K_q \( u \) = sum_(h in bb(Z)) chi \( h \/ q \) e^(i h u) . $
  For normalized convolution on the circle, the frequency assumption implies $s'' = s * K''_q$. We claim that, for every positive integer $N$,
  #[#set math.equation(numbering: n => "(4.7)")
   $ \| K''_q \( u \) \| lt.eq C_N q^3 \( 1 + q \| u \| \)^(- N) \, #h(2em) \| u \| lt.eq pi \, $ <density:kernel-decay>]
  where $C_N$ depends only on $N \, chi$.
  Indeed the coefficients of $K''_q$ are
  $ a_h = - h^2 chi \( h \/ q \) = q^2 g \( h \/ q \) \, #h(2em) g \( v \) = - v^2 chi \( v \) . $
  There are $O \( q \)$ nonzero coefficients, each of size $O \( q^2 \)$, so direct summation gives $\| K''_q \| lt.eq C q^3$. An $N$-th finite difference of $a_h$ is an iterated integral of the $N$-th derivative of $q^2 g \( v \/ q \)$, and hence has size at most $C_N q^(2 - N)$. Only $O_N \( q \)$ such differences can be nonzero, since $g$ is compactly supported and $q gt.eq 1$. Their absolute sum is therefore at most $C_N q^(3 - N)$. Multiplication of the Fourier series by $\( 1 - e^(i u) \)^N$ produces these differences, up to an index shift. Using $\| 1 - e^(i u) \| gt.eq 2 \| u \| \/ pi$ on $\[ - pi \, pi \]$ gives the second estimate
  $ \| K''_q \( u \) \| lt.eq C_N q^(3 - N) \| u \|^(- N) #h(2em) \( u eq.not 0 \) . $
  Combining it with the direct estimate proves (4.7).
  Choose an integer $N > beta + 1$. Positivity, the assumed growth bound, and (4.7) now give
  $ \| s'' \( theta \) \| & lt.eq integral_(- pi)^pi s \( theta - u \) \| K''_q \( u \) \| thin frac(d u, 2 pi)\
 & lt.eq A C_N q^3 s \( theta \) integral_(- pi)^pi \( 1 + q \| u \| \)^(beta - N) thin frac(d u, 2 pi)\
 & lt.eq C \( A \, beta \) q^2 s \( theta \) . $
  ◻
]

Combining these two lemmas with the bandwidth assertion of Lemma 11 gives the following consequence. If the estimates of Theorem 10 hold through stage $j - 1$, then for $k = k_j$ and the central function $S_p$ in (4.2),

#[#set math.equation(numbering: n => "(4.8)")
 $ frac(\| S'_p \|, k S_p) lt.eq K_(*) / Q \, #h(2em) frac(\| S''_p \|, k^2 S_p) lt.eq C_1 / Q^2 \, $ <density:central-derivatives>]

where $C_1$ depends only on $K_(*) \, c_0$ and the fixed cutoff $chi$. It is independent of $Q \, j \, p$. For $j gt.eq 2$, apply the lemmas with $q = k_(j - 1)$, noting that $ell_(j - 1) lt.eq 2 k_(j - 1)$; the first inequality follows directly from the phase derivative bound. For $j = 1$, both derivatives vanish because $S_p = 1$.

We next estimate a single correction using only normalized bounds. This will allow us to choose $K_(*)$ before requiring (4.8) to be small. All horizontal vectors $Z$ below have Euclidean length one. Enlarge a constant $D_R gt.eq 1$, depending only on $R_0$, so that on every patch at every sufficiently large degree $k$,

#[#set math.equation(numbering: n => "(4.9)")
 $ \| Y y \| lt.eq D_R \, #h(2em) \| Y theta \| lt.eq D_R \/ k \, #h(2em) \| Y \( e^(i k theta) \) \| lt.eq D_R \, quad Y = Z \/ sqrt(k) med upright("or") med Y = T \/ k . $ <density:patch-directions>]

Here is a direct verification. With $c = chevron.l xi \, p chevron.r$, complex horizontality gives

$ \| Z c \| lt.eq sqrt(1 - \| c \|^2) lt.eq sqrt(2 R_0 \/ k) \, #h(2em) \| c \| gt.eq e^(- R_0 \/ k) . $

Differentiate $y = - k log \| c \|$ and $theta = arg c$ to obtain the first two bounds for $Z \/ sqrt(k)$; the third follows from the second. For $T \/ k$, one has $Y y = 0$ and $Y theta = 1 \/ k$. The fixed lower threshold for $k$ makes $e^(- R_0 \/ k) gt.eq 1 \/ 2$. We also choose $D_R$ large enough to bound the length of the radial arc from $e^(i theta) p$ to each patch point by $D_R \/ sqrt(k)$. In adapted coordinates this arc is

$ u mapsto \( e^(i theta) cos u \, e^(i gamma) sin u \) \, #h(2em) 0 lt.eq u lt.eq arccos \( e^(- y \/ k) \) . $

It has unit speed and is complex-horizontal. The length bound follows from $0 lt.eq y lt.eq R_0$ and $1 - e^(- y \/ k) lt.eq R_0 \/ k$. Fix this enlarged $D_R$ throughout the rest of the proof.

#thm([Lemma 4.6.])[
  (Normalized correction estimate).  #emph[Write 
$ F = parallel f parallel_oo \, quad B = parallel b parallel_oo \, quad F_1 = parallel f' parallel_oo \, quad B_1 = parallel b' parallel_oo . $

 On a degree-$k$ patch suppose $W_(j - 1) > 0$, $S_p > 0$, and 
$ frac(e^(2 y \/ k) S_p, W_(j - 1)) lt.eq 2 \, #h(2em) r_1 = frac(\| S'_p \|, k S_p) lt.eq 1 \, #h(2em) r_2 = frac(\| S''_p \|, k^2 S_p) lt.eq 1 . $

 For the correction $A_(j \, p)$ in (4.2), 
$ \| Y A_(j \, p) \| lt.eq C_2 W_(j - 1) \, quad Y = Z \/ sqrt(k) med upright("or") med T \/ k \, #h(2em) C_2 = 2 D_R #scale(x: 120%, y: 120%)[\[] 4 \( F + B \) + F_1 + B_1 #scale(x: 120%, y: 120%)[\]] . $

 In particular, $C_2$ is independent of $K_(*) \, Q \, j \, p$.]
] <density:normalized-patch>

#proof[
  Besides (4.9), use
  $ \| Y \( e^(2 y \/ k) \) \| lt.eq \( 2 D_R \/ k \) e^(2 y \/ k) \, #h(2em) \| Y S_p \| lt.eq \( D_R \/ k \) \| S'_p \| \, #h(2em) \| Y S'_p \| lt.eq \( D_R \/ k \) \| S''_p \| . $
  Differentiating (4.2) and taking absolute values gives
  $ \| Y A_(j \, p) \| lt.eq D_R e^(2 y \/ k) S_p [\( 1 + 2 \/ k \) \( F + B r_1 \) + F_1 + B_1 r_1 + F r_1 + B r_2] . $
  Since $k gt.eq 1$, the assumed normalized bounds imply the stated estimate. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 10.] Fix $K_(*) > 2 C_2 \/ c_0$. The constant $C_1$ in (4.8) is now fixed as well. We give a finite list of requirements on $Q$, all independent of the induction stage.
  The horizontal derivative estimate at stage $j - 1$, integrated along the radial arc just described, will imply
  #[#set math.equation(numbering: n => "(4.10)")
   $ e^(- K_(*) D_R \/ sqrt(Q)) lt.eq frac(S_p \( theta \), W_(j - 1) \( xi \)) lt.eq e^(K_(*) D_R \/ sqrt(Q)) . $ <density:central-comparison>]
  Indeed the logarithmic derivative along a unit horizontal arc is at most $K_(*) sqrt(k_(j - 1))$, and the arc length is at most $D_R \/ sqrt(k_j)$. At the initial stage the ratio is exactly one. Since $k_j gt.eq Q$, put
  $ H \( Q \) = exp (K_(*) D_R \/ sqrt(Q) + 2 R_0 \/ Q) . $
  Choose a threshold $Q_0$ such that every integer $Q gt.eq Q_0$ satisfies all earlier degree and patch requirements, and also
  #[#set math.equation(numbering: n => "(4.11)")
   $ Q gt.eq 2 \, #h(2em) H \( Q \) lt.eq 2 \, #h(2em) K_(*) \/ Q lt.eq 1 \, #h(2em) C_1 \/ Q^2 lt.eq 1 \, #h(2em) Q^(- 1 \/ 2) lt.eq c_0 \/ 2 \,\
H \( Q \) \( F + B K_(*) \/ Q \) lt.eq 1 - 2 c_0 . $ <density:Q-conditions>]
  These conditions are compatible: $H \( Q \) arrow.r 1$ and $F = 1 - 4 c_0 < 1 - 2 c_0$.
  We now fix any integer $Q gt.eq Q_0$ and induct on $j$. Assume the claimed estimates through stage $j - 1$; at $j = 1$ the preceding density is the constant one. Equation (4.8), obtained from earlier stages only, and the horizontal comparison (4.10) establish the normalized hypotheses of Lemma 14. Moreover,
  $ \| A_(j \, p) \| lt.eq e^(2 y \/ k) S_p \( F + B r_1 \) lt.eq H \( Q \) \( F + B K_(*) \/ Q \) W_(j - 1) lt.eq \( 1 - 2 c_0 \) W_(j - 1) . $
  At any point at most one patch correction is nonzero. Hence
  $ 2 c_0 W_(j - 1) lt.eq W_j lt.eq \( 2 - 2 c_0 \) W_(j - 1) \, $
  which proves positivity and the required multiplicative comparison.
  For $Y = Z \/ sqrt(k_j)$, the previous derivative bound gives $\| Y W_(j - 1) \| lt.eq \( K_(*) \/ sqrt(Q) \) W_(j - 1)$. For $Y = T \/ k_j$, it gives the smaller coefficient $K_(*) \/ Q$. Together with Lemma 14, (4.11), and the choice of $K_(*)$, these yield
  $ \| Y W_j \| lt.eq \( C_2 + K_(*) \/ sqrt(Q) \) W_(j - 1) lt.eq K_(*) c_0 W_(j - 1) lt.eq K_(*) W_j . $
  Outside the patches the correction vanishes. Its smooth zero extension at their boundaries gives the same estimate there. Multiplying by $sqrt(k_j)$ or $k_j$ proves the two derivative bounds and completes the induction.
  Lemma 11 supplies the exact moments, rotation mean and bandwidth independently of these inequalities. In particular $integral_S W_j thin d sigma = 1$; positivity therefore makes $W_j thin d sigma$ a probability measure. ◻
]

We emphasize the order of the choices. The normalized correction constant $C_2$ depends only on the fixed patch data. It determines $K_(*)$; this in turn determines $C_1$; finally $Q_0$ is chosen. No lower bound for $W_j$ uniform in $j$ is required. The positive comparison at each stage suffices for logarithmic differentiation, and all later integral estimates will use the probability normalization.

== 5 Regularized logarithmic tests <sec:tests>

Keep the profile parameters $a \, alpha \, s_1 \, f \, b \, R_0$ from Lemma 8. We shall construct a smooth plurisubharmonic function at each degree whose average against its representing density is uniformly negative. The same negative bound will hold against all later densities. The estimates are uniform for all sufficiently large integers $Q$, so the final value of $Q$ can be chosen after the regularization and spacing parameters.

A positive measure representing holomorphic evaluation need not satisfy the logarithmic inequality $log \| f \( 0 \) \| lt.eq integral_S log \| f \| thin d mu$ for every holomorphic $f$ continuous on the closed ball. Hedenmalm gives an explicit example of this distinction between representing and Jensen measures #cite(label("Hedenmalm1989")) Theorem 3.7. Here we need smooth logarithmic tests and negative bounds that persist through all later density corrections. We prove these properties directly for the densities of Theorem 10.

Fix a constant $C_P$ in the bound $\| P_k \( z \) \| lt.eq C_P \| z \|^k$ of Lemma 6.

For $epsilon.alt > 0$, define

#[#set math.equation(numbering: n => "(5.1)")
 $ F_epsilon.alt \( v \) = log frac(\| 1 - a v \|^2 + epsilon.alt^2, 1 + epsilon.alt^2) \, #h(2em) U_k \( z \) = F_epsilon.alt \( P_k \( z \) \) . $ <tests:regularized>]

In particular $F_epsilon.alt \( 0 \) = U_k \( 0 \) = 0$. The function $U_k$ is smooth and plurisubharmonic on $bb(C)^2$, since

#[#set math.equation(numbering: n => "(5.2)")
 $ \( U_k \)_(i macron(j)) = frac(a^2 epsilon.alt^2, \( \| 1 - a P_k \|^2 + epsilon.alt^2 \)^2) \( P_k \)_i overline(\( P_k \)_j) . $ <tests:hessian>]

For fixed $epsilon.alt$ and $A < oo$, all real derivatives of $F_epsilon.alt$ of any fixed order are bounded on $\| v \| lt.eq A$. The mean-value estimate also gives

#[#set math.equation(numbering: n => "(5.3)")
 $ \| F_epsilon.alt \( v \) \| lt.eq C_(epsilon.alt \, A) \| v \| #h(2em) \( \| v \| lt.eq A \) . $ <tests:lipschitz>]

All subsequent regularization constants may depend on the fixed $epsilon.alt$.

#thm([Lemma 5.1.])[
  (Exact averaging).  #emph[Let $k = k_j = Q^j$, where $Q$ satisfies the hypotheses of Theorem 10. For $0 lt.eq r lt.eq 1$, 
#[#set math.equation(numbering: n => "(5.4)")
 $ integral_S U_k \( r xi \) W_j \( xi \) thin d sigma = integral_S U_k \( r xi \) thin d sigma + sum_p integral_(cal(U)_(k \, p)) U_k \( r xi \) e^(2 y \/ k) f \( y \) cos \( k theta \) thin d sigma . $ <tests:averaging-identity>]

]
] <tests:averaging>

#proof[
  Under the global phase rotation $xi mapsto e^(i omega) xi$, homogeneity gives $P_k \( e^(i omega) xi \) = e^(i k omega) P_k \( xi \)$. Thus $U_k \( r xi \)$ has only phase frequencies in $k bb(Z)$. By Lemma 11, the phase bandwidth of $W_(j - 1)$ is $ell_(j - 1) < k$ and its constant coefficient on each orbit is one. Averaging the product over the phase therefore gives
  $ integral_S U_k \( r xi \) W_(j - 1) \( xi \) thin d sigma = integral_S U_k \( r xi \) thin d sigma . $
  Each patch is phase-invariant. Its radial variable $y$ is fixed under rotation, while $theta$ and $gamma$ both increase by $omega$. Write the central restriction as $S_p \( theta \) = W_(j - 1) \( e^(i theta) p \) = sum_s hat(S)_p \( s \) e^(i s theta)$. In the patch increment of (4.2), the frequencies are $plus.minus \( k + s \)$ with $\| s \| lt.eq ell_(j - 1) < k$. Pairing with a frequency in $k bb(Z)$ is possible only for $s = 0$. Since $hat(S)_p \( 0 \) = 1$ and $S'_p$ has zero constant coefficient, the surviving part of the increment is exactly $e^(2 y \/ k) f \( y \) cos \( k theta \)$. Integrating this phase average proves (5.4). ◻
]

The next estimate chooses the regularization before the spacing. This order matters: the single-peak approximation will be applied to a fixed smooth logarithm, and its error can then be made small by increasing $D_0$.

#thm([Proposition 5.2.])[
  (Negative averages at one scale).  #emph[There exist $epsilon.alt > 0$, $eta in \( 0 \, 1 \/ 2 \)$ and $D_(*) gt.eq 1$, depending only on the fixed profile data, with the following property. For every $D_0 gt.eq D_(*)$ there are $k_(*) > 0$ and $d_2 > 0$ such that, for every integer $Q$ satisfying the density theorem and $Q gt.eq k_(*)$, 
#[#set math.equation(numbering: n => "(5.5)")
 $ integral_S U_(k_j) \( r xi \) W_j \( xi \) thin d sigma lt.eq - d_2 #h(2em) #scale(x: 120%, y: 120%)[\(] j gt.eq 1 \, quad 1 - eta lt.eq r^(k_j) lt.eq 1 #scale(x: 120%, y: 120%)[\)] . $ <tests:one-scale-negative>]

 The constants $k_(*) \, d_2$ may depend on $D_0$, but are independent of $j$ and of further increases in $Q$.]
] <tests:negative>

#proof[
  Put
  $ Delta = 2 s_1 \( cosh alpha - 1 \) - alpha^2 > 0 . $
  We first compute the integral for a single peak:
  #[#set math.equation(numbering: n => "(5.6)")
   $ I_epsilon.alt \( rho \) = integral_0^(R_0) integral_0^(2 pi) log frac(\| 1 - a rho e^(- y) e^(i t') \|^2 + epsilon.alt^2, 1 + epsilon.alt^2) \( 1 + f \( y \) cos t' \) thin frac(d t', 2 pi) thin d y . $ <tests:model>]
  At $rho = 1$, the unregularized logarithm has only one singularity, at $\( y \, t' \) = \( alpha \, 0 \)$ modulo $2 pi$. Near that point,
  $ \| 1 - e^(alpha - y + i t') \|^2 asymp \( y - alpha \)^2 + \( t' \)^2 . $
  Its logarithm is locally integrable. For $0 < epsilon.alt lt.eq 1$, the regularized logarithm is bounded above uniformly, and its negative part is bounded by the negative part of the unregularized logarithm plus $log 2$. Dominated convergence therefore applies in (5.6).
  For $q < 1$, the mean and cosine moment of $log \| 1 - q e^(i t') \|^2$ are $0$ and $- q$, respectively, by the logarithm series. For $q > 1$, factoring out $q^2$ gives mean $2 log q$ and cosine moment $- q^(- 1)$. Using the cancellation $integral_0^(R_0) e^(- y) f \( y \) thin d y = 0$, we obtain
  #[#set math.equation(numbering: n => "(5.7)")
   $ I_0 \( 1 \) & = alpha^2 - integral_0^alpha f \( y \) e^(y - alpha) thin d y - integral_alpha^(R_0) f \( y \) e^(alpha - y) thin d y\
 & = alpha^2 + integral_0^alpha f \( y \) #scale(x: 120%, y: 120%)[\(] e^(alpha - y) - e^(- \( alpha - y \)) #scale(x: 120%, y: 120%)[\)] thin d y\
 & = alpha^2 - 2 s_1 \( cosh alpha - 1 \) = - Delta . $ <tests:model-sign>]
  The last equality uses $f = - s_1$ on $\[ 0 \, alpha \]$.
  We now compare this model with (5.4). For $k = k_j$ put $rho = r^k$, so homogeneity gives $U_k \( r xi \) = F_epsilon.alt \( rho P_k \( xi \) \)$. Off the patches, $\| a P_k \| lt.eq 1 \/ 2$ by Lemma 8. If $v = rho P_k \( xi \)$, $0 lt.eq rho lt.eq 1$, and $s = \| 1 - a v \|^2$, then $1 \/ 4 lt.eq s lt.eq 9 \/ 4$ and
  $ F_epsilon.alt \( v \) - log \| 1 - a v \|^2 = log \( 1 + epsilon.alt^2 \/ s \) - log \( 1 + epsilon.alt^2 \) . $
  The derivative in $s$ of the first term has magnitude at most $16 epsilon.alt^2$, and $\| s - 1 \| lt.eq C \| v \|$. Hence
  $ \| F_epsilon.alt \( v \) - log \| 1 - a v \|^2 \| lt.eq C epsilon.alt^2 \| P_k \( xi \) \| . $
  The off-patch set is phase-invariant, and the phase mean of the unregularized logarithm is zero. By the $L^1$ estimate of Lemma 6, its total contribution is thus at most
  #[#set math.equation(numbering: n => "(5.8)")
   $ C_(upright("off")) epsilon.alt^2 thin N_k / k . $ <tests:off-patch>]
  Here $C_(upright("off"))$ is independent of $D_0 \, k \, rho$ and $0 < epsilon.alt lt.eq 1$.
  On a patch, the measure formula of Lemma 7 writes the combined contribution as
  $ 2 / k integral_0^(R_0) integral_(bb(T)^2) F_epsilon.alt \( rho P_k \( xi \) \) #scale(x: 120%, y: 120%)[\(] e^(- 2 y \/ k) + f \( y \) cos \( k theta \) #scale(x: 120%, y: 120%)[\)] thin frac(d theta thin d gamma, \( 2 pi \)^2) thin d y . $
  For fixed $epsilon.alt \, R_0$, replace $P_k \( xi \)$ by $e^(- y) e^(i k theta)$ using the single-peak estimate, and replace $e^(- 2 y \/ k)$ by one. The bounded derivative of $F_epsilon.alt$ and the bound $\| e^(- 2 y \/ k) - 1 \| lt.eq 2 R_0 \/ k$ show that the result differs from $\( 2 \/ k \) I_epsilon.alt \( rho \)$ by at most
  #[#set math.equation(numbering: n => "(5.9)")
   $ 2 / k C_(epsilon.alt \, R_0) (e^(- c \( D_0 - sqrt(2 R_0) \)^2) + 1 / k) . $ <tests:patch-error>]
  All constants are uniform over patches and $0 lt.eq rho lt.eq 1$. The change from $k theta$ to $t'$ in the angular average is exact, as $k$ is an integer.
  Choose $epsilon.alt in \( 0 \, 1 \]$ so small that
  $ \| I_epsilon.alt \( 1 \) + Delta \| lt.eq Delta \/ 8 \, #h(2em) C_(upright("off")) epsilon.alt^2 lt.eq Delta \/ 8 . $
  By continuity of (5.6) in $rho$, choose $eta in \( 0 \, 1 \/ 2 \)$ such that $I_epsilon.alt \( rho \) lt.eq - 3 Delta \/ 4$ for $1 - eta lt.eq rho lt.eq 1$. Next choose $D_(*)$ large enough for patch disjointness and for the first error in (5.9) to be at most $Delta \/ 16$ inside its factor $2 \/ k$. For each $D_0 gt.eq D_(*)$, take $k_(*)$ large enough for all the geometric estimates and for the remaining error inside this factor to be at most $Delta \/ 16$. Summing the patches and adding (5.8) gives, in particular,
  $ integral_S U_k \( r xi \) W_j thin d sigma lt.eq - Delta / 2 N_k / k lt.eq - frac(Delta, 2 D_0^2) . $
  Thus $d_2 = Delta \/ \( 2 D_0^2 \)$ is a valid choice. ◻
]

#thm([Lemma 5.3.])[
  (Negative averages against later densities).  #emph[Fix $epsilon.alt \, eta \, D_0 \, k_(*) \, d_2$ as in Proposition 16, and put $d_3 = d_2 \/ 2$. There is a threshold $Q_(*)$ such that, for every integer $Q gt.eq Q_(*)$, the densities satisfy 
#[#set math.equation(numbering: n => "(5.10)")
 $ integral_S U_(k_j) \( r xi \) W_N \( xi \) thin d sigma lt.eq - d_3 #h(2em) #scale(x: 120%, y: 120%)[\(] N gt.eq j gt.eq 1 \, quad 1 - eta lt.eq r^(k_j) lt.eq 1 #scale(x: 120%, y: 120%)[\)] . $ <tests:later-negative>]

]
] <tests:later>

#proof[
  Include the density and degree thresholds in $Q_(*)$, and require $Q gt.eq 4$. By Lemma 11, the increment $W_nu - W_(nu - 1)$ has frequencies within $ell_(nu - 1)$ of $plus.minus k_nu$. Since $ell_(nu - 1) lt.eq 2 k_(nu - 1)$, each such frequency has absolute value at least $\( Q - 2 \) k_(nu - 1)$. Summing the increments with $nu > j$ shows that every frequency in $W_N - W_j$ has absolute value at least $\( Q - 2 \) k_j$.
  For fixed $xi \, r$, write the logarithmic profile as
  $ V \( t' \) = log frac(\| 1 - A e^(i t') \|^2 + epsilon.alt^2, 1 + epsilon.alt^2) \, #h(2em) A = a r^(k_j) P_(k_j) \( xi \) . $
  The uniform polynomial bound gives $\| A \| lt.eq a C_P$. Differentiating the logarithm shows that
  $ parallel V'' parallel_oo lt.eq B_epsilon.alt := frac(2 a C_P, epsilon.alt^2) + frac(4 a^2 C_P^2, epsilon.alt^4) . $
  Two integrations by parts bound its $m$th Fourier coefficient by $B_epsilon.alt \/ m^2$ for $m eq.not 0$. To track these coefficients as functions of $xi$, define
  $ c_m \( xi \) = integral_0^(2 pi) F_epsilon.alt #scale(x: 120%, y: 120%)[\(] r^(k_j) P_(k_j) \( xi \) e^(i t') #scale(x: 120%, y: 120%)[\)] e^(- i m t') thin frac(d t', 2 pi) . $
  Homogeneity and a change of variable give $c_m \( e^(i omega) xi \) = e^(i m k_j omega) c_m \( xi \)$. Thus $c_m$ has global phase frequency $m k_j$, and $U_(k_j) \( r xi \) = sum_(m in bb(Z)) c_m \( xi \)$. The coefficient bound makes this series uniformly convergent. Its truncation to $\| m \| lt.eq Q - 3$ has uniform error at most $2 B_epsilon.alt \/ \( Q - 3 \)$ and only frequencies of absolute value less than $\( Q - 2 \) k_j$. Phase averaging therefore makes its integral against $W_N - W_j$ vanish. Both densities are positive probabilities by Theorem 10; hence $parallel W_N - W_j parallel_(L^1 \( sigma \)) lt.eq 2$. It follows that
  $ lr(|integral_S U_(k_j) \( r xi \) \( W_N - W_j \) thin d sigma|) lt.eq frac(4 B_epsilon.alt, Q - 3) . $
  Choose $Q_(*)$ so that this is at most $d_2 \/ 2$, and apply (5.5). ◻
]

== 6 The controlled base potential <sec:base-potential>

We now sum the logarithmic tests to prove Proposition 2. Fix parameters and an integer $Q$ for which Theorem 10 and Lemma 17 hold, and write $k_j = Q^j$. For a finite amplitude $L > 0$, set

#[#set math.equation(numbering: n => "(6.1)")
 $ phi.alt \( z \) = psi \( z \) + L sum_(j = 1)^oo U_(k_j) \( z \) . $ <base:potential>]

We first justify this definition. We then choose $L$ to exclude the required pluriharmonic minorant, and finally prove the uniform chart estimates needed by the metric construction.

#thm([Lemma 6.1.])[
  (Smooth convergence).  #emph[For every finite $L > 0$, the series in (6.1) converges locally in $C^oo \( bb(B) \)$. Its sum is smooth, satisfies $phi.alt \( 0 \) = 0$, and has complex Hessian $h gt.eq I$.]
] <base:convergence>

#proof[
  Fix $0 < r_0 < r_1 < 1$. Around each point of $\| z \| lt.eq r_0$, the complex polydisk of radius $\( r_1 - r_0 \) \/ \( 2 sqrt(2) \)$ lies in $\| z \| < r_1$. Cauchy estimates there, together with Lemma 6, give
  $ sup_(\| z \| lt.eq r_0) \| D^m P_k \( z \) \| lt.eq C_(m \, r_0 \, r_1) r_1^k $
  for every fixed derivative order $m$. Here and below $D^m$ denotes any real partial derivative of total order $m$. The values of $P_k$ remain in a fixed bounded disk. Every positive-order derivative of $F_epsilon.alt \( P_k \)$ is a sum of products containing at least one positive-order derivative of $P_k$ or its conjugate. The bounded derivatives of $F_epsilon.alt$ therefore give the same exponential estimate for $D^m U_k$. For $m = 0$, use (5.3). Since $sum_j r_1^(Q^j) < oo$, the series converges in every local $C^m$ norm.
  Each summand vanishes at zero and is plurisubharmonic by (5.2). Termwise differentiation is justified by the local $C^2$ convergence, and hence
  $ partial macron(partial) phi.alt = I + L sum_j partial accent(partial U, ‾)_(k_j) gt.eq I . $
  ◻
]

#thm([Lemma 6.2.])[
  (Absence of a pluriharmonic minorant).  #emph[If 
#[#set math.equation(numbering: n => "(6.2)")
 $ L > frac(5 log Q, d_3) \, $ <base:amplitude>]

 there are no $H in cal(O) \( bb(B) \)$ and $C_H in bb(R)$ satisfying (2.4).]
] <base:minorant>

#proof[
  Put
  #[#set math.equation(numbering: n => "(6.3)")
   $ r_N = 1 - eta / k_N . $ <base:radii>]
  For every $j lt.eq N$, Bernoulli’s inequality gives
  $ r_N^(k_j) = (1 - eta / k_N)^(k_j) gt.eq 1 - eta k_j / k_N gt.eq 1 - eta . $
  Thus all of the first $N$ modes satisfy the hypothesis of (5.10) at this same radius. For $j = N + m > N$, on the other hand,
  $ r_N^(k_j) lt.eq e^(- eta k_j \/ k_N) = e^(- eta Q^m) . $
  By the uniform polynomial bound and (5.3),
  #[#set math.equation(numbering: n => "(6.4)")
   $ sum_(j > N) sup_(xi in S) \| U_(k_j) \( r_N xi \) \| lt.eq C_epsilon.alt sum_(m gt.eq 1) e^(- eta Q^m) = : C_(upright("tail")) < oo \, $ <base:tail>]
  independently of $N$. Because $W_N$ is a positive probability, the same bound controls the weighted tail, without requiring a uniform pointwise bound on $W_N$.
  The base potential contributes only one logarithm:
  $ psi \( r_N xi \) = - log \( 1 - r_N^2 \) lt.eq log frac(1, 1 - r_N) = log \( k_N \/ eta \) . $
  Combining this with (5.10) and (6.4) yields
  #[#set math.equation(numbering: n => "(6.5)")
   $ & integral_S (phi.alt \( r_N xi \) + 4 log frac(1, 1 - r_N)) W_N thin d sigma\
 & #h(1cm)  lt.eq 5 log \( k_N \/ eta \) + L \( - d_3 N + C_(upright("tail")) \)\
 & #h(1cm)  = N \( 5 log Q - L d_3 \) + 5 log \( 1 \/ eta \) + L C_(upright("tail")) arrow.r - oo . $ <base:negative-means>]
  By Theorem 10, the measures $mu_N = W_N thin d sigma$ are positive representing probabilities. Apply Lemma 5 to these measures, the radii $r_N$, and the continuous function $u \( z \) = phi.alt \( z \) + 4 log \( 1 \/ \( 1 - \| z \| \) \)$. The limit (6.5) is exactly its hypothesis, so the required minorant cannot exist. ◻
]

It remains to control the metric jets as the chart centers approach the boundary. The value of $phi.alt$ need not be bounded. For its derivatives, the low degrees become almost constant in a centered chart, while the high degrees are exponentially small.

#thm([Lemma 6.3.])[
  (Uniform chart estimates).  #emph[For every fixed finite $L > 0$, the potential (6.1) has uniformly bounded positive-order derivatives through order four at the origins of all centered ball charts. Consequently its complex Hessian satisfies (2.2) and (2.3), with $c = 1$ and a finite constant $C$.]
] <base:chart-estimates>

#proof[
  After a unitary change of coordinates, put the center at $\( r \, 0 \)$, where $0 lt.eq r < 1$, and let $delta = 1 - r$. Rotating $P_k$ preserves its degree and its uniform homogeneous bound. Use the chart $T_r$ of (2.1), on the fixed complex polydisk
  $ D_rho = { \| zeta_1 \| < rho \, med \| zeta_2 \| < rho } \, #h(2em) rho = 1 / 16 . $
  The denominators in $T_r$ have modulus at least $1 - rho$. We estimate the polynomial in the two ranges of $k delta$.
  ===== 6.1 High degrees: $k delta > 1$. <high-degrees-kdelta1.>
  The ball automorphism identity gives, on $D_rho$,
  $ 1 - \| T_r \( zeta \) \|^2 = frac(\( 1 - r^2 \) \( 1 - \| zeta \|^2 \), \| 1 + r zeta_1 \|^2) gt.eq frac(1 - 2 rho^2, \( 1 + rho \)^2) thin delta . $
  It follows that $1 - \| T_r \( zeta \) \| gt.eq c delta$, with a fixed $c > 0$. Thus
  $ \| P_k \( T_r \( zeta \) \) \| lt.eq C_P e^(- c k delta) . $
  Cauchy estimates in this fixed polydisk bound every fixed-order holomorphic derivative at zero, including order zero, by $C_m e^(- c k delta)$.
  ===== 6.2 Low degrees: $k delta lt.eq 1$. <low-degrees-kdeltale1.>
  Consider the polydisk in the original coordinates
  $ A_k = {\| z_1 - r \| < 1 / k \, quad \| z_2 \| < 1 / sqrt(k)} . $
  It may extend outside the ball, but $P_k$ is an entire homogeneous polynomial. The bound of Lemma 6 therefore holds there as well. In fact
  $ \| z \|^2 lt.eq \( 1 + 1 \/ k \)^2 + 1 \/ k lt.eq 1 + 4 \/ k \, #h(2em) \| P_k \( z \) \| lt.eq C_P \( 1 + 2 \/ k \)^k lt.eq C_P e^2 . $
  Cauchy estimates on the concentric half-polydisk give
  $ \| partial_1 P_k \| lt.eq C k \, #h(2em) \| partial_2 P_k \| lt.eq C sqrt(k) . $
  Meanwhile the chart displacements satisfy
  $ \| T_r^1 \( zeta \) - r \| lt.eq frac(2 rho, 1 - rho) delta \, #h(2em) \| T_r^2 \( zeta \) \| lt.eq frac(sqrt(2) rho, 1 - rho) sqrt(delta) . $
  Both numerical coefficients are less than $1 \/ 2$. As $delta lt.eq 1 \/ k$, the chart image lies in the half-polydisk just used. Integrating the gradient along the straight segment from $\( r \, 0 \)$ to $T_r \( zeta \)$ gives
  $ \| P_k \( T_r \( zeta \) \) - P_k \( r \, 0 \) \| lt.eq C \( k delta + sqrt(k delta) \) lt.eq 2 C sqrt(k delta) . $
  This segment stays in the half-polydisk by convexity. Apply Cauchy estimates on $D_rho$ to the holomorphic difference $P_k compose T_r - P_k \( r \, 0 \)$. Every positive-order derivative at zero is bounded by $C_m sqrt(k delta)$. We make no such assertion for the zeroth-order value in this range.
  ===== 6.3 Composition and summation. <composition-and-summation.>
  In both ranges the values of $P_k compose T_r$ stay in a fixed bounded disk. Each positive-order real derivative of $U_k compose T_r = F_epsilon.alt \( P_k compose T_r \)$ is a sum of products containing differentiated factors of $P_k compose T_r$ or its conjugate. For $1 lt.eq m lt.eq 4$, the preceding bounds and the smooth composition estimate give
  #[#set math.equation(numbering: n => "(6.6)")
   $ \| D^m \( U_k compose T_r \) \( 0 \) \| lt.eq C_(epsilon.alt \, m) cases(delim: "{", sqrt(k delta) \, & k delta lt.eq 1 \,, e^(- c k delta) \, & k delta > 1 .) $ <base:scale-jets>]
  Indeed every term contains at least one differentiated factor, and a product of several factors obeys the same bound because the displayed scale factor is at most one. This proves the estimate for all real derivatives, hence for all pure and mixed complex derivatives of these orders.
  Let $J$ be the largest index with $Q^J delta lt.eq 1$, or put $J = 0$ if there is no such index. The low-degree contribution is bounded by the geometric sum
  $ sum_(j lt.eq J) sqrt(Q^j delta) lt.eq frac(1, 1 - Q^(- 1 \/ 2)) . $
  For the remaining degrees, the first value of $Q^j delta$ exceeds one, so
  $ sum_(j > J) e^(- c Q^j delta) lt.eq sum_(m gt.eq 0) e^(- c Q^m) < oo . $
  Both bounds are uniform in the chart center. Termwise differentiation is legitimate by Lemma 18. Multiplication by the fixed amplitude $L$ preserves these bounds.
  Finally, the base potential transforms as
  $ psi compose T_r = - log \( 1 - \| zeta \|^2 \) - log \( 1 - r^2 \) + log \| 1 + r zeta_1 \|^2 . $
  Its positive-order derivatives through order four at zero are uniformly bounded. The last term is pluriharmonic, so the complex Hessian of $psi compose T_r$ is exactly the standard ball Hessian in these coordinates. The derivatives of $phi.alt compose T_r$ needed for the pulled-back Hessian components and their first and second derivatives have orders two, three and four. The bounds just proved, together with $h gt.eq I$ from Lemma 18, establish the assertion. ◻
]

#proof[
  Choose $a \, alpha \, s_1 \, f \, b \, R_0$ as in Lemma 8. Proposition 16 first chooses $epsilon.alt \, eta$ and then permits any sufficiently large spacing $D_0$. Fix such a $D_0$ and its degree threshold $k_(*)$, and fix $d_3 = d_2 \/ 2 > 0$. The density theorem holds for every $Q$ above a threshold depending only on the fixed patch data and spacing. Its derivative constant $K_(*)$ is fixed before that threshold is chosen. We may therefore choose one integer $Q$ satisfying the density threshold, $Q gt.eq k_(*)$, and the Fourier-error threshold of Lemma 17.
  Now fix a finite amplitude $L$ satisfying (6.2). Lemma 18 constructs the smooth potential with $h gt.eq I$; Lemma 19 proves the required obstruction; and Lemma 20 supplies its finite uniform chart bounds. The chart constant is allowed to depend on these fixed choices, including $L$. The metric parameter $lambda$ in Proposition 3 is chosen only afterward from these bounds, so none of the choices above depends on $lambda$. ◻
]

== 7 The global Hartogs metric <sec:hartogs>

We now turn to Proposition 3. In this section we prove all its global geometric assertions. The real sectional-curvature bounds will follow from the calculation in Section 8 and the estimates in Section 9.

The potential specializes Calabi’s construction on a Hermitian line bundle #cite(label("Calabi1979")) Section 3. We verify its positivity, smoothness, and completeness directly, including at the zero section.

#thm([Lemma 7.1.])[
  #emph[Let $phi.alt$ be a smooth real plurisubharmonic function on $bb(B)$, and let $lambda > 0$. The domain $M_phi.alt$ in (2.5) is contractible, and the complex Hessian of $cal(K)_lambda = lambda psi - log \( 1 - e^phi.alt \| w \|^2 \)$ defines a smooth geodesically complete Kähler metric $g = 2 "Re" hat(g)$ on $M_phi.alt$. Moreover, $cal(K)_lambda$ is a smooth strictly plurisubharmonic exhaustion of $M_phi.alt$.]
] <metric:complete>

#proof[
  #emph[The domain and a smooth positive metric.] The function $t = e^phi.alt \| w \|^2$ is smooth on $bb(B) times bb(C)$, so $M_phi.alt = { t < 1 }$ is open in $bb(C)^3$. The map
  $ \( z \, w \) mapsto \( z \, e^(phi.alt \( z \) \/ 2) w \) $
  is a smooth real diffeomorphism from $M_phi.alt$ to $bb(B) times bb(D)$, where $bb(D) = { u in bb(C) : \| u \| < 1 }$. Its inverse is $\( z \, u \) mapsto \( z \, e^(- phi.alt \( z \) \/ 2) u \)$. Thus $M_phi.alt$ is contractible; no holomorphic trivialization is needed for this conclusion.
  The potential $cal(K)_lambda$ is smooth at every point of $M_phi.alt$, including its zero section. Write
  $ h = partial macron(partial) phi.alt \, #h(2em) x = frac(t, 1 - t) \, #h(2em) G = lambda I + x h \, #h(2em) theta.alt = d w + w partial phi.alt . $
  The base covectors together with $theta.alt$ form a global smooth complex coframe. Differentiating the potential gives
  #[#set math.equation(numbering: n => "(7.1)")
   $ hat(g) = G + frac(e^phi.alt, \( 1 - t \)^2) thin theta.alt ⊗ overline(theta.alt) . $ <metric:smooth-form>]
  For a complex tangent vector $u = \( u_z \, u_w \)$ this means
  $ hat(g) \( u \, u \) = G \( u_z \, u_z \) + frac(e^phi.alt, \( 1 - t \)^2) \| u_w + w partial phi.alt \( u_z \) \|^2 . $
  Since $h gt.eq 0$, the first term controls every nonzero horizontal projection through $G gt.eq lambda I$; when $u_z = 0$, the second term is positive unless $u_w = 0$. Thus $hat(g)$ is positive definite. At the zero section its matrix is particularly simple:
  #[#set math.equation(numbering: n => "(7.2)")
   $ hat(g) \|_(\( z \, 0 \)) = lambda I \( z \) + e^(phi.alt \( z \)) thin d w ⊗ d macron(w) . $ <metric:axis>]
  The mixed blocks vanish. Being a positive complex Hessian of a smooth real potential, $hat(g)$ defines the stated Kähler metric.
  Away from the zero section one can write $s = log t$ and $q = x \( 1 + x \) = t \/ \( 1 - t \)^2$. Then $partial s = theta.alt \/ w$, so (7.1) also reads
  #[#set math.equation(numbering: n => "(7.3)")
   $ hat(g) = lambda I + x h + q thin partial s ⊗ overline(partial s) . $ <metric:log-form>]
  We will use this expression for the curvature computation. Formula (7.1), rather than the coordinate $s$, defines the metric across $w = 0$.
  #emph[Two functions with bounded gradient.] For a real smooth function $f$, the convention $g = 2 "Re" hat(g)$ gives
  #[#set math.equation(numbering: n => "(7.4)")
   $ \| nabla f \|_g^2 = 2 \| partial f \|_(hat(g)^(- 1))^2 . $ <metric:gradient-convention>]
  Indeed, for a real vector $X$ with $\( 1 \, 0 \)$ part $u$, $g \( X \, X \) = 2 hat(g) \( u \, u \)$ and $d f \( X \) = 2 "Re" partial f \( u \)$, and the identity follows by taking dual norms.
  Globally on $M_phi.alt$,
  $ partial \[ - log \( 1 - t \) \] = frac(e^phi.alt macron(w), 1 - t) thin theta.alt . $
  In the coframe of (7.1), the Hermitian metric is block diagonal. Therefore
  $ \| partial \[ - log \( 1 - t \) \] \|_(hat(g)^(- 1))^2 = frac(\| e^phi.alt macron(w) \/ \( 1 - t \) \|^2, e^phi.alt \/ \( 1 - t \)^2) = t . $
  This calculation includes $w = 0$, where both sides are zero. For the base potential, direct inversion of its complex Hessian gives
  $ \| partial psi \|_(I^(- 1))^2 = \| z \|^2 . $
  The covector $partial psi$ has only base components in the same coframe, and $G gt.eq lambda I$. Combining these facts with (7.4) yields
  #[#set math.equation(numbering: n => "(7.5)")
   $ \| nabla \[ - log \( 1 - t \) \] \|_g^2 = 2 t < 2 \, #h(2em) \| nabla psi \|_g^2 lt.eq frac(2 \| z \|^2, lambda) lt.eq 2 / lambda . $ <metric:gradient-bounds>]
  #emph[Compact containment of metric balls.] Fix $p in M_phi.alt$ and a finite radius $R gt.eq 0$. Integrating (7.5) along arbitrary piecewise smooth paths and taking the infimum of their lengths shows that $d_g \( p \, q \) lt.eq R$ implies
  $ - log \( 1 - t \( q \) \) lt.eq a_R := - log \( 1 - t \( p \) \) + sqrt(2) R \, #h(2em) psi \( q \) lt.eq b_R := psi \( p \) + sqrt(2 \/ lambda) thin R . $
  This argument does not require a minimizing geodesic. Set
  $ tau_R = 1 - e^(- a_R) < 1 \, #h(2em) rho_R = sqrt(1 - e^(- b_R)) < 1 . $
  Every such $q = \( z \, w \)$ satisfies $t \( q \) lt.eq tau_R$ and $\| z \| lt.eq rho_R$. Let $m_R$ be the minimum of $phi.alt$ on the compact base ball ${ \| z \| lt.eq rho_R }$. Then
  $ \| w \|^2 = e^(- phi.alt \( z \)) t \( q \) lt.eq e^(- m_R) tau_R . $
  Consequently the metric ball is contained in
  #[#set math.equation(numbering: n => "(7.6)")
   $ K_R = { \( z \, w \) : \| z \| lt.eq rho_R \, med e^(phi.alt \( z \)) \| w \|^2 lt.eq tau_R } . $ <metric:compact-containment>]
  This set is closed and bounded in $bb(C)^3$, hence compact, and the strict bounds $rho_R < 1$ and $tau_R < 1$ place it entirely inside $M_phi.alt$. In particular, a bounded-length curve cannot escape through the base boundary, through a fiber boundary, or through unbounded fiber coordinates. The zero section is an interior locus with the smooth positive metric (7.2).
  The same compact-containment argument applies to sublevel sets of $cal(K)_lambda$. Both $psi$ and $- log \( 1 - t \)$ are nonnegative, so $cal(K)_lambda lt.eq R$ implies $psi lt.eq R \/ lambda$ and $- log \( 1 - t \) lt.eq R$. These bounds place the sublevel set in a compact set of the form (7.6); the sublevel set is closed there, hence compact. Positivity of its complex Hessian was proved above, so $cal(K)_lambda$ is a strictly plurisubharmonic exhaustion.
  #emph[Geodesic completeness.] Suppose a unit-speed geodesic has a finite maximal forward time $T$. Its image lies in the compact set $K_T$. On this set the smooth positive metric has a uniform positive Euclidean lower bound, so the geodesic’s Euclidean velocity is bounded. The Christoffel symbols are also bounded on $K_T$, and the geodesic equation then bounds its Euclidean acceleration. Both position and velocity have limits as time tends to $T$, with limiting position in $K_T subset M_phi.alt$. Local existence for the smooth geodesic equation extends the geodesic beyond $T$, a contradiction. The same argument in reverse time proves geodesic completeness. ◻
]

The hypotheses of Proposition 3 imply $h gt.eq c I > 0$, so Lemma 21 applies for every $lambda > 0$ under consideration. It remains to choose $lambda$ large enough for the two uniform real-sectional bounds. We do this in the next two sections, keeping the convention $g = 2 "Re" hat(g)$ throughout.

== 8 Curvature on real two-planes <sec:curvature>

We retain the base potential and Hartogs metric of Proposition 3. Section 9 will prove the two uniform sectional-curvature bounds. Here we compute the full curvature tensor and reduce its value on an arbitrary real two-plane to a scalar expression. In particular, the calculation includes real planes that are not complex lines.

Throughout this section, constants in tensor estimates depend only on the uniform centered-chart bounds for $h = \( phi.alt_(i macron(j)) \)$ in Proposition 3; the base dimension is two. We take $lambda gt.eq 1$. The base form remains $I = \( psi_(i macron(j)) \)$, with $psi = - log \( 1 - \| z \|^2 \)$.

=== 8.1 A pointwise holomorphic gauge and the tensor blocks <a-pointwise-holomorphic-gauge-and-the-tensor-blocks>

Fix a point with $w eq.not 0$, choose centered ball coordinates at its base point, and choose a local branch of $log w$. Put

$ s = log t = phi.alt + log w + overline(log w) \, #h(2em) x = frac(t, 1 - t) \, #h(2em) q = x \( 1 + x \) . $

In these coordinates the centered base point is zero. Remove the first and pure second derivatives of the weight by the holomorphic fiber change

$ P \( z \) = sum_i phi.alt_i \( 0 \) z_i + 1 / 2 sum_(i \, k) phi.alt_(i k) \( 0 \) z_i z_k \, #h(2em) v = log w + P \( z \) . $

More precisely, $s = v + macron(v) + tilde(phi.alt)$, where $tilde(phi.alt) = phi.alt - P - macron(P)$. At the point under consideration,

#[#set math.equation(numbering: n => "(8.1)")
 $ s_i = s_(i k) = 0 \, #h(2em) s_v = s_(macron(v)) = 1 \, #h(2em) s_(i macron(j)) = h_(i macron(j)) . $ <curv:gauge>]

All higher derivatives of $s$ involving a vertical index vanish. Subtracting $P + macron(P)$ changes neither $h$ nor its component derivatives in the centered base coordinates.

The metric at the point consequently has blocks

$ hat(g) = mat(delim: "(", G, 0; 0, q) \, #h(2em) G = lambda I + x h . $

At the center, $I$ is the identity matrix. Normalize the vertical vector to $q^(- 1 \/ 2) partial_v$ and denote its index by $0$. Horizontal indices $i \, j \, k \, l$ range over $1 \, 2$. In this pointwise frame the metric is $G + V$, where $V$ is the Hermitian form whose only nonzero entry is $V_(0 macron(0)) = 1$. Horizontal forms are extended by zero on the vertical direction. For any Hermitian form $P$, define

#[#set math.equation(numbering: n => "(8.2)")
 $ \( S_P \)_(a macron(b) c macron(d)) = P_(a macron(b)) P_(c macron(d)) + P_(a macron(d)) P_(c macron(b)) . $ <curv:symmetric-tensor>]

Our complex curvature components use the convention

#[#set math.equation(numbering: n => "(8.3)")
 $ R_(a macron(b) c macron(d)) = - cal(K)_(a c macron(b) macron(d)) + hat(g)^(p macron(e)) cal(K)_(a c macron(e)) cal(K)_(p macron(b) macron(d)) . $ <curv:coordinate-formula>]

Repeated indices in this formula are summed over all coordinates; repeated horizontal indices below are summed over $1 \, 2$. The inverse coefficients satisfy $sum_p hat(g)^(p macron(e)) hat(g)_(p macron(j)) = delta_(e j)$, so their numerical array is the transpose of the ordinary inverse of the displayed metric matrix. We relate (8.3) to real sectional curvature below, with the fixed convention $g = 2 "Re" hat(g)$.

#thm([Proposition 8.1.])[
  #emph[In the frame just described, define the horizontal Hermitian form 
$ D = \( 1 + 2 x \) h - q h G^(- 1) h . $

 The full curvature tensor is 
#[#set math.equation(numbering: n => "(8.4)")
 $ R = - lambda S_I - q S_h - S_V - \( S_(D + V) - S_D - S_V \) + T_4 + T_3 \, $ <curv:tensor-identity>]

 where $T_j$ has exactly $j$ horizontal indices. Its nonzero components, up to the Kähler symmetries and conjugation, are 
#[#set math.equation(numbering: n => "(8.5)")
 $ \( T_4 \)_(i macron(j) k macron(l)) & = - x h_(i macron(j) \, k macron(l)) + x^2 G^(p macron(e)) h_(i macron(e) \, k) h_(p macron(j) \, macron(l)) \,\
\( T_3 \)_(i macron(j) k macron(0)) & = sqrt(q) #scale(x: 120%, y: 120%)[\(] - h_(i macron(j) \, k) + x G^(p macron(e)) h_(i macron(e) \, k) h_(p macron(j)) #scale(x: 120%, y: 120%)[\)] . $ <curv:four-horizontal-error>]

 Measured by the Euclidean component norms in this frame, uniformly for $lambda gt.eq 1$, 
#[#set math.equation(numbering: n => "(8.6)")
 $ parallel T_4 parallel lt.eq C_4 x \, #h(2em) parallel T_3 parallel lt.eq C_3 sqrt(q) . $ <curv:component-errors>]

 If $lambda$ is at least the uniform upper bound for the eigenvalues of $h$ at centered-chart origins, then 
#[#set math.equation(numbering: n => "(8.7)")
 $ \( 1 + x \) h lt.eq D lt.eq \( 1 + 2 x \) h . $ <curv:D-bounds>]

]
] <curv:tensor>

#proof[
  Write $F \( s \) = - log \( 1 - e^s \)$. Direct differentiation gives
  $ F' = x \, #h(2em) F'' = q \, #h(2em) F''' = q \( 1 + 2 x \) \, #h(2em) F'''' = q \( 1 + 6 x + 6 x^2 \) . $
  The centered-chart expression for $psi$ differs from $- log \( 1 - \| z \|^2 \)$ by a pluriharmonic function and a constant. Its derivatives of type $\( 2 \, 1 \)$ therefore vanish at the center, and its derivatives of type $\( 2 \, 2 \)$ are $S_I$.
  For brevity in the derivative tables, put
  $ A_(i k macron(j)) = h_(i macron(j) \, k) \, #h(2em) B_(i k macron(j) macron(l)) = h_(i macron(j) \, k macron(l)) . $
  Before normalizing the vertical vector, the only possibly nonzero third derivatives of type $\( 2 \, 1 \)$, up to symmetry, are
  #[#set math.equation(numbering: n => "(8.8)")
   $ cal(K)_(i k macron(j)) & = x A_(i k macron(j)) \, #h(2em) cal(K)_(i v macron(j)) = q h_(i macron(j)) \, #h(2em) cal(K)_(v v macron(v)) = q \( 1 + 2 x \) . $ <curv:third-derivatives>]
  The fourth derivatives of type $\( 2 \, 2 \)$, up to symmetry and conjugation, are
  #[#set math.equation(numbering: n => "(8.9)")
   $ cal(K)_(i k macron(j) macron(l)) & = lambda \( S_I \)_(i macron(j) k macron(l)) + x B_(i k macron(j) macron(l)) + q \( S_h \)_(i macron(j) k macron(l)) \,\
cal(K)_(i k macron(j) macron(v)) & = q A_(i k macron(j)) \,\
cal(K)_(i v macron(j) macron(v)) & = q \( 1 + 2 x \) h_(i macron(j)) \,\
cal(K)_(v v macron(v) macron(v)) & = q \( 1 + 6 x + 6 x^2 \) . $ <curv:fourth-derivatives>]
  To check that these lists are complete, apply the chain rule to $F \( s \)$ and use (8.1). In the four-horizontal derivative, the two pairings of mixed second derivatives of $s$ give $q S_h$; the third pairing contains $s_(i k) s_(macron(j) macron(l)) = 0$. All other terms contain a vanished first or pure second horizontal derivative. In particular, $cal(K)_(i k macron(v)) = cal(K)_(v v macron(j)) = 0$, $cal(K)_(i k macron(v) macron(v)) = 0$, and the fourth derivatives with one horizontal and three vertical indices vanish. No vanishing of pure third horizontal derivatives is needed.
  Substitution into (8.3) gives (8.5) and (8.5). For clarity, all remaining curvature types in the normalized frame are
  #[#set math.equation(numbering: n => "(8.10)")
   $ R_(i macron(j) 0 macron(0)) & = - \( 1 + 2 x \) h_(i macron(j)) + q \( h G^(- 1) h \)_(i macron(j)) = - D_(i macron(j)) \,\
R_(i macron(0) k macron(0)) & = 0 \, #h(2em) R_(i macron(0) 0 macron(0)) = 0 \, #h(2em) R_(0 macron(0) 0 macron(0)) = - 2 . $ <curv:remaining-blocks>]
  The last identity follows because its unnormalized value is
  $ - q \( 1 + 6 x + 6 x^2 \) + q \( 1 + 2 x \)^2 = - 2 q^2 \, $
  and the four vertical normalization factors multiply to $q^(- 2)$. The tensors $S_V$ and $S_(D + V) - S_D - S_V$ give precisely the vertical and balanced two-horizontal blocks in (8.10). The Kähler symmetries and conjugation now account for every component, proving (8.4).
  The lower bound $h gt.eq c I$ implies
  $ parallel G^(- 1) parallel lt.eq frac(1, lambda + c x) \, #h(2em) x^2 parallel G^(- 1) parallel lt.eq x / c . $
  The assumed component-derivative bounds for $h$, applied to (8.5) and (8.5), prove (8.6) with constants independent of $lambda gt.eq 1$ and $x > 0$.
  Finally, $G = lambda I + x h$ commutes with $h$ at the center. On an eigendirection of $h$ with eigenvalue $d$, the ratio of $D$ to $h$ is
  $ 1 + 2 x - frac(x \( 1 + x \) d, lambda + x d) . $
  The subtracted fraction is nonnegative, and it is at most $x$ when $lambda gt.eq d$. This proves (8.7). ◻
]

Although the logarithmic fiber coordinate was used only for $w eq.not 0$, the tensor at the zero section can be checked directly in regular coordinates. A holomorphic fiber change $W = e^(P \( z \) + a) w$, with constant $a$ and a polynomial of degree at most two, makes the new weight have value zero and vanishing first and pure second derivatives at the base point. Its mixed Hessian remains $h$. Through total degree four, the terms relevant to the curvature are

$ lambda psi + \| W \|^2 (1 + sum_(i \, j) h_(i macron(j)) z_i macron(z)_j) + 1 / 2 \| W \|^4 . $

At the origin the metric is $"diag" \( lambda I \, 1 \)$, all relevant third derivatives vanish, and direct differentiation gives

#[#set math.equation(numbering: n => "(8.11)")
 $ R_(i macron(j) k macron(l)) = - lambda \( S_I \)_(i macron(j) k macron(l)) \, #h(2em) R_(i macron(j) 0 macron(0)) = - h_(i macron(j)) \, #h(2em) R_(0 macron(0) 0 macron(0)) = - 2 \, $ <curv:zero-section>]

with all other types zero. In the original fiber coordinate the normalized vertical vector is $e^(- phi.alt \/ 2) partial_w$. Thus the formulas above hold at the zero section as well by setting $x = q = 0$, $G = lambda I$, $D = h$, and $T_3 = T_4 = 0$, and using this regular normalized vertical vector.

=== 8.2 Real curvature and Gram determinants <real-curvature-and-gram-determinants>

Let $U_1 \, U_2$ be real linearly independent tangent vectors and let $u_1 \, u_2$ be their $\( 1 \, 0 \)$ parts, so $U_j = u_j + macron(u)_j$. For a Hermitian form $P$, linear in its first argument, define

#[#set math.equation(numbering: n => "(8.12)")
 $ a_P & = P \( u_1 \, u_1 \) P \( u_2 \, u_2 \) - \( "Re" P \( u_1 \, u_2 \) \)^2 \,\
b_P & = "Im" P \( u_1 \, u_2 \) \, #h(2em) m_P = a_(P + V) - a_P - a_V quad upright("when ") P upright(" is horizontal") . $ <curv:gram-quantities>]

Thus $a_P$ is the determinant of the real Gram matrix for $"Re" P$, $b_P$ is the imaginary Hermitian pairing, and $m_P$ is the cross term in that determinant after adding $V$. For the metric form $hat(g)$, the real squared area is $4 a_(hat(g))$ because $g = 2 "Re" hat(g)$. For a tensor $T$ with the Kähler symmetries, also put

$ cal(H)_T = T_(u_1 macron(u)_1 u_2 macron(u)_2) - "Re" T_(u_1 macron(u)_2 u_1 macron(u)_2) . $

Here contraction with complex vectors has its usual multilinear meaning. These definitions allow the horizontal or vertical projection of the real plane to be degenerate.

#thm([Lemma 8.2.])[
  #emph[For the metric convention $g = 2 "Re" hat(g)$ and the curvature convention (8.3), 
#[#set math.equation(numbering: n => "(8.13)")
 $ K_g \( "span"_(bb(R)) { U_1 \, U_2 } \) = frac(cal(H)_R, 2 a_(hat(g))) . $ <curv:sectional>]

 Define the matrix 
#[#set math.equation(numbering: n => "(8.14)")
 $ Xi^(a macron(b)) = u_1^a overline(u_2^b) - u_2^a overline(u_1^b) . $ <curv:xi-definition>]

 For every tensor $T$ with the Kähler symmetries and Hermitian conjugation symmetry, 
#[#set math.equation(numbering: n => "(8.15)")
 $ cal(H)_T = - 1 / 2 T_(a macron(b) c macron(d)) Xi^(a macron(b)) Xi^(c macron(d)) . $ <curv:xi-contraction>]

 For every Hermitian form $P$, 
#[#set math.equation(numbering: n => "(8.16)")
 $ cal(H)_(S_P) = a_P + 3 b_P^2 . $ <curv:S-contraction>]

]
] <curv:real-plane>

#proof[
  The real squared area of the pair is $4 a_(hat(g))$, because $g \( U_i \, U_j \) = 2 "Re" hat(g) \( u_i \, u_j \)$. In particular $a_(hat(g)) > 0$ for a real linearly independent pair. Write
  $ A = R_(u_1 macron(u)_1 u_2 macron(u)_2) \, #h(2em) B = R_(u_1 macron(u)_2 u_1 macron(u)_2) . $
  The Kähler symmetries in the expansion on $U_j = u_j + macron(u)_j$ give the real numerator
  $ R^(bb(R)) \( U_1 \, U_2 \, U_2 \, U_1 \) = A - B - macron(B) + A = 2 cal(H)_R . $
  Division by the real squared area proves (8.13). Expanding the right-hand side of (8.15) gives the same expression $A - "Re" B$ for $T$. Finally, if $c_P = P \( u_1 \, u_2 \)$, direct contraction of (8.2) gives
  $ cal(H)_(S_P) = P \( u_1 \, u_1 \) P \( u_2 \, u_2 \) + \| c_P \|^2 - 2 "Re" \( c_P^2 \) = a_P + 3 b_P^2 . $
  ◻
]

For example, the disk potential $- log \( 1 - \| w \|^2 \)$ has normalized complex curvature component $- 2$ by (8.10). Taking $u_2 = i u_1$ in (8.13) gives real sectional curvature $- 2$. This fixes the normalization also on complex lines.

#thm([Lemma 8.3.])[
  #emph[For a positive semidefinite Hermitian form $P$, $a_P gt.eq b_P^2$. For the vertical form $V$ one has $a_V = b_V^2$. If $P$ is horizontal and positive semidefinite, $m_P$ is nonnegative, linear and monotone in $P$, and 
#[#set math.equation(numbering: n => "(8.17)")
 $ m_P gt.eq 2 sqrt(a_P a_V) . $ <curv:mixed-gram>]

 When $a_P a_V > 0$, equality in (8.17) holds exactly when the two real Gram matrices of the pair for $P$ and $V$ are proportional.]
] <curv:gram>

#proof[
  Complex Cauchy–Schwarz gives $P \( u_1 \, u_1 \) P \( u_2 \, u_2 \) gt.eq \| P \( u_1 \, u_2 \) \|^2$, proving $a_P gt.eq b_P^2$. Equality holds for $V$ because its complex rank is one. Let $A$ and $B$ be the two-by-two real Gram matrices with entries $"Re" P \( u_i \, u_j \)$ and $"Re" V \( u_i \, u_j \)$, respectively. Then
  $ a_P = det A \, #h(2em) a_V = det B \, #h(2em) m_P = "tr" \( "adj" \( A \) B \) . $
  For positive definite $A$, put $C = A^(- 1 \/ 2) B A^(- 1 \/ 2)$. The last expression equals $\( det A \) "tr" C$, whereas $sqrt(a_P a_V) = \( det A \) sqrt(det C)$. The inequality $"tr" C gt.eq 2 sqrt(det C)$ proves (8.17), and continuity gives the semidefinite case. If both determinants are positive, equality means that $C$ is a scalar matrix, which is exactly the claimed proportionality. The displayed formula for $m_P$ is linear in the entries of $P$. Its nonnegativity for positive semidefinite $P$ then also proves monotonicity. ◻
]

=== 8.3 Error terms and the curvature numerator <error-terms-and-the-curvature-numerator>

Decompose $u_j = \( u_(j \, H) \, u_(j \, 0) \)$ in the pointwise frame. Write $Xi_(H H)$ for the horizontal two-by-two block of $Xi$ and $Xi_(H macron(0))$ for its horizontal-to-vertical column. The other mixed block is the negative conjugate transpose of this column. Write $Xi_(upright("mix"))$ for the matrix consisting of both mixed blocks, with all other entries zero. All norms of these blocks below are Euclidean Frobenius norms.

Direct expansion of (8.14) gives

#[#set math.equation(numbering: n => "(8.18)")
 $ parallel Xi_(H H) parallel^2 & = 2 \( a_I + b_I^2 \) lt.eq 4 a_I \,\
parallel Xi_(H macron(0)) parallel^2 & = m_I + 2 b_I b_V \, #h(2em) parallel Xi_(upright("mix")) parallel^2 = 2 \( m_I + 2 b_I b_V \) lt.eq 4 m_I . $ <curv:xi-norms>]

For the second identity, explicitly expand $parallel u_(1 \, H) overline(u_(2 \, 0)) - u_(2 \, H) overline(u_(1 \, 0)) parallel^2$. The last inequality follows from $\| b_I b_V \| lt.eq sqrt(a_I a_V) lt.eq m_I \/ 2$, by Lemma 24.

#thm([Lemma 8.4.])[
  #emph[For every real linearly independent tangent pair, 
#[#set math.equation(numbering: n => "(8.19)")
 $ \| cal(H)_(T_4) \| lt.eq C x a_I \, #h(2em) \| cal(H)_(T_3) \| lt.eq C sqrt(q) thin sqrt(a_I m_I) . $ <curv:contracted-errors>]

 More explicitly, the three-horizontal error satisfies 
#[#set math.equation(numbering: n => "(8.20)")
 $ \| cal(H)_(T_3) \| lt.eq C sqrt(q) thin parallel Xi_(H H) parallel thin parallel Xi_(upright("mix")) parallel . $ <curv:mixed-error>]

]
] <curv:errors>

#proof[
  In (8.15), the tensor $T_4$ pairs two horizontal blocks of $Xi$. The tensor $T_3$ pairs one horizontal block and one mixed block, since it has exactly three horizontal indices. Cauchy–Schwarz and (8.6) give (8.20) and $\| cal(H)_(T_4) \| lt.eq C x parallel Xi_(H H) parallel^2$. Now use (8.18). These estimates remain valid when one of the projected real areas vanishes. ◻
]

We can now express the entire real curvature numerator. By (8.16) and $a_V = b_V^2$,

$ cal(H)_(S_V) = 4 a_V \, #h(2em) cal(H)_(S_(D + V) - S_D - S_V) = m_D + 6 b_D b_V . $

Consequently (8.4) gives

#[#set math.equation(numbering: n => "(8.21)")
 $ - cal(H)_R =  & lambda \( a_I + 3 b_I^2 \) + q \( a_h + 3 b_h^2 \) + 4 a_V + m_D + 6 b_D b_V\
 & - cal(H)_(T_4) - cal(H)_(T_3) . $ <curv:negative-numerator>]

Its denominator in (8.13) is positive for every real two-plane. It remains to prove that (8.21) is uniformly positive relative to that denominator for sufficiently large fixed $lambda$, and that the quotient is also uniformly bounded above. The mixed term $6 b_D b_V$ can have either sign; Section 9 treats it together with the possible degeneration of the projected planes.

== 9 Uniform pinching on real two-planes <sec:pinching>

We now prove the curvature bounds in Proposition 3. The identity of Section 8 reduces the problem to finite-dimensional algebra. The limiting main expression is nonnegative, but it can vanish on certain real planes. We identify those planes and show that the error with three horizontal indices vanishes to the additional order needed there.

Throughout this section, horizontal forms are extended by zero on the vertical factor of $bb(C)^2 xor bb(C)$. We retain $I \, V \, S_P \, a_P \, b_P \, m_P \, Xi$ from Section 8. Unless otherwise indicated, constants depend only on the fixed bounds $c I lt.eq h lt.eq C I$ and the component bounds for the error tensors.

=== 9.1 The mixed real-plane algebra <the-mixed-real-plane-algebra>

The leading expression below can vanish even when both projections of the real plane are nonzero. For an explicit algebraic model, take $h = I$, $E = 2 I$, and $u_1 = \( e_1 \, 1 \)$, $u_2 = \( i e_1 \, - i \)$, where $e_1 = \( 1 \, 0 \) in bb(C)^2$. Direct substitution gives

$ a_h + 3 b_h^2 + 4 a_V + m_E + 6 b_E b_V = 4 + 4 + 4 - 12 = 0 \, #h(2em) Xi_(upright("mix")) = 0 . $

The horizontal and vertical projections have opposite complex orientations. The next lemma proves nonnegativity for all planes in the stated range of $E$ and shows that every zero has this mixed-block vanishing.

#thm([Lemma 9.1.])[
  #emph[Let $h$ be a positive definite horizontal Hermitian form, let $E$ be another horizontal Hermitian form with $E gt.eq h$, and let $u_1 \, u_2$ be real-linearly independent vectors in $bb(C)^2 xor bb(C)$. Define 
$ P_h \( E \) = a_h + 3 b_h^2 + 4 a_V + m_E + 6 b_E b_V . $

 If $a_h a_V = 0$, then $P_h \( E \) > 0$. If $a_h a_V > 0$, put $tau = \| b_h \| \/ sqrt(a_h)$. For every real $beta$ such that $E lt.eq \( 2 - beta \) h$, 
#[#set math.equation(numbering: n => "(9.1)")
 $ P_h \( E \) gt.eq (sqrt(a_h + 3 b_h^2) - 2 sqrt(a_V))^2 + 2 beta \( 1 + tau \) sqrt(a_h a_V) . $ <pinch:square>]

 In particular, $h lt.eq E lt.eq 2 h$ implies $P_h \( E \) gt.eq 0$. If equality holds in this last conclusion, then 
$ a_h = a_V > 0 \, #h(2em) \| b_h \| = sqrt(a_h) \, #h(2em) b_E b_V < 0 \, $

 and both mixed blocks $Xi^(i macron(0))$ and $Xi^(0 macron(i))$ vanish.]
] <pinch:algebra>

#proof[
  If $a_V = 0$, then $b_V = 0$, because the vertical factor has complex dimension one. If $a_h = 0$, the two horizontal projections are linearly dependent over $bb(R)$, since $h$ is positive definite. Their pairing under every Hermitian form is therefore real, so $b_E = 0$. Thus $a_h a_V = 0$ implies $b_E b_V = 0$, and
  $ P_h \( E \) gt.eq a_h + 4 a_V + m_h gt.eq a_(h + V) > 0 . $
  Here the last inequality uses the positive definiteness of $h + V$ and the real linear independence of the pair.
  Suppose now that $A = a_h > 0$ and $U = a_V > 0$. The Hermitian Gram determinant gives $0 lt.eq tau lt.eq 1$. Make a real change of basis in the plane so that its horizontal projections, denoted $u_H \, v_H$, are real-orthonormal for $h$. Both ratios $\| b_h \| \/ sqrt(a_h)$ and $\| b_E \| \/ sqrt(a_h)$ are unchanged by this operation. The squared $h$-norms of $u_H + i v_H$ and $u_H - i v_H$ are $2 \( 1 + tau \)$ and $2 \( 1 - tau \)$, in some order. The absolute difference of their squared $E$-norms is $4 \| b_E \|$ in the new basis. Comparing one norm from above and the other from below gives
  #[#set math.equation(numbering: n => "(9.2)")
   $ frac(\| b_E \|, sqrt(A)) lt.eq frac(\( 2 - beta \) \( 1 + tau \) - \( 1 - tau \), 2) = frac(1 + 3 tau, 2) - frac(beta \( 1 + tau \), 2) lt.eq sqrt(1 + 3 tau^2) - frac(beta \( 1 + tau \), 2) . $ <pinch:imaginary-bound>]
  For either order of the two norms, the displayed right side is an upper bound, since $2 - beta gt.eq 1$. The last inequality follows from
  $ 1 + 3 tau^2 - (frac(1 + 3 tau, 2))^2 = 3 / 4 \( 1 - tau \)^2 \; $
  it is strict unless $tau = 1$. This argument does not require $beta gt.eq 0$.
  The mixed Gram inequality (8.17) and the Hermitian Gram inequality yield
  $ m_E gt.eq 2 sqrt(a_E U) gt.eq 2 \| b_E \| sqrt(U) . $
  Since $U = b_V^2$, it follows that
  $ P_h \( E \) & gt.eq A + 3 b_h^2 + 4 U - 4 \| b_E \| sqrt(U)\
 & gt.eq (sqrt(A + 3 b_h^2) - 2 sqrt(U))^2 + 2 beta \( 1 + tau \) sqrt(A U) \, $
  which proves (9.1).
  It remains to examine equality when $h lt.eq E lt.eq 2 h$. The zero-area case already treated shows that $A \, U > 0$. Set $s = sqrt(A + 3 b_h^2)$ and $B = \| b_E \|$. The inequalities above, with $beta = 0$, give
  $ P_h \( E \) gt.eq \( s - 2 sqrt(U) \)^2 + 4 sqrt(U) \( s - B \) gt.eq 0 . $
  Equality forces $s = 2 sqrt(U)$, $B = s$, and equality in the bounds used to reach this expression. The strictness in (9.2) gives $tau = 1$. Consequently
  $ U = A \, #h(2em) B = 2 sqrt(A) \, #h(2em) b_E b_V < 0 \, #h(2em) m_E = 2 B sqrt(U) . $
  Since $a_E gt.eq B^2$ and $m_E gt.eq 2 sqrt(a_E U)$, these identities force $a_E = B^2$ and equality in the mixed Gram inequality. The horizontal real $E$-Gram matrix and the vertical real Gram matrix are therefore proportional.
  In the real $h$-orthonormalized basis used above, $tau = 1$ says that the horizontal projections have the form
  $ u_H \, quad sigma i u_H \, #h(2em) sigma in { 1 \, - 1 } . $
  Their real $E$-Gram matrix is a positive scalar multiple of the identity. Proportionality implies that the vertical projections have equal positive norms and real inner product zero. The sign $b_E b_V < 0$ selects the opposite complex orientation, so these projections have the form
  $ y \, quad - sigma i y . $
  Direct substitution now gives
  $ Xi^(i macron(0)) = u_H^i overline(- sigma i y) - \( sigma i u_H^i \) macron(y) = 0 . $
  The other mixed block vanishes as well. Under any real change of basis in the plane, $Xi$ is multiplied by the determinant of that change. The vanishing therefore holds in the original basis. ◻
]

=== 9.2 Uniform negativity for large $lambda$ <uniform-negativity-for-large-lambda>

The next statement allows every error tensor with the specified bounds and component types. This uniformity will also give the compactness argument needed after $lambda$ has been fixed.

#thm([Lemma 9.2.])[
  #emph[Fix $0 < c lt.eq C < oo$ and $0 lt.eq C_(upright(e)) < oo$. There is a finite $lambda_0 = lambda_0 \( c \, C \, C_(upright(e)) \) > 0$ with the following property. Let $lambda gt.eq lambda_0$, $x gt.eq 0$, and let $h$ be a horizontal Hermitian form with $c I lt.eq h lt.eq C I$. Put 
$ q = x \( 1 + x \) \, #h(2em) G = lambda I + x h \, #h(2em) D = \( 1 + 2 x \) h - q h G^(- 1) h . $

 Let $T_4 \, T_3$ be tensors with the Kähler symmetries and reality condition, supported respectively on components with four and with three horizontal indices, and satisfying 
$ parallel T_4 parallel lt.eq C_(upright(e)) x \, #h(2em) parallel T_3 parallel lt.eq C_(upright(e)) sqrt(q) . $

 Define 
$ R = - lambda S_I - q S_h - S_V - \( S_(D + V) - S_D - S_V \) + T_4 + T_3 . $

 Then $cal(H)_R < 0$ on every real two-plane.]
] <pinch:positivity>

#proof[
  Increase the prospective threshold so that $lambda gt.eq max \( 1 \, C \)$. Then (8.7) gives
  $ \( 1 + x \) h lt.eq D lt.eq \( 1 + 2 x \) h . $
  If the lemma were false, there would be a sequence $lambda arrow.r oo$ of permitted data and real two-planes for which $F = - cal(H)_R lt.eq 0$. We suppress the sequence index. By (8.21),
  #[#set math.equation(numbering: n => "(9.3)")
   $ F = lambda \( a_I + 3 b_I^2 \) + q \( a_h + 3 b_h^2 \) + 4 a_V + m_D + 6 b_D b_V - cal(H)_(T_4) - cal(H)_(T_3) . $ <pinch:leading-numerator>]
  The contracted estimates (8.19) apply to the allowed error tensors by their component types and symmetries.
  ===== 9.2.1 The regime $q \/ lambda arrow.r 0$. <the-regime-qlambdato0.>
  Suppose first that a subsequence has this property. Monotonicity and linearity of the mixed Gram term give $m_D gt.eq c \( 1 + x \) m_I$, while
  $ \| b_D \| lt.eq sqrt(a_D) lt.eq C' \( 1 + x \) sqrt(a_I) . $
  Discarding nonnegative terms in (9.3), we get
  $ F gt.eq lambda a_I + 4 a_V + c \( 1 + x \) m_I - C' #scale(x: 120%, y: 120%)[\(] \( 1 + x \) sqrt(a_I a_V) + x a_I + sqrt(q) thin sqrt(a_I m_I) #scale(x: 120%, y: 120%)[\)] . $
  Absorb the first product into $2 a_V$, and the last into $c / 2 \( 1 + x \) m_I$. Since $q \/ \( 1 + x \) = x$, this gives
  $ F gt.eq \[ lambda - C'' \( \( 1 + x \)^2 + x \) \] a_I + 2 a_V + c / 2 \( 1 + x \) m_I . $
  Here $\( 1 + x \)^2 + x = O \( 1 + q \) = o \( lambda \)$, because $lambda arrow.r oo$. Every coefficient is eventually positive, whereas $a_I + a_V + m_I = a_(I + V) > 0$. This contradicts $F lt.eq 0$.
  ===== 9.2.2 The regime with $lambda \/ q$ bounded. <the-regime-with-lambdaq-bounded.>
  If the preceding regime has no subsequence, we may pass to one on which $q \/ lambda$ is bounded below by a positive constant. Then $lambda \/ q$ is bounded and $x arrow.r oo$. The term $q S_h$ has four horizontal slots, whereas the vertical term $S_V$ already has coefficient one. To balance these two blocks, multiply horizontal vector components by $q^(1 \/ 4)$. In the resulting plane choose a real-orthonormal pair for $"Re" \( I + V \)$. The inverse transformation and a real basis change give a basis of the original plane; the latter change multiplies $F$ by a positive factor. Thus its sign is unchanged. The rescaled pairs belong to a fixed compact Stiefel manifold, and their quantities satisfy $a_(I + V) = 1$.
  In the rescaled variables, the leading part of (9.3) is
  #[#set math.equation(numbering: n => "(9.4)")
   $ L_x = lambda / q \( a_I + 3 b_I^2 \) + P_h \( E \) \, #h(2em) E = D / sqrt(q) . $ <pinch:rescaled-leading>]
  The transformed tensors, denoted $tilde(T)_4 \, tilde(T)_3$, satisfy
  #[#set math.equation(numbering: n => "(9.5)")
   $ parallel tilde(T)_4 parallel lt.eq C' x / q = O \( x^(- 1) \) \, #h(2em) parallel tilde(T)_3 parallel lt.eq C' q^(- 1 \/ 4) = O \( x^(- 1 \/ 2) \) . $ <pinch:rescaled-errors>]
  Indeed, each horizontal slot supplies a factor $q^(- 1 \/ 4)$.
  The lower bound on $D$ gives $E gt.eq h$. For an eigenvalue $d in \[ c \, C \]$ of $h$, the corresponding ratio is
  $ E / h = frac(1 + 2 x, sqrt(q)) - frac(sqrt(q) thin d, lambda + x d) . $
  Since
  $ frac(1 + 2 x, sqrt(q)) = sqrt(4 + 1 / q) lt.eq 2 + C_1 / x^2 \, #h(2em) frac(sqrt(q) thin d, lambda + x d) gt.eq c_1 frac(x, lambda + x) \, $
  we have the uniform bound
  #[#set math.equation(numbering: n => "(9.6)")
   $ h lt.eq E lt.eq (2 + C_1 / x^2 - c_1 frac(x, lambda + x)) h . $ <pinch:E-bounds>]
  The constants $c_1 > 0 \, C_1 < oo$ depend only on $c \, C$.
  Pass to a subsequence on which $h \, E \, lambda \/ q$, and the normalized pair converge. The limiting forms satisfy $h lt.eq E lt.eq 2 h$. The error contributions tend to zero by (9.5). Lemma 26 shows that the two limiting summands in (9.4) are nonnegative. Since $F lt.eq 0$, both must vanish. In particular $P_h \( E \) = 0$ at the limit, so $a_h \, a_V > 0$ there and the mixed blocks of the limiting $Xi$ vanish. The comparison
  $ c^2 a_I lt.eq a_h lt.eq C^2 a_I $
  follows from the corresponding real Gram-matrix bounds. Hence $a_I \, a_h \, a_V$ are bounded below by positive constants along this subsequence.
  We now improve the error estimate on these particular planes. By the contraction formula (8.15), a tensor with exactly three horizontal indices can pair only one horizontal-horizontal block with one mixed block. Thus
  #[#set math.equation(numbering: n => "(9.7)")
   $ \| cal(H)_(tilde(T)_3) \| lt.eq C' q^(- 1 \/ 4) parallel Xi_(H H) parallel thin parallel Xi_(upright("mix")) parallel = o \( x^(- 1 \/ 2) \) . $ <pinch:vanishing-error>]
  Here $Xi_(H H)$ denotes the block $\( Xi^(i macron(j)) \)$, and $Xi_(upright("mix"))$ comprises the blocks $\( Xi^(i macron(0)) \)$ and $\( Xi^(0 macron(i)) \)$. The first block is bounded because the normalized pairs form a compact set, and the mixed blocks tend to zero by the equality case just proved. The explicit tensor factor $q^(- 1 \/ 4)$ is what makes this an $o \( x^(- 1 \/ 2) \)$ estimate for the evaluated contribution. No rate of convergence of the planes is being assumed.
  Apply (9.1) before taking the limit, with
  $ beta = c_1 frac(x, lambda + x) - C_1 / x^2 . $
  This choice is permitted by (9.6), including when $beta < 0$. The positive lower bounds for $a_I \, a_h \, a_V$, and boundedness of the normalized pairs, imply
  #[#set math.equation(numbering: n => "(9.8)")
   $ L_x gt.eq c_2 (lambda / q + frac(x, lambda + x)) - C_2 / x^2 $ <pinch:positive-gap>]
  along the subsequence, for some $c_2 > 0 \, C_2 < oo$. For $x gt.eq 1$, if $lambda gt.eq x^(3 \/ 2)$, then
  $ lambda / q gt.eq frac(x^(3 \/ 2), 2 x^2) = frac(1, 2 sqrt(x)) . $
  If instead $lambda lt.eq x^(3 \/ 2)$, then
  $ frac(x, lambda + x) gt.eq frac(1, sqrt(x) + 1) gt.eq frac(1, 2 sqrt(x)) . $
  Thus (9.8) is bounded below by a positive constant times $x^(- 1 \/ 2)$ for large $x$. The evaluated $tilde(T)_4$ contribution is $O \( x^(- 1) \) = o \( x^(- 1 \/ 2) \)$, and (9.7) gives the same little-o comparison for $tilde(T)_3$. It follows that $F > 0$ eventually, a contradiction.
  The two regimes exhaust the possible failure sequences. This proves the asserted finite threshold $lambda_0$, uniformly over all permitted matrices, error tensors, and real planes. ◻
]

=== 9.3 Both curvature bounds at a fixed parameter <both-curvature-bounds-at-a-fixed-parameter>

#proof[
  The geometric conclusions concerning the domain and completeness were proved in Lemma 21. It remains to obtain both uniform real sectional-curvature bounds. By Proposition 22, the errors of the actual metric have the types and bounds in Lemma 27, with $C_(upright(e))$ depending only on the chart bounds of Proposition 3. Choose any finite $lambda gt.eq lambda_0$. Then $- cal(H)_R > 0$ for every point and every real two-plane. We show that the sectional-curvature quotient is bounded away from zero and from negative infinity.
  First restrict $x$ to a bounded interval $\[ 0 \, X \]$. Normalize the pairs for $"Re" \( I + V \)$. The data consisting of $x$, the matrix $h$, the component arrays of $T_4 \, T_3$, and the normalized pair range over a closed bounded subset of a finite-dimensional space: impose $c I lt.eq h lt.eq C I$, the stated component types and symmetries, and the closed norm bounds $C_(upright(e)) x \, C_(upright(e)) sqrt(q)$. This set is compact. The formulas for $G \, D \, R$ are continuous on it. Since Lemma 27 applies to this entire set, $- cal(H)_R$ has a strictly positive minimum and a finite maximum. The metric $G + V$ is uniformly positive definite and bounded there, so $a_(G + V)$ is bounded above and away from zero. Formula (8.13) therefore gives both a strictly negative upper curvature bound and a finite lower curvature bound on $0 lt.eq x lt.eq X$.
  To cover the end $x arrow.r oo$, use the horizontal rescaling from the preceding proof. Here $lambda$ remains fixed: the mixed form $D \/ sqrt(q)$ will converge to $h$, rather than to an arbitrary form between $h$ and $2 h$ as allowed in the preceding contradiction argument. The rescaled Hermitian metric is
  $ tilde(g)_x = G \/ sqrt(q) + V . $
  For the fixed finite $lambda$,
  #[#set math.equation(numbering: n => "(9.9)")
   $ G / sqrt(q) - h = lambda / sqrt(q) I + (x / sqrt(q) - 1) h = O_lambda \( x^(- 1) \) $ <pinch:metric-limit>]
  uniformly in the permitted data. Because $G$ commutes with $h$, the formula for $D$ also gives
  $ D = x h + lambda \( 1 + x \) h G^(- 1) . $
  Consequently
  #[#set math.equation(numbering: n => "(9.10)")
   $ D / sqrt(q) - h = (x / sqrt(q) - 1) h + frac(lambda \( 1 + x \), sqrt(q)) h G^(- 1) = O_lambda \( x^(- 1) \) . $ <pinch:D-limit>]
  The rescaled tensor identity now implies
  #[#set math.equation(numbering: n => "(9.11)")
   $ tilde(R)_x = - S_(h + V) + O_lambda \( x^(- 1 \/ 2) \) $ <pinch:tensor-limit>]
  in component norm, uniformly over all allowed data. Indeed, the term $lambda S_I$ is divided by $q$, the term $q S_h$ becomes exactly $S_h$, the mixed term converges by (9.10), and the error tensors satisfy (9.5).
  For the limiting metric $h + V$ and tensor $- S_(h + V)$,
  $ K = - 1 / 2 (1 + 3 b_(h + V)^2 / a_(h + V)) in \[ - 2 \, - 1 \/ 2 \] . $
  For an $\( I + V \)$-real-orthonormal pair, $a_(h + V) gt.eq min \( c \, 1 \)^2$, so these area denominators are uniformly bounded away from zero. The forms $h + V$ also range over a compact bounded family. The metric and tensor estimates (9.9)–(9.11) therefore imply uniform convergence of the corresponding sectional-curvature quotients over all real planes. For sufficiently large $X_lambda < oo$, they give, for example,
  $ - 3 lt.eq K_g lt.eq - 1 \/ 4 #h(2em) \( x gt.eq X_lambda \) . $
  Combining this with the compact-range bounds at $X = X_lambda$ produces finite constants $0 < A lt.eq B$ for which
  $ - B lt.eq K_g \( sigma \) lt.eq - A < 0 $
  for every point and every real two-plane. The tensor identity at $x = 0$, given in (8.11), is computed in a smooth normalized fiber frame; equivalently the same bounds extend to the zero section by smoothness of the metric. This completes Proposition 3. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
