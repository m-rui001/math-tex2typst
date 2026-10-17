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

#align(center)[#text(size: 16pt, weight: "bold")[The Solomon--Yau least-volume theorem]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The equator is the least-volume closed minimal hypersurface of a unit round sphere. The next volume level is a subtler question: minimality alone gives no immediate control of topology, curvature, or singular limits of a sequence of hypersurfaces. The natural comparison examples are the minimal Clifford products

$ cal(C)_(k \, m - k) = S^k #h(-0.16667em) (sqrt(k / m)) times S^(m - k) #h(-0.16667em) (sqrt(frac(m - k, m))) subset S^(m + 1) \, #h(2em) 1 lt.eq k < m . $

The two factors have opposite principal curvatures, whose weighted sum vanishes; these products are therefore minimal. For each integer $m gt.eq 2$, set

$ a_m = min_(1 lt.eq k < m) "Vol"_m \( cal(C)_(k \, m - k) \) . $

The assertion that $a_m$ is the first volume level above the equator is the least-volume question in Yau’s collection #cite(label("Yau1994")) Problem 31. The modern formulation in #cite(label("GeLi2021")) Conjecture 1.12(ii) calls it the Solomon–Yau conjecture. We prove this formulation with its full immersion scope.

#thm([Theorem 1.1.])[
  #emph[Let $m gt.eq 2$, let $M^m$ be a closed connected smooth manifold, and let $F : M arrow.r S^(m + 1)$ be a smooth minimal immersion into the unit round sphere. If $F \( M \)$ is not totally geodesic, then 
$ "Vol" #scale(x: 120%, y: 120%)[\(] M \, F^(*) g_(upright("round")) #scale(x: 120%, y: 120%)[\)] gt.eq a_m . $

]
] <thm:volume>

Volume is measured on the domain, including covering multiplicities. The theorem resolves the stated least-volume conjecture positively. The threshold is attained by a Clifford product minimizing $a_m$.

=== Earlier results and the geometric obstacle <earlier-results-and-the-geometric-obstacle>

Simons’ curvature identities underpin rigidity for minimal hypersurfaces with parallel second fundamental form #cite(label("Simons1968")), explaining the special role of the Clifford products. Cheng, Li, and Yau obtained a dimension-dependent volume gap above the equator by heat-kernel comparison #cite(label("ChengLiYau1984")) Corollary 5; identifying the sharp next level is a separate question. In dimension two, the sharp area bound $a_2 = 2 pi^2$, together with Clifford-torus rigidity, follows from the Willmore theorem of Marques and Neves #cite(label("MarquesNeves2014")) Theorem B and Remark 1.3. Their canonical-family and min–max arguments connect an area comparison to the topology of a family of surfaces. The present proof follows this variational strategy, but the family and its topological test must work in arbitrary hypersurface dimension.

Higher-dimensional progress includes the rotational results of Cheng, Wei, and Zeng #cite(label("ChengWeiZeng2019")) Theorem 1.1, and Viana’s sharp Clifford bound when both connected complementary regions are antipodally invariant #cite(label("Viana2023")) Theorem 1.4. Related spectral progress includes Tang and Yan’s proof that the first positive Laplacian eigenvalue of a closed minimal isoparametric hypersurface in the unit sphere equals its dimension #cite(label("TangYan2013")) Theorem 1.1. Bernstein and Wang obtain near-sharp density bounds for regular minimal cones of dimension at most six, under topological conditions on a complementary component #cite(label("BernsteinWang2025")) Theorems 1.1–1.2. Here cone dimension is one greater than hypersurface dimension: the density of the cone over a minimal hypersurface $Sigma^m$ is $\| Sigma \| \/ \| S^m \|$. These density estimates indicate why the geometry of cones is relevant to the volume question.

The nonembedded case has a useful independent reduction. A point with $q$ preimages forces domain volume at least $q \| S^m \|$, as proved by Nguyen #cite(label("Nguyen2023")) Corollary 4.8 and Remark 4.9 and by Ge and Li #cite(label("GeLi2022")) Theorem 1.2 and Corollary 1.3. Since $a_m < 2 \| S^m \|$, any counterexample to Theorem 1 would be embedded. We give the short cone-monotonicity proof in Proposition 3, retaining tangent and coincident sheets. The more recent general embedded-hypersurface bounds of Ge and Li #cite(label("GeLi2026II")) Theorems 1.4 and 1.6 remain below the sharp Clifford threshold, which their Conjecture 1.3 still poses as the target.

After this reduction, the central difficulty is to minimize area among non-equatorial counterexamples and then decrease that minimum. Ordinary varifold compactness may produce singular limits, while a variational construction must retain enough topology to avoid collapsing to an equator. We address these two requirements together: a detecting family gives a uniform gap above the equator, and a dimension induction rules out singularities below the Clifford threshold.

=== Curvature, index, and the variational family <curvature-index-and-the-variational-family>

The first construction controls both signs of the principal curvatures. For a closed embedded non-equatorial minimal hypersurface $Sigma^m$, with second fundamental form $A$, a two-point maximum compares the normal at one point with every other point of $Sigma$. The reflection calculation is related to the two-point methods in #cite(label("Brendle2013")) Section 2 and #cite(label("AHLW2015")) Section 2. We prove the required static differential inequality directly, including diagonal contacts and repeated principal curvatures. A smooth upper-test comparison then gives

$ integral_Sigma \| A \|^2 gt.eq m \| Sigma \| . $

This proves the lower-bound assertion of Perdomo’s average-curvature conjecture #cite(label("GeLi2021")) Conjecture 1.5. Combining it with the conformal and spectral mechanism of #cite(label("Perdomo2004")) Theorem 3.1, and keeping track of equality in each spectral inequality, shows that index $m + 3$ forces a Clifford product (Proposition 10). A counterexample must therefore have a further negative direction for area.

The average-curvature inequality and this embedded index classification also appear in Nifa’s recent preprint #cite(label("Nifa2026")) Theorem 1.1 and Corollary 7.3, which proves a stronger Schrödinger quadratic-form inequality. His construction uses the sum of two tangent-ball curvatures and a weak supersolution. Here a two-sided maximum and a smooth Poisson comparison suffice for the integrated bound. We give the curvature and index arguments in full, independently of the volume comparison that follows.

The second construction turns that direction into a strict area improvement. Form the Euclidean cone over $Sigma$, take its signed distance function, and regard the graph as a hypersurface in a space with one time coordinate. Lorentz boosts preserve the difference between squared spatial length and squared time. Intersecting the transformed graph with the unit spatial sphere produces level sets whose areas are controlled on the fixed source $Sigma$. At each closest-point contact, minimality makes a nonnegative Jacobian matrix have fixed trace; its determinant bounds the area of the level. This estimate works even when closest points are not unique.

The boost parameters and the level parameter give a family on $bb(R P)^(m + 3)$. Its boundary cycles have area at most $\| Sigma \|$, and its fillings change to their complements around the projective generator. The associated degree-one cohomology class has nonzero $\( m + 3 \)$-rd power. This is the topological detection used in Section 4; it replaces a topology assumption on $Sigma$ itself. The original hypersurface is the unique area maximum, with a uniform gap away from its central parameter. Its extra index direction removes that maximum while preserving the detection and the absence of mass concentration (Proposition 18).

=== Compactness and the final induction <compactness-and-the-final-induction>

Detection forces every such family to contain a boundary of a half-volume region with zero centroid. Spherical isoperimetry and its hemisphere equality case give a uniform area threshold $gamma_m > \| S^m \|$ for these boundaries (Lemma 14). The min–max theorem therefore produces stationary integral varifolds above the equator, even after the strict deformation.

The volume proof proceeds by induction on $m$. Assuming only the lower-dimensional volume statements, Section 6 proves regularity for the subthreshold limits arising both from minimizing sequences and from min–max. The mechanism is radial splitting: tangents at nonzero points of a Euclidean cone split off a line, reducing their classification to a smaller cone dimension. This gives smooth connected links of multiplicity one without applying the unknown dimension-$m$ volume theorem to those links.

Compactness therefore attains a least counterexample of area $H$, with $gamma_m lt.eq H < a_m$. Its index exceeds $m + 3$, so the deformed family has maximum area strictly below $H$. Min–max produces a varifold of mass in $\[ gamma_m \, H \)$, and the same regularity argument makes it a smooth connected multiplicity-one hypersurface. Its mass is above the equator and below $H$: it is a smaller counterexample, the desired contradiction. The induction starts at $m = 2$, with no lower-dimensional volume hypothesis.

Section 2 establishes the volume normalization and immersion reduction. Section 3 proves curvature and index rigidity. Section 4 establishes detection and the precise min–max interface before Section 5 constructs and deforms the Lorentz-distance family. Section 6 proves the cone induction and exact attainment, and Section 7 completes the proof.

== 2 Normalization and the immersion reduction <sec:preliminaries>

All spheres have radius one unless a radius is displayed. We write $sigma_j = "Vol"_j \( S^j \)$ and $omega_j = "Vol"_j \( B_1^j \)$, so $sigma_(j - 1) = j omega_j$. For an embedded hypersurface $Sigma$, $\| Sigma \|$ denotes its induced $m$-volume. The word closed means compact without boundary.

The Laplacian is $Delta = "div" nabla$. For a two-sided minimal hypersurface in a sphere, $x$ is the position vector, $N$ a global unit normal, $A = - d N$ the shape operator, and $P = \| A \|^2$. The Morse index counts the positive eigenvalues, with multiplicity, of

$ L = Delta + m + P \; $

equivalently it is the dimension of a maximal negative subspace for the area second variation $- integral_Sigma u L u$.

#thm([Lemma 2.1.])[
  #emph[The numbers $theta.alt_m = a_m \/ sigma_m$ strictly decrease for integers $m gt.eq 2$. Moreover, 
$ theta.alt_2 = pi / 2 < 2 \, #h(2em) theta.alt_4 lt.eq 3 / 2 . $

 Consequently $a_m < 2 sigma_m$ for every $m gt.eq 2$, and $theta.alt_m lt.eq 3 \/ 2$ for every $m gt.eq 4$.]
] <lem:clifford-ratios>

#proof[
  For $k + l = m$, the product has volume
  $ sigma_k sigma_l (k / m)^(k \/ 2) (l / m)^(l \/ 2) . $
  Define, for real $j > 0$,
  $ d_j = sigma_j (frac(j, 2 pi e))^(j \/ 2) \, #h(2em) sigma_j = frac(2 pi^(\( j + 1 \) \/ 2), Gamma \( \( j + 1 \) \/ 2 \)) . $
  The ratio of the product volume to $sigma_m$ is $d_k d_l \/ d_(k + l)$. The usual series for the logarithmic derivatives of $Gamma$ gives
  $ frac(d^2, d j^2) log d_j = frac(1, 2 j) - 1 / 4 sum_(i = 0)^oo (i + frac(j + 1, 2))^(- 2) > 0 . $
  Indeed, strict convexity of $t mapsto \( t + j \/ 2 \)^(- 2)$ implies
  $ sum_(i = 0)^oo (i + frac(j + 1, 2))^(- 2) < integral_0^oo \( t + j \/ 2 \)^(- 2) thin d t = 2 / j . $
  Thus, with $k > 0$ fixed, the derivative in $l$ of $log \( d_k d_l \/ d_(k + l) \)$ is negative. Increase the second entry of a minimizing pair for $m$ by one to obtain a strictly smaller competitor for $theta.alt_(m + 1)$. This proves the strict decrease. The stated values follow from $k = l = 1$ and $k = l = 2$, respectively. ◻
]

For a $d$-dimensional Euclidean varifold $V$, its density at $z$, when it exists, is

$ Theta \( V \, z \) = lim_(rho arrow.b 0) frac(parallel V parallel \( B_rho \( z \) \), omega_d rho^d) . $

Here $parallel V parallel$ is its weight measure. We use stationary integral varifolds with their full integer multiplicities. In particular, coincident sheets add their masses.

The following multiplicity estimate is due to Nguyen #cite(label("Nguyen2023")) Corollary 4.8 and Ge–Li #cite(label("GeLi2022")) Theorem 1.2. We include its cone-monotonicity proof to make the treatment of source multiplicity explicit.

#thm([Proposition 2.2.])[
  (Immersion reduction).  #emph[Let $F : M^m arrow.r S^(m + 1)$ be a smooth minimal immersion of a closed manifold, with $m gt.eq 2$. If some image point has $q$ preimages, then 
$ "Vol" #scale(x: 120%, y: 120%)[\(] M \, F^(*) g_(upright("round")) #scale(x: 120%, y: 120%)[\)] gt.eq q sigma_m . $

 In particular, every immersion violating the bound in Theorem 1 is an embedding.]
] <prop:immersion-reduction>

#proof[
  Push forward the parametrized Euclidean cone
  $ \( 0 \, oo \) times M arrow.r bb(R)^(m + 2) \, #h(2em) \( r \, z \) mapsto r F \( z \) \, $
  with measure $r^m thin d r thin d upright("vol")_M$. This gives an integral $\( m + 1 \)$-varifold $cal(C)_F$, extended with zero mass at the origin. Minimality of $F$ makes it stationary away from the origin. The boundary term for first variation after truncation at $r = epsilon.alt$ is $O \( epsilon.alt^m \)$; it tends to zero. Thus $cal(C)_F$ is stationary in all of Euclidean space. The corresponding calculation for general spherical varifolds is given in Lemma 25.
  Its centered ball masses are exactly
  $ parallel cal(C)_F parallel \( B_R \( 0 \) \) = frac(R^(m + 1), m + 1) "Vol" #scale(x: 120%, y: 120%)[\(] M \, F^(*) g_(upright("round")) #scale(x: 120%, y: 120%)[\)] \, $
  and hence
  $ Theta \( cal(C)_F \, 0 \) = frac("Vol" \( M \, F^(*) g_(upright("round")) \), sigma_m) . $
  Every fiber of a compact immersion is finite: it is compact and its points are isolated by local embedding neighborhoods. At a nonzero cone point over an image point with $q$ preimages, these neighborhoods give $q$ smooth local sheets, each of density one. Therefore the density there is $q$, even when tangent planes agree or sheets coincide.
  For a fixed Euclidean center $z$, the inclusions
  $ B_(R - \| z \|) \( 0 \) subset B_R \( z \) subset B_(R + \| z \|) \( 0 \) $
  show that the large-radius mass ratio has limit $Theta \( cal(C)_F \, 0 \)$. Stationary monotonicity centered at the chosen nonzero point consequently gives
  $ q lt.eq Theta \( cal(C)_F \, 0 \) . $
  This proves the inequality. If $F$ is not injective, take $q gt.eq 2$ and use Lemma 2. Finally, an injective immersion from a compact manifold is an embedding. ◻
]

#prodef([Remark 2.3.])[
  The preceding argument counts preimages at the actual point; it does not require transverse self-intersections. On a regular image patch, the number of coincident sheets is the usual local covering multiplicity. Distinct minimal sheet germs are analytic and meet in a set of hypersurface measure zero unless they agree. Thus the generic multiplicity on such patches also has its ordinary covering interpretation. In particular, replacing a minimal embedding by a finite covering multiplies the measured volume by its degree.
] <rem:preliminaries-multiplicity>

#thm([Lemma 2.4.])[
  #emph[A closed connected embedded non-equatorial minimal hypersurface $Sigma^m subset S^(m + 1)$ is two-sided and full, meaning that its position vectors span $bb(R)^(m + 2)$. It is real analytic, and 
$ integral_Sigma x = 0 . $

 For every nonzero constant vector $a$, the coordinate function $chevron.l a \, x chevron.r$ is nontrivial and its zero set has $m$-dimensional measure zero.]
] <lem:fullness>

#proof[
  A closed embedded hypersurface in a sphere separates it into two regions and has a global unit normal. If its image were contained in a linear hyperplane, it would be an open and closed subset of the corresponding great sphere, by equality of dimensions. Connectedness and compactness would make the image that great sphere. This proves fullness.
  The coordinate equation $Delta x = - m x$ gives the integral identity. In analytic ambient coordinates, a minimal hypersurface is locally an analytic graph by analytic regularity for the minimal graph equation #cite(label("Blatt2024")) Theorem 1.1. Thus its coordinate functions are analytic. Fullness makes each $chevron.l a \, x chevron.r$, $a eq.not 0$, nontrivial, and a nontrivial analytic function on a connected manifold has a zero set of measure zero #cite(label("Mityagin2015")) Proposition 0. ◻
]

== 3 Average curvature and index rigidity <sec:index>

Throughout this section, $Sigma^m subset S^(m + 1)$ is a smooth, closed, connected, embedded minimal hypersurface, $m gt.eq 2$, which is not totally geodesic. Write $x$ for its position vector, $N$ for a global unit normal, $A = - d N$ for its shape operator, and $P = \| A \|^2$. Integrals use the induced volume measure $d V$; set $V_Sigma = "Vol"_m \( Sigma \)$. The inequality

$ integral_Sigma P thin d V gt.eq m V_Sigma $

is the inequality part of Perdomo’s conjecture, as formulated in #cite(label("GeLi2021")) Conjecture 1.5. We prove it by a two-sided curvature maximum. Combining it with the conformal and spectral argument of #cite(label("Perdomo2004")) Theorem 3.1 then gives the index rigidity needed below. We include that argument, in particular its pointwise equality step.

With $Delta = "div" nabla$, the minimal hypersurface identities are

#[#set math.equation(numbering: n => "(3.1)")
 $ Delta x = - m x \, #h(2em) Delta N = - P N \, #h(2em) Delta A = \( m - P \) A \, #h(2em) 1 / 2 Delta P = \| nabla A \|^2 + \( m - P \) P . $ <eq:index-geometric-identities>]

Here the Laplacian of $A$ is the rough tensor Laplacian. We also use $"tr" A = 0$ and the Codazzi identity: $nabla A$, viewed as a covariant three-tensor, is symmetric. The last two formulas are the hypersurface case of Simons’ identity #cite(label("Simons1968")) Theorem 5.3.1, equation (5.3.2).

=== 3.1 A two-sided curvature maximum <a-two-sided-curvature-maximum>

Define

#[#set math.equation(numbering: n => "(3.2)")
 $ mu \( x \) = sup_(y in Sigma\
y eq.not x) frac(\| chevron.l N \( x \) \, y chevron.r \|, 1 - chevron.l x \, y chevron.r) . $ <eq:index-mu>]

Embeddedness makes the denominator positive away from the diagonal. The absolute value controls both signs of the principal curvatures. The reflection used below appears in Brendle’s two-point argument #cite(label("Brendle2013")) Section 2 and in curvature estimates for hypersurface flows #cite(label("AHLW2015")) Section 2. The diagonal and distinct-point contact calculations are also closely related to #cite(label("Nifa2026")) Lemma 3.5 and Proposition 4.1. Using the sum of the two one-sided tangent-ball curvature functions, Nifa obtains a stronger quadratic-form inequality and derives both the average-curvature bound and the embedded least-index classification #cite(label("Nifa2026")) Theorem 1.1 and Corollary 7.3. For the integrated estimate needed here, the absolute maximum in (3.2) suffices. We prove its differential inequality directly.

Rather than differentiate the maximum, we estimate smooth upper tests. The logarithmic form of the estimate will allow comparison with a Poisson potential, forcing the mean of $m - P$ to be nonpositive.

#thm([Lemma 3.1.])[
  (Upper tests for the curvature maximum).  #emph[The function $mu$ in (3.2) is finite, continuous, and strictly positive. If a smooth positive function $phi.alt$ satisfies $phi.alt gt.eq mu$ in a neighborhood of $x$ and $phi.alt \( x \) = mu \( x \)$, then 
#[#set math.equation(numbering: n => "(3.3)")
 $ Delta log phi.alt \( x \) gt.eq m - P \( x \) . $ <eq:index-log-test>]

]
] <lem:index-upper-tests>

#proof[
  We first describe the possible contacts. Let $gamma \( t \) = exp_x \( t v \)$, where $v in T_x Sigma$ is a unit vector, and regard $gamma$ as a curve in $bb(R)^(m + 2)$. The ambient differentiation formulas give
  #[#set math.equation(numbering: n => "(3.4)")
   $ chevron.l N \( x \) \, gamma \( t \) chevron.r & = t^2 / 2 A_x \( v \, v \) + t^3 / 6 \( nabla_v A \)_x \( v \, v \) + O \( t^4 \) \,\
1 - chevron.l x \, gamma \( t \) chevron.r & = t^2 / 2 + O \( t^4 \) . $ <eq:index-contact-numerator>]
  For example, $gamma'' \( 0 \) = - x + A_x \( v \, v \) N \( x \)$, while $chevron.l x \, gamma''' \( 0 \) chevron.r = 0$. Compactness makes these expansions uniform on the unit tangent bundle for sufficiently small $\| t \|$. Consequently, adjoining unit tangent directions at the diagonal extends the quotient continuously, with values $\| A_x \( v \, v \) \|$.
  For completeness, this extension also gives continuity when the base point varies. If $x_j arrow.r x$ and nearly maximizing points $y_j$ stay away from $x$, a convergent subsequence gives an ordinary distinct-point contact. If $y_j arrow.r x$, write $y_j = exp_(x_j) \( t_j v_j \)$ and take a convergent subsequence of unit tangent directions. The uniform expansions show that its limiting quotient is at most $mu \( x \)$. This proves upper semicontinuity. Holding fixed any $y eq.not x$ whose quotient is within $epsilon$ of $mu \( x \)$ proves lower semicontinuity, after letting $epsilon arrow.b 0$. The same compactness argument proves finiteness and shows that a maximum is realized either by distinct points or by a tangent direction. If $mu \( x \) = 0$, the entire hypersurface lies in $N \( x \)^perp$, contrary to fullness from Lemma 5. Thus $mu > 0$.
  Fix an upper test $phi.alt$ at $x$. At a realizing contact, choose the sign of $N$ to make the signed quotient positive, and change the sign of $A$ at the same time. This choice is held fixed in a neighborhood. It requires no continuous choice of maximizing sign: for either fixed sign and for every nearby $x'$ and every $y' eq.not x'$,
  #[#set math.equation(numbering: n => "(3.5)")
   $ frac(chevron.l N \( x' \) \, y' chevron.r, 1 - chevron.l x' \, y' chevron.r) lt.eq mu \( x' \) lt.eq phi.alt \( x' \) . $ <eq:index-fixed-sign>]
  Choose a principal orthonormal basis $e_1 \, dots.h \, e_m$ at $x$, and write $A e_i = lambda_i e_i$. The diagonal limits give
  #[#set math.equation(numbering: n => "(3.6)")
   $ - phi.alt \( x \) lt.eq lambda_i lt.eq phi.alt \( x \) #h(2em) \( 1 lt.eq i lt.eq m \) . $ <eq:index-two-sided-eigenvalues>]
  We shall prove the stronger inequality
  #[#set math.equation(numbering: n => "(3.7)")
   $ Delta phi.alt + \( P - m \) phi.alt gt.eq 2 sum_(lambda_i < phi.alt) frac(phi.alt_i^2, phi.alt - lambda_i) gt.eq frac(\| nabla phi.alt \|^2, phi.alt) quad upright("at ") x \, $ <eq:index-gradient-test>]
  where $phi.alt_i = d phi.alt \( e_i \)$ and every component with $lambda_i = phi.alt$ will be shown to vanish.
  #emph[Distinct-point contact.] Suppose $y eq.not x$ realizes the maximum with the chosen sign. On the product of a neighborhood of $x$ with $Sigma$, set
  $ Z \( x' \, y' \) = phi.alt \( x' \) #scale(x: 120%, y: 120%)[\(] 1 - chevron.l x' \, y' chevron.r #scale(x: 120%, y: 120%)[\)] - chevron.l N \( x' \) \, y' chevron.r . $
  By (3.5), $Z gt.eq 0$ and $Z \( x \, y \) = 0$. Write $c = chevron.l x \, y chevron.r$, $s = 1 - c > 0$, and $d_i = chevron.l e_i \, y chevron.r$. The first derivatives at the minimum give
  #[#set math.equation(numbering: n => "(3.8)")
   $ s phi.alt_i = \( phi.alt - lambda_i \) d_i . $ <eq:index-distinct-first>]
  Reflection across the hyperplane perpendicular to $x - y$ sends $x$ to $y$, and sends $N \( x \)$ to
  $ n_y = N \( x \) + phi.alt \( x - y \) . $
  Indeed $chevron.l N \( x \) \, y chevron.r = phi.alt s$, so this vector is perpendicular to $y$ and has length one. The $y$ first-derivative equation for $Z$ shows that $n_y$ is perpendicular to $T_y Sigma$. Therefore the reflected vectors
  $ tilde(e)_i = e_i + d_i / s \( x - y \) $
  form an orthonormal basis of $T_y Sigma$, and
  $ chevron.l x \, tilde(e)_i chevron.r = d_i \, #h(2em) chevron.l e_i \, tilde(e)_i chevron.r = 1 - d_i^2 / s . $
  The vector $n_y$ may be either orientation of the normal at $y$; only minimality at $y$ enters the following trace computation.
  Use the product connection to compute the Hessian of $Z$. Denote its mixed entries in the indicated bases by $Z_(x_i y_i)$. From (3.1),
  $ Delta_x Z & = s Delta phi.alt - 2 sum_i phi.alt_i d_i + m phi.alt c + P phi.alt s \,\
Delta_y Z & = m phi.alt \,\
sum_i Z_(x_i y_i) & = - sum_i phi.alt_i d_i - sum_i \( phi.alt - lambda_i \) (1 - d_i^2 / s) . $
  In particular, the nonnegative sum of Hessians along $\( e_i \, tilde(e)_i \)$ is
  $ 0 & lt.eq Delta_x Z + 2 sum_i Z_(x_i y_i) + Delta_y Z\
 & = s #scale(x: 120%, y: 120%)[\(] Delta phi.alt + \( P - m \) phi.alt #scale(x: 120%, y: 120%)[\)] - 4 sum_i phi.alt_i d_i + 2 / s sum_i \( phi.alt - lambda_i \) d_i^2\
 & = s #scale(x: 120%, y: 120%)[\(] Delta phi.alt + \( P - m \) phi.alt #scale(x: 120%, y: 120%)[\)] - 2 / s sum_i \( phi.alt - lambda_i \) d_i^2 \, $
  where we used $"tr" A = 0$ and then (3.8). If $lambda_i = phi.alt$, (3.8) gives $phi.alt_i = 0$. Dividing by $s$ and substituting that equation in all other directions gives the first inequality of (3.7).
  #emph[Diagonal contact, including repeated eigenvalues.] Suppose instead that a unit tangent direction realizes the maximum. With our choice of normal sign, the top eigenvalue is $phi.alt \( x \)$. Let $E subset T_x Sigma$ be its full eigenspace. For every unit $v in E$ and every local smooth unit extension $V$ of $v$,
  $ A \( V \, V \) lt.eq mu lt.eq phi.alt \, #h(2em) A_x \( v \, v \) = phi.alt \( x \) . $
  The first derivative at this contact, in any direction $w in T_x Sigma$, is
  #[#set math.equation(numbering: n => "(3.9)")
   $ d phi.alt \( w \) = \( nabla_w A \) \( v \, v \) . $ <eq:index-diagonal-first>]
  The field-derivative term vanishes because $A \( v \, nabla_w V \) = phi.alt chevron.l v \, nabla_w V chevron.r = 0$. For the geodesic with initial direction $v$, formulas (3.4)–(3.4) give the signed quotient
  $ frac(chevron.l N \( x \) \, exp_x \( t v \) chevron.r, 1 - chevron.l x \, exp_x \( t v \) chevron.r) = phi.alt \( x \) + t / 3 \( nabla_v A \) \( v \, v \) + O \( t^2 \) . $
  It is at most the fixed value $mu \( x \) = phi.alt \( x \)$ for both signs of $t$. Hence $\( nabla_v A \) \( v \, v \) = 0$, and (3.9) implies
  #[#set math.equation(numbering: n => "(3.10)")
   $ d phi.alt \|_E = 0 . $ <eq:index-top-gradient>]
  This holds for every vector in $E$, not just for one principal vector. Moreover, polarizing (3.9) on $E$ gives $\( nabla_w A \) \|_(E times E) = d phi.alt \( w \) g \|_(E times E)$. These are pointwise statements; no smooth extension of the eigenspace is assumed.
  Fix $e_1 in E$ and choose a smooth unit field $V$ with $V \( x \) = e_1$. Put
  $ T_(j i) = \( nabla_(e_j) A \) \( e_1 \, e_i \) \, #h(2em) beta_(j i) = chevron.l nabla_(e_j) V \, e_i chevron.r . $
  The first derivatives $nabla_(e_j) V$ may be prescribed arbitrarily in $e_1^perp$: prescribe the corresponding jets of any local field and normalize it. Unit length determines precisely the second-derivative contraction that occurs in the calculation,
  $ chevron.l e_1 \, Delta V chevron.r = - sum_j \| nabla_(e_j) V \|^2 . $
  Thus, in a geodesic orthonormal frame at $x$,
  #[#set math.equation(numbering: n => "(3.11)")
   $ Delta #scale(x: 120%, y: 120%)[\(] A \( V \, V \) #scale(x: 120%, y: 120%)[\)] = \( Delta A \)_11 + 4 sum_(j \, i) beta_(j i) T_(j i) + 2 sum_(j \, i) \( lambda_i - phi.alt \) beta_(j i)^2 . $ <eq:index-unit-field-laplacian>]
  No other second derivative of $V$ contributes, since $A e_1 = phi.alt e_1$. Choose the free first jets by
  $ beta_(j i) = frac(T_(j i), phi.alt - lambda_i) quad upright("if ") lambda_i < phi.alt \, #h(2em) beta_(j i) = 0 quad upright("if ") lambda_i = phi.alt . $
  The minimum of $phi.alt - A \( V \, V \)$ then yields
  $ Delta phi.alt & gt.eq \( Delta A \)_11 + 2 sum_(lambda_i < phi.alt) frac(sum_j T_(j i)^2, phi.alt - lambda_i)\
 & gt.eq \( m - P \) phi.alt + 2 sum_(lambda_i < phi.alt) frac(phi.alt_i^2, phi.alt - lambda_i) . $
  In the last step we used Simons’ identity and Codazzi: $T_(1 i) = \( nabla_(e_i) A \) \( e_1 \, e_1 \) = phi.alt_i$. Equation (3.10) accounts for every omitted top-eigenspace gradient component. This proves the first inequality of (3.7) also at a repeated diagonal contact.
  In both cases, (3.6) gives $0 < phi.alt - lambda_i lt.eq 2 phi.alt$ in each retained direction. The vanished components in the other directions therefore give the second inequality of (3.7). Dividing by $phi.alt$ and subtracting $\| nabla phi.alt \|^2 \/ phi.alt^2$ proves (3.3). ◻
]

#thm([Theorem 3.2.])[
  (Average-curvature inequality).  #emph[Every smooth, closed, connected, embedded minimal hypersurface $Sigma^m subset S^(m + 1)$, $m gt.eq 2$, which is not totally geodesic satisfies 
#[#set math.equation(numbering: n => "(3.12)")
 $ integral_Sigma \| A \|^2 thin d V gt.eq m "Vol"_m \( Sigma \) . $ <eq:index-curvature-average>]

]
] <thm:curvature-average>

#proof[
  If the inequality failed, then
  $ c = 1 / V_Sigma integral_Sigma \( m - P \) thin d V > 0 . $
  Since $m - P - c$ has mean zero, the Poisson equation on the closed connected manifold has a smooth solution. Indeed, the kernel of $Delta$ consists of constants by integration by parts; the compact elliptic Fredholm alternative and regularity #cite(label("TaylorEllipticNotes")) §10, equations (10.4)–(10.6) give
  #[#set math.equation(numbering: n => "(3.13)")
   $ Delta h = m - P - c . $ <eq:index-poisson>]
  Let $K = max_Sigma \( log mu - h \)$ and let $x$ attain this maximum. The smooth positive function $phi.alt = exp \( h + K \)$ is an upper test for $mu$ at $x$. Lemma 6 and (3.13) imply
  $ m - P \( x \) lt.eq Delta log phi.alt \( x \) = m - P \( x \) - c \, $
  a contradiction. This argument uses only continuity and positivity of $mu$; it does not differentiate $mu$ or assume any weak regularity for its gradient. ◻
]

=== 3.2 Normal coordinates and conformal tests <normal-coordinates-and-conformal-tests>

The average-curvature bound is now available. To turn it into index rigidity, we need conformal coordinates orthogonal to the top Jacobi eigenfunction and a strict bound for their energy. Equality of the curvature integrals alone will not be used as a pointwise curvature statement: that step will follow from equality in each spectral test.

#thm([Lemma 3.3.])[
  (Independence of the normal coordinates).  #emph[The map $a mapsto chevron.l a \, N chevron.r$ from $bb(R)^(m + 2)$ to $C^oo \( Sigma \)$ is injective.]
] <lem:index-normal-independence>

#proof[
  Suppose $a eq.not 0$ and $chevron.l a \, N chevron.r = 0$ everywhere. Set $f = chevron.l a \, x chevron.r$. The ambient Gauss formula gives
  $ nabla^2 f = - f g + chevron.l a \, N chevron.r A = - f g . $
  This function is nonconstant: a constant solution would be zero, whereas $f equiv 0$ contradicts fullness. Obata’s sphere-rigidity theorem #cite(label("Obata1962")) Theorem A applies to the complete connected manifold $\( Sigma \, g \)$ and shows that it is isometric to the unit round $S^m$. The scalar Gauss equation for a minimal hypersurface, $"Scal"_Sigma = m \( m - 1 \) - P$, then gives $P = 0$. This contradicts the hypothesis that $Sigma$ is not totally geodesic. ◻
]

For $a in S^(m + 1)$ and $tau gt.eq 0$, put $C = cosh tau$, $S = sinh tau$, and define a conformal automorphism of the ambient sphere by

#[#set math.equation(numbering: n => "(3.14)")
 $ T_(tau \, a) \( X \) = frac(X + #scale(x: 120%, y: 120%)[\(] \( C - 1 \) chevron.l a \, X chevron.r - S #scale(x: 120%, y: 120%)[\)] a, C - S chevron.l a \, X chevron.r) . $ <eq:index-conformal-map>]

Its length factor is

#[#set math.equation(numbering: n => "(3.15)")
 $ beta_(tau \, a) \( X \) = #scale(x: 120%, y: 120%)[\(] C - S chevron.l a \, X chevron.r #scale(x: 120%, y: 120%)[\)]^(- 1) . $ <eq:index-conformal-factor>]

Indeed, with $B = I + \( C - 1 \) a a^(sans(T))$, differentiation gives

$ d T_(tau \, a) \( W \) = beta_(tau \, a) #scale(x: 120%, y: 120%)[\(] B W + S chevron.l a \, W chevron.r T_(tau \, a) \( X \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) W perp X \, $

whose inner products are $beta_(tau \, a)^2$ times those of the original tangent vectors. In particular $T_(0 \, a)$ is the identity.

The balancing step is the conformal center-of-mass argument of Li and Yau #cite(label("LiYau1982")) proof of Theorem 1, p. 274, applied to the positive Jacobi eigenfunction as in Perdomo’s argument #cite(label("Perdomo2004")) Theorem 3.1. We include the construction and the strict area identity that will be needed for equality.

#thm([Lemma 3.4.])[
  (Conformal balancing and strict area maximum).  #emph[For every smooth positive weight $u$ on $Sigma$, there is a map $T_(tau \, a)$ in (3.14) such that 
#[#set math.equation(numbering: n => "(3.16)")
 $ integral_Sigma u thin T_(tau \, a) \( x \) thin d V = 0 . $ <eq:index-balance>]

 For every $a in S^(m + 1)$ and $tau gt.eq 0$, 
#[#set math.equation(numbering: n => "(3.17)")
 $ integral_Sigma beta_(tau \, a)^(thin m) thin d V lt.eq V_Sigma \, $ <eq:index-conformal-area>]

 with strict inequality if $tau > 0$. Consequently, 
#[#set math.equation(numbering: n => "(3.18)")
 $ integral_Sigma beta_(tau \, a)^(thin 2) thin d V lt.eq V_Sigma \, $ <eq:index-conformal-energy>]

 again with strict inequality if $tau > 0$.]
] <lem:index-conformal-tests>

#proof[
  Parametrize the transformations by $z = \( tanh tau \) a$ in the open unit ball of $bb(R)^(m + 2)$, with the identity at $z = 0$. Consider
  $ F \( z \) = frac(integral_Sigma u thin T_(tau \, a) \( x \) thin d V, integral_Sigma u thin d V) . $
  As $z arrow.r a_(*) in S^(m + 1)$, the integrand tends to $- a_(*)$ at every point with $x eq.not a_(*)$. This remains true for a moving direction $a arrow.r a_(*)$. The measure $u thin d V$ assigns zero mass to a point, and the integrands have length one. Dominated convergence extends $F$ continuously to the closed ball, with $F \( a_(*) \) = - a_(*)$. If $F$ had no zero, its normalization $F \/ \| F \|$ would extend the antipodal map from the boundary sphere to the ball. The antipodal map has nonzero degree, so such an extension is impossible. A zero lies in the open ball and proves (3.16).
  To prove (3.17), fix $a$ and abbreviate $f = chevron.l a \, x chevron.r$, $eta = chevron.l a \, N chevron.r$, and $beta = beta_(tau \, a) \( x \)$. Orthogonal decomposition of $a$ into position, tangent, and normal components gives
  $ \| nabla f \|^2 = 1 - f^2 - eta^2 \, #h(2em) Delta f = - m f \, #h(2em) nabla beta = S beta^2 nabla f . $
  Integrating a divergence on the closed hypersurface yields
  $ 0 & = 1 / m integral_Sigma "div" \( beta^m nabla f \) thin d V\
 & = integral_Sigma beta^(m + 1) #scale(x: 120%, y: 120%)[\(] S \( 1 - f^2 - eta^2 \) - f \( C - S f \) #scale(x: 120%, y: 120%)[\)] thin d V\
 & = integral_Sigma beta^(m + 1) \( S - C f - S eta^2 \) thin d V . $
  Differentiation in $tau$ therefore gives the exact formula
  #[#set math.equation(numbering: n => "(3.19)")
   $ frac(d, d tau) integral_Sigma beta^m thin d V = m integral_Sigma beta^(m + 1) \( C f - S \) thin d V = - m S integral_Sigma beta^(m + 1) eta^2 thin d V . $ <eq:index-area-derivative>]
  By Lemma 8, $eta$ is not identically zero. The derivative is strictly negative for every $tau > 0$. Starting from $beta_(0 \, a) = 1$ proves (3.17) and its strictness. Finally, Hölder’s inequality, including the identity case $m = 2$, gives
  $ integral_Sigma beta^2 thin d V lt.eq V_Sigma^(thin 1 - 2 \/ m) (integral_Sigma beta^m thin d V)^(2 \/ m) lt.eq V_Sigma . $
  The second inequality is strict for $tau > 0$, proving (3.18). ◻
]

=== 3.3 The least possible index <the-least-possible-index>

We combine the curvature lower bound with the conformal energy upper bound. Under the least-index hypothesis, the two estimates force equality in the spectral comparisons and hence parallel second fundamental form.

For our Laplacian convention, the Jacobi operator and the normal second variation are

#[#set math.equation(numbering: n => "(3.20)")
 $ L = Delta + m + P \, #h(2em) delta^2 "Area" \( phi.alt N \, phi.alt N \) = - integral_Sigma phi.alt L phi.alt thin d V = integral_Sigma #scale(x: 120%, y: 120%)[\(] \| nabla phi.alt \|^2 - \( m + P \) phi.alt^2 #scale(x: 120%, y: 120%)[\)] thin d V . $ <eq:index-jacobi>]

Thus $"ind" \( Sigma \)$ counts the positive eigenvalues of $L$, with multiplicity. The operator is self-adjoint on $H^2 \( Sigma \)$ and has a complete orthonormal basis of smooth eigenfunctions #cite(label("TaylorEllipticNotes")) §10, equations (10.7)–(10.11). Its spectrum is bounded above, since its quadratic form is at most $max_Sigma \( m + P \)$ times the squared $L^2$ norm.

#thm([Proposition 3.5.])[
  (Index rigidity).  #emph[Every smooth, closed, connected, embedded minimal hypersurface $Sigma^m subset S^(m + 1)$, $m gt.eq 2$, which is not totally geodesic has 
$ "ind" \( Sigma \) gt.eq m + 3 . $

 If $"ind" \( Sigma \) = m + 3$, then, up to an ambient isometry, its image is 
$ S^k #h(-0.16667em) (sqrt(k / m)) times S^(m - k) #h(-0.16667em) (sqrt(frac(m - k, m))) quad upright("for some ") 1 lt.eq k < m . $

 In particular, such a hypersurface of volume less than $a_m$ has index strictly greater than $m + 3$.]
] <prop:index-rigidity>

#proof[
  By (3.1), the $m + 2$ normal coordinate functions satisfy $L N = m N$; they are linearly independent by Lemma 8. The largest eigenvalue $lambda_1$ of $L$ is simple and has a strictly positive eigenfunction $u$. Apply the first-eigenfunction theorem to the shifted Schrödinger operator $K - L$, with $K > 1 + max_Sigma \( m + P \)$; its positivity uses connectedness and the strong maximum principle #cite(label("TaylorSpectralNotes")) Proposition 2.9. Testing its Rayleigh quotient with the constant function gives
  $ lambda_1 gt.eq m + 1 / V_Sigma integral_Sigma P thin d V > m . $
  These eigenfunctions prove $"ind" \( Sigma \) gt.eq m + 3$.
  Suppose that equality holds. The positive spectrum consists of the simple eigenvalue $lambda_1 > m$ and the eigenvalue $m$ with multiplicity $m + 2$. The spectral theorem therefore gives
  #[#set math.equation(numbering: n => "(3.21)")
   $ integral_Sigma phi.alt L phi.alt thin d V lt.eq m integral_Sigma phi.alt^2 thin d V #h(2em) upright("whenever ") integral_Sigma u phi.alt thin d V = 0 . $ <eq:index-spectral-bound>]
  Choose the conformal map supplied by Lemma 9 for the weight $u$, and write $v = T_(tau \, a) \( x \)$. Each coordinate $v_alpha$ satisfies the orthogonality in (3.21). Since $\| v \| = 1$ and $sum_alpha \| nabla v_alpha \|^2 = m beta^2$, summing those inequalities and integrating by parts gives
  #[#set math.equation(numbering: n => "(3.22)")
   $ integral_Sigma P thin d V lt.eq m integral_Sigma beta^2 thin d V lt.eq m V_Sigma . $ <eq:index-spectral-sum>]
  Theorem 7 forces equality throughout. The strict part of (3.18) implies $tau = 0$, so $v = x$.
  We now use equality in the individual spectral inequalities. For each $alpha$, the defect
  $ d_alpha = m integral_Sigma x_alpha^2 thin d V - integral_Sigma x_alpha L x_alpha thin d V $
  is nonnegative by (3.21), and (3.22) shows $sum_alpha d_alpha = 0$. Thus every defect vanishes. In the spectral decomposition on $u^perp$, all eigenvalues are at most $m$; equality in its quadratic form implies $L x_alpha = m x_alpha$ for every $alpha$. On the other hand, (3.1) gives $L x = P x$. Taking the inner product of $\( P - m \) x = 0$ with $x$ yields
  #[#set math.equation(numbering: n => "(3.23)")
   $ P = m quad upright("everywhere on ") Sigma . $ <eq:index-pointwise-equality>]
  The pointwise conclusion uses spectral equality as well as the integrated curvature equality.
  The last identity in (3.1) now gives $nabla A = 0$. We finish by deriving the product classification. Parallelness makes the eigenvalues constant and their eigendistributions parallel. If $U$ and $W$ are unit vectors in distinct eigendistributions, the curvature tensor preserves each of those distributions, so $chevron.l R \( U \, W \) W \, U chevron.r = 0$. The Gauss equation gives
  $ 1 + lambda kappa = 0 $
  for any two distinct eigenvalues $lambda \, kappa$. There are at most two distinct eigenvalues: a third would have to equal $- 1 \/ lambda$ as well. Since $A$ is nonzero and trace-free, there are exactly two, of opposite signs. After changing $N$ if necessary, write them as
  $ lambda = sqrt(ell / k) \, #h(2em) kappa = - 1 / lambda = - sqrt(k / ell) \, #h(2em) k + ell = m \, quad k \, ell > 0 \, $
  where $k$ and $ell$ are their multiplicities.
  Let $E_lambda$ and $E_kappa$ denote the parallel tangent eigendistributions. Consider the ambient subspaces, initially depending on $x$,
  $ cal(E) \( x \) = E_lambda \( x \) xor "span" { lambda N \( x \) - x } \, #h(2em) cal(F) \( x \) = E_kappa \( x \) xor "span" { kappa N \( x \) - x } . $
  They are orthogonal and their dimensions sum to $m + 2$, because $chevron.l lambda N - x \, kappa N - x chevron.r = 1 + lambda kappa = 0$. For any tangent vector $w$ and any local section $V$ of $E_lambda$, ambient differentiation gives
  $ D_w V = nabla_w V + chevron.l w \, V chevron.r \( lambda N - x \) \, #h(2em) D_w \( lambda N - x \) = - \( lambda A + I \) w . $
  Both expressions lie in $cal(E) \( x \)$: the second vanishes on $E_kappa$ and maps $E_lambda$ to itself. Hence $cal(E)$ is a constant subspace of $bb(R)^(m + 2)$ along the connected hypersurface; the same holds for its orthogonal complement $cal(F)$. The projections of $x$ to these fixed spaces have lengths
  $ \| pi_(cal(E)) x \| = 1 / sqrt(1 + lambda^2) = sqrt(k / m) \, #h(2em) \| pi_(cal(F)) x \| = 1 / sqrt(1 + kappa^2) = sqrt(ell / m) . $
  Thus the image of $Sigma$ lies in the displayed Clifford product. The inclusion is a local diffeomorphism onto this product, since both manifolds have dimension $m$. Its image is open, and compactness makes it closed. The product is connected because $k \, ell gt.eq 1$, so the image is the entire product. The final assertion follows from the definition of $a_m$. ◻
]

== 4 Cohomological detection and the min–max input <sec:minmax>

This section establishes the topological and variational statements used below, independently of the geometric family constructed in Section 5. Its output will be a stationary integral varifold whose mass lies between a fixed threshold above the equator and the largest mass in the input family. We first identify the topological condition that forces this lower threshold, then match it to the published min–max theorem. Throughout, coefficients for chains and cohomology are $bb(Z)_2$, and

$ p = m + 3 . $

Write $upright(bold(M))$ for mass and $cal(F)$ for the flat distance of chains in $S^(m + 1)$. Let $cal(C) \( S^(m + 1) \)$ be the space of sets of finite perimeter, identified modulo sets of round volume zero, with metric

$ d \( E \, F \) = "Vol" \( E triangle.stroked.t F \) . $

The mod-two chain carried by $E$ is denoted by $\[ E \]$. The finite-perimeter representation theorem gives

#[#set math.equation(numbering: n => "(4.1)")
 $ upright(bold(M)) \( partial \[ E \] \) = "Per" \( E \) \, #h(2em) cal(F) \( partial \[ E \] - partial \[ F \] \) lt.eq d \( E \, F \) . $ <eq:minmax-perimeter>]

Indeed, the reduced boundary has multiplicity one, so reduction modulo two does not change its mass #cite(label("BDFSphere")) §2.2. Finite-mass top-dimensional mod-two chains in the sphere are represented by measurable sets, with addition given by symmetric difference #cite(label("Federer1978")) §7, pp. 317–318; see also #cite(label("White2009")) §§2.1–2.3 and Appendix.

We record why finite boundary mass gives finite perimeter in the precise case needed for fillings. Put $n = m + 1$, let $A = \[ E \]$ be such a chain, and suppose $B = partial A$ has finite mass. For a smooth tangent field $X$ on $S^n$, let $phi.alt_t$ be its flow and $H \( s \, x \) = phi.alt_s \( x \)$. The flat-chain homotopy formula, valid also with mod-two coefficients #cite(label("WhiteGMT")) §6.2, Lemma 6.4, gives

$ \( phi.alt_t \)_(\#) A - A = partial H_(\#) \( \[ 0 \, t \] times A \) + H_(\#) \( \[ 0 \, t \] times B \) = H_(\#) \( \[ 0 \, t \] times B \) . $

The first swept chain vanishes because its dimension is $n + 1$, whereas its image lies in $S^n$. On the rectifiable boundary chain, the tangential $n$-Jacobian of $H$ is at most $parallel X parallel_oo \( 1 + O_X \( t \) \)$: its time derivative is $X$, and its $n - 1$ spatial derivatives are those of a flow tending smoothly to the identity. The area formula for the swept chain therefore gives

$ "Vol" \( phi.alt_t \( E \) triangle.stroked.t E \) lt.eq t \( 1 + O_X \( t \) \) parallel X parallel_oo upright(bold(M)) \( B \) . $

Since $"Vol" \( phi.alt_t \( E \) \) = integral_E J phi.alt_t$, division by $t > 0$ and passage to zero show $lr(|integral_E "div" X|) lt.eq parallel X parallel_oo upright(bold(M)) \( B \)$. The variational definition of perimeter gives $"Per" \( E \) lt.eq upright(bold(M)) \( B \) < oo$. The reduced-boundary representation then proves equality of these masses as in (4.1). Thus this argument applies to arbitrary finite-mass fillings before any boundary regularity is known.

=== 4.1 The filling cover and projective detection <the-filling-cover-and-projective-detection>

Denote by $cal(Z)_m^0 \( S^(m + 1) \; bb(Z)_2 \)$ the flat path component of zero among finite-mass integral $m$-cycles.

#thm([Lemma 4.1.])[
  (The filling cover).  #emph[The boundary map 
$ pi : cal(C) \( S^(m + 1) \) arrow.r cal(Z)_m^0 \( S^(m + 1) \; bb(Z)_2 \) \, #h(2em) pi \( E \) = partial \[ E \] \, $

 is a two-sheeted covering map for the indicated topologies. Its deck involution is $E mapsto E^c = S^(m + 1) \\ E$.]
] <lem:minmax-cover>

#proof[
  We use the small-filling theorem in the following precise form: there are constants $nu > 0$ and $c gt.eq 1$, depending on the sphere, such that if $cal(F) \( T - T' \) < nu$, then there is an $\( m + 1 \)$-chain $R$ in the sphere with
  #[#set math.equation(numbering: n => "(4.2)")
   $ partial R = T - T' \, #h(2em) upright(bold(M)) \( R \) lt.eq c cal(F) \( T - T' \) . $ <eq:minmax-small-filling>]
  This is the isoperimetric choice described in #cite(label("MarquesNeves2017")) §3.1, p. 11; all locators for this source refer to arXiv:1311.6501v2. Applied to a sufficiently fine partition of a flat-continuous path from zero to $T$, these fillings sum to a top-dimensional chain with boundary $T$. The preceding representation therefore writes $T = partial \[ E \]$ with $E$ of finite perimeter. Conversely, intersecting any such $E$ with the increasing spherical caps ${ y_(m + 2) < t }$, $- 1 lt.eq t lt.eq 1$, gives sets of finite perimeter continuous in volume, from the empty set to $E$. Thus every $partial \[ E \]$ belongs to this path component.
  If $partial \[ E \] = partial \[ F \]$, then $partial \[ E triangle.stroked.t F \] = 0$. By (4.1), the characteristic function of $E triangle.stroked.t F$ has zero distributional gradient. Connectedness of the sphere makes it constant almost everywhere. Hence $F = E$ or $F = E^c$.
  For the covering topology, fix $T = partial \[ E \]$ and choose $delta > 0$ so that $2 delta < nu$ and $4 c delta < sigma_(m + 1)$. For $T'$ in the flat $delta$-ball about $T$, choose the small filling $R \( T \, T' \)$ from (4.2). This choice is unique: two such choices differ by zero or the whole sphere, and their total mass is smaller than $sigma_(m + 1)$. If $T'$ and $T''$ are in the ball, the same argument applied to
  $ R \( T \, T' \) + R \( T \, T'' \) + R \( T' \, T'' \) $
  shows that this cycle is zero: its mass is at most $4 c delta$. Consequently the filling branch determined by
  $ \[ E_(T') \] = \[ E \] + R \( T \, T' \) $
  satisfies $d \( E_(T') \, E_(T'') \) lt.eq c cal(F) \( T' - T'' \)$. It and its complementary branch are continuous and exhaust the preimage of the ball. They are disjoint open branches in that preimage, distinguished by volume distance from $E$ less than, or greater than, $sigma_(m + 1) \/ 2$. Together with (4.1), this proves the assertion. ◻
]

Let

$ lambda in H^1 #scale(x: 120%, y: 120%)[\(] cal(Z)_m^0 \( S^(m + 1) \; bb(Z)_2 \) \; bb(Z)_2 #scale(x: 120%, y: 120%)[\)] $

be the class of this cover: its value on a loop is one precisely when a lifted filling path ends at the complement of its initial filling. This description also identifies $lambda$ with the class in the usual Almgren–Pitts sweepout definition. Indeed, partition a loop into small flat increments and lift it to $E_t$. The sum of its small fillings is $\[ E_1 \] + \[ E_0 \]$, which is zero or $\[ S^(m + 1) \]$ according to the monodromy. This is exactly Almgren’s homology class of the loop #cite(label("MarquesNeves2017")) §§3.1–3.3 and the beginning of §4.

#prodef([Definition 4.2.])[
  (Detection).  A flat-continuous map $Phi : X arrow.r cal(Z)_m^0 \( S^(m + 1) \; bb(Z)_2 \)$ from a finite CW complex is #emph[detecting] if
  $ \( Phi^(*) lambda \)^p eq.not 0 quad upright("in ") H^p \( X \; bb(Z)_2 \) . $
  Detection is preserved by flat homotopies. We say that $Phi$ has #emph[no concentration of mass] if
  #[#set math.equation(numbering: n => "(4.3)")
   $ lim_(rho arrow.b 0) med sup_(x in X \, thin z in S^(m + 1)) parallel Phi \( x \) parallel \( B_rho \( z \) \) = 0 . $ <eq:minmax-no-concentration>]
] <def:detecting>

The following criterion records exactly the topology needed for the family in Section 5.

#thm([Lemma 4.3.])[
  (Projective criterion).  #emph[Set $Q = overline(B)^(m + 2) times \[ - 1 \, 1 \]$. Suppose $q mapsto E_q in cal(C) \( S^(m + 1) \)$ is continuous in volume, with 
$ E_(- q) = E_q^c quad \( q in partial Q \) \, #h(2em) E_(\( 0 \, - 1 \)) = diameter \, quad E_(\( 0 \, 1 \)) = S^(m + 1) . $

 Then $q mapsto partial \[ E_q \]$ descends to a detecting map on $Q \/ \( q tilde.op - q upright(" on ") partial Q \) tilde.equiv bb(R P)^p$.]
] <lem:minmax-projective>

#proof[
  Radial projection identifies the centrally symmetric convex body $Q$ with the closed $p$-ball, respecting antipodes. Its boundary-antipodal quotient is therefore $bb(R P)^p$. Complementary fillings have the same mod-two boundary, so (4.1) and the quotient property give a flat-continuous descended map $Phi$. The fillings themselves specify local branches of its pulled-back cover, not a single filling on the quotient. At a boundary seam one uses $E_q$ in one collar and the complementary choice in the collar of $- q$; these choices agree along the identified boundary and are continuous in volume.
  The segment $b mapsto \( 0 \, b \)$ becomes a closed loop in this quotient. Its displayed lift starts at the empty set and ends at the whole sphere. Hence $Phi^(*) lambda$ is the nonzero degree-one class $alpha$ of $bb(R P)^p$. The projective cohomology ring is
  $ H^(*) \( bb(R P)^p \; bb(Z)_2 \) = bb(Z)_2 \[ alpha \] \/ \( alpha^(p + 1) \) \, #h(2em) \| alpha \| = 1 $
  #cite(label("Hatcher2002")) Theorem 3.19, p. 220. In particular $\( Phi^(*) lambda \)^p = alpha^p eq.not 0$. ◻
]

=== 4.2 A strict perimeter gap <a-strict-perimeter-gap>

#thm([Lemma 4.4.])[
  (Detection gap).  #emph[There is a constant $gamma_m > sigma_m$, depending only on $m$, such that every detecting map satisfies 
$ sup_(x in X) upright(bold(M)) \( Phi \( x \) \) gt.eq gamma_m . $

]
] <lem:detection-gap>

#proof[
  First consider the constrained class of finite-perimeter sets
  $ cal(A)_m = {E subset S^(m + 1) : "Vol" \( E \) = sigma_(m + 1) / 2 \, quad integral_E y thin d "Vol" \( y \) = 0} . $
  It is nonempty: the union of two antipodal caps, with their common radius chosen to give half the spherical volume, belongs to it. Define
  #[#set math.equation(numbering: n => "(4.4)")
   $ gamma_m = inf_(E in cal(A)_m) "Per" \( E \) . $ <eq:minmax-gamma>]
  This number is finite. A minimizing sequence has bounded perimeter; compactness for sets of finite perimeter on the compact sphere yields a subsequence converging in $L^1$ to a set $E$ of finite perimeter. The volume and all centroid coordinates pass to the limit, while perimeter is lower semicontinuous. Thus $E in cal(A)_m$ realizes (4.4). These are the usual BV compactness and lower-semicontinuity statements in local charts #cite(label("SimonGMT")) Chapter 2, Theorem 2.6, pp. 54–55; a finite chart cover gives the compact-sphere assertion used here.
  Spherical isoperimetry says that a half-volume set has perimeter at least $sigma_m$, with equality only for a hemisphere modulo null sets #cite(label("BDFSphere")) §2.3, equation (2.2), p. 5. The centroid of the hemisphere ${ y dot.op a > 0 }$, $\| a \| = 1$, is
  $ integral_(y dot.op a > 0) y thin d "Vol" \( y \) = frac(sigma_m, m + 1) a eq.not 0 . $
  The minimizer in $cal(A)_m$ therefore cannot attain $sigma_m$, proving $gamma_m > sigma_m$.
  Now pull the filling cover back by $Phi$. On this cover the function
  #[#set math.equation(numbering: n => "(4.5)")
   $ \( x \, E \) mapsto ("Vol" \( E \) - sigma_(m + 1) / 2 \, integral_E y thin d "Vol" \( y \)) in bb(R)^(m + 3) $ <eq:minmax-odd-map>]
  is continuous and changes sign under $E mapsto E^c$. If it never vanished, normalization would give an equivariant map to $S^(p - 1)$ and hence a quotient map $f : X arrow.r bb(R P)^(p - 1)$. Fiberwise this identifies the filling cover with the pullback of $S^(p - 1) arrow.r bb(R P)^(p - 1)$: each of its two points is sent to one of the two antipodal unit vectors. It follows that $Phi^(*) lambda = f^(*) alpha$, so $\( Phi^(*) lambda \)^p = f^(*) \( alpha^p \) = 0$, contrary to detection. At a zero of (4.5) the filling belongs to $cal(A)_m$, and its cycle has mass $"Per" \( E \) gt.eq gamma_m$ by (4.1). ◻
]

=== 4.3 Cubical parameters and the precise min–max consequence <cubical-parameters-and-the-precise-minmax-consequence>

#thm([Lemma 4.5.])[
  (Cubical replacement).  #emph[A detecting map on $bb(R P)^p$ can be pulled back to a detecting map on a finite cubical complex, preserving its mass supremum and its no-concentration property.]
] <lem:minmax-cubical>

#proof[
  Embed $bb(R P)^p$ in the Euclidean space of real symmetric $\( p + 1 \) times \( p + 1 \)$ matrices by $\[ u \] mapsto u u^t$, $\| u \| = 1$. Each such matrix has a simple top eigenvalue $1$, separated from the remaining eigenvalues $0$. On a neighborhood $U$ of this compact image the top eigenvalue remains simple, and its eigenline gives a continuous retraction to $bb(R P)^p$. Choose a sufficiently fine finite cubical grid in a larger cube, and let $K$ be the union of the closed cubes meeting the image, together with their faces. Then $K subset U$. After an affine rescaling it is a finite cubical subcomplex of a subdivided unit cube.
  Let $i : bb(R P)^p arrow.r K$ be the inclusion and $r : K arrow.r bb(R P)^p$ the restricted retraction. Since $r compose i = upright("id")$, the map $r^(*)$ is injective on cohomology. Thus $Phi compose r$ detects whenever $Phi$ does. Surjectivity of $r$ makes the two cycle images identical, proving both remaining assertions. The dimension of $K$ may exceed $p$. Only its finiteness and its detecting cohomology class are needed here. ◻
]

#thm([Theorem 4.6.])[
  (Min–max consequence).  #emph[Let $m gt.eq 2$, and let $Phi : X arrow.r cal(Z)_m^0 \( S^(m + 1) \; bb(Z)_2 \)$ be a detecting map on a finite cubical complex, with no concentration of mass and 
$ D_0 = sup_(x in X) upright(bold(M)) \( Phi \( x \) \) < oo . $

 There is a stationary integral $m$-varifold $V$ in $S^(m + 1)$ such that 
#[#set math.equation(numbering: n => "(4.6)")
 $ gamma_m lt.eq parallel V parallel \( S^(m + 1) \) lt.eq D_0 . $ <eq:minmax-output>]

 If $2 lt.eq m lt.eq 6$, $V$ can be chosen as a finite sum of smooth closed embedded minimal hypersurfaces with positive integer multiplicities. The same conclusions hold for a family on $bb(R P)^p$.]
] <thm:minmax>

#proof[
  We specify both the imported results and the width comparison. For a discrete map $phi.alt$ on the vertices of a cubical subdivision, its #emph[fineness] is
  $ upright(bold(f)) \( phi.alt \) = max { upright(bold(M)) \( phi.alt \( v \) - phi.alt \( w \) \) : v \, w upright(" are adjacent vertices") } . $
  An $\( X \, upright(bold(M)) \)$-homotopy sequence consists of uniformly mass-bounded discrete maps whose successive maps are joined, after subdivision, by discrete homotopies of fineness tending to zero. Two sequences represent the same class if their corresponding maps are joined by such homotopies with fineness tending to zero. These are the conventions of #cite(label("MarquesNeves2017")) §§2.2–2.6, pp. 6–7.
  The discretization theorem #cite(label("MarquesNeves2017")) Theorem 3.9, p. 13, applied using (4.3), provides such a sequence $cal(S) = { phi.alt_i }$ with $upright(bold(f)) \( phi.alt_i \) arrow.r 0$ and
  $ limsup_i max_v upright(bold(M)) \( phi.alt_i \( v \) \) lt.eq D_0 . $
  For any sufficiently fine discrete map, the Almgren extension $hat(phi.alt) : X arrow.r cal(Z)_m^0 \( S^(m + 1) \; bb(Z)_2 \)$ is continuous in the mass norm and satisfies
  #[#set math.equation(numbering: n => "(4.7)")
   $ sup_X upright(bold(M)) \( hat(phi.alt) \) lt.eq max_v upright(bold(M)) \( phi.alt \( v \) \) + C_X upright(bold(f)) \( phi.alt \) \, $ <eq:minmax-extension>]
  where $C_X$ is fixed #cite(label("MarquesNeves2017")) Theorem 3.10, p. 14. Moreover, the extensions of $phi.alt_i$ are flat homotopic to $Phi$ for all sufficiently large $i$ #cite(label("MarquesNeves2017")) Corollary 3.12(ii), p. 15.
  Let $Pi$ be the class of $cal(S)$, and write
  $ upright(bold(L)) \( Pi \) = inf_(cal(S)' in Pi) upright(bold(L)) \( cal(S)' \) \, #h(2em) upright(bold(L)) \( cal(S)' \) = limsup_i max_v upright(bold(M)) \( phi.alt'_i \( v \) \) \, quad cal(S)' = { phi.alt'_i } . $
  Certainly $upright(bold(L)) \( Pi \) lt.eq D_0$. Fix #emph[one] competitor $cal(S)' in Pi$. Its homotopies to $cal(S)$ have fineness tending to zero. Therefore their Almgren extensions are flat homotopic for all sufficiently large indices, by #cite(label("MarquesNeves2017")) Corollary 3.12(i), p. 15. Each $hat(phi.alt)'_i$ is then detecting. Lemma 14 and (4.7) give
  $ gamma_m lt.eq sup_X upright(bold(M)) \( hat(phi.alt)'_i \) lt.eq max_v upright(bold(M)) \( phi.alt'_i \( v \) \) + C_X upright(bold(f)) \( phi.alt'_i \) . $
  Taking the upper limit proves $gamma_m lt.eq upright(bold(L)) \( cal(S)' \)$. Since the competitor was arbitrary,
  $ 0 < gamma_m lt.eq upright(bold(L)) \( Pi \) lt.eq D_0 . $
  The index beyond which the extensions detect may depend on $cal(S)'$; no threshold uniform over all competitors is used. This is the continuous/discrete detection compatibility also recorded in #cite(label("MarquesNeves2017")) Lemma 4.6, p. 16.
  The Almgren–Pitts existence theorem in #cite(label("MarquesNeves2017")) Theorem 2.14, p. 10 now gives a stationary #emph[integral] varifold at mass $upright(bold(L)) \( Pi \)$, almost minimizing in annuli. That theorem has no dimension restriction. Its low-dimensional regularity consequence is #cite(label("MarquesNeves2017")) Theorem 2.11, pp. 8–9, which gives the stated smooth embedded support for $2 lt.eq m lt.eq 6$. These results are the mod-two form of the Almgren–Pitts theory; the integrality input is #cite(label("Pitts1981")) Theorem 3.13, and the regularity extension is #cite(label("SchoenSimon1981")) Theorem 4. This proves (4.6). For projective parameters, first apply Lemma 15. ◻
]

#prodef([Remark 4.7.])[
  For $m = 2 \, 3$, the smooth output in Theorem 16 has a closed associated mod-two chain: each closed component contributes its integer multiplicity modulo two. This supplies the cyclicity needed in Section 6. For $m gt.eq 4$ we use only stationarity and integrality of the output; regularity will follow from the density argument there. No min–max index estimate or multiplicity-one theorem is used. In particular, increasing the dimension of the cubical parameter complex imposes no new index requirement. The local index deformation in Section 5 is performed on the projective family before this cubical replacement.
] <rem:minmax-scope>

== 5 A Lorentz-distance family <sec:family>

Throughout this section, $Sigma^m subset S^(m + 1)$ is smooth, closed, connected, embedded, minimal, and not totally geodesic, with $m gt.eq 2$. Write $\| Sigma \| = "Vol"_m \( Sigma \)$ and $d mu$ for its area measure. Choose a global unit normal $N$, with shape operator $A = - d N$. The construction below uses the signed Euclidean distance to the cone over $Sigma$. Acting on its graph by Lorentz transformations produces a family whose area can be estimated on the fixed source $Sigma$, including at cut points and at infinite boosts. The use of distance levels, compactified parameters, and a local index deformation has antecedents in the canonical-family construction of Marques and Neves #cite(label("MarquesNeves2014")) Sections 2.3 and 10. Here the transformation acts on the graph of Euclidean cone distance; the complementary fillings will supply projective detection.

#thm([Proposition 5.1.])[
  (The Lorentz-distance family).  #emph[Let $p = m + 3$ and 
$ Q = overline(B)^(m + 2) times \[ - 1 \, 1 \] \, #h(2em) u = \( v \, b \) . $

 Identify opposite points of $partial Q$, and denote the quotient map by $q : Q arrow.r bb(R P)^p$. There is a flat-continuous map 
$ Phi : bb(R P)^p arrow.r cal(Z)_m^0 \( S^(m + 1) \; bb(Z)_2 \) $

 with the following properties.]
  + #emph[The map $Phi$ is detecting in the sense of Definition 12, has no concentration of mass, and satisfies 
$ Phi \( q \( 0 \, 0 \) \) = partial \[ Omega \] \, #h(2em) upright(bold(M)) \( Phi \( q \( 0 \, 0 \) \) \) = \| Sigma \| \, $

 where $Omega$ is the side of $Sigma$ opposite to $N$. For $r = sqrt(1 - b^2)$ its masses obey 
#[#set math.equation(numbering: n => "(5.1)")
 $ upright(bold(M)) \( Phi \( q \( v \, b \) \) \) lt.eq cases(delim: "{", r^m \| Sigma \| \, & \| v \| < 1 \,, r^m sigma_m \, & \| v \| = 1 .) $ <eq:family-mass-bounds>]

 In particular $\| Sigma \| gt.eq gamma_m > sigma_m$, where $gamma_m$ is the constant in Lemma 14.]
  + #emph[The central parameter is the unique maximum, in the uniform sense that for every neighborhood $U$ of $\( 0 \, 0 \)$ in $Q$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ sup_(u in Q \\ U) upright(bold(M)) \( Phi \( q \( u \) \) \) < \| Sigma \| . $ <eq:family-away-gap>]

]
  + #emph[Near $\( 0 \, 0 \)$ these cycles are precisely the multiplicity-one boundaries of a smooth family of domains, with embedded boundaries parametrized by $Sigma$. The normal derivative at the center, in the parameter direction $\( d \, t \) in bb(R)^(m + 2) times bb(R)$, is 
#[#set math.equation(numbering: n => "(5.3)")
 $ w_(d \, t) \( x \) = t + chevron.l d \, x chevron.r . $ <eq:family-normal-variations>]

 These variations form a $p$-dimensional subspace on which the area second variation is negative definite.]
  + #emph[If $"ind" \( Sigma \) > p$, there is a flat homotopy of $Phi$, supported in the image of a neighborhood of $\( 0 \, 0 \)$, to a detecting map $tilde(Phi)$ with no concentration of mass and 
#[#set math.equation(numbering: n => "(5.4)")
 $ sup_(xi in bb(R P)^p) upright(bold(M)) \( tilde(Phi) \( xi \) \) < \| Sigma \| . $ <eq:family-strict-deformation>]

]
] <prop:lorentz-family>

We first parametrize closest-point contacts and estimate every level. The same source estimate then gives no concentration, including at infinite boosts, and the complementary boundary fillings establish detection. Finally, we isolate the central maximum and deform it using an additional negative direction. The only global area input needed to begin the construction is $\| Sigma \| gt.eq sigma_m$, furnished by cone monotonicity in Proposition 3.

=== 5.1 Signed distance and closest-point contact <signed-distance-and-closest-point-contact>

Let $cal(C) = C \( Sigma \) subset bb(R)^(m + 2)$ include its vertex. The two sides of $Sigma$ determine two sides of $cal(C)$. Let $phi$ be signed Euclidean distance to $cal(C)$, positive on the side pointed to by $N$ and zero on $cal(C)$. This function is homogeneous of degree one under positive dilations and is $1$-Lipschitz. For points on the same side, the latter assertion is the ordinary distance inequality. For points on opposite sides, their joining segment meets $cal(C)$, and the sum of their distances to $cal(C)$ is at most the length of that segment.

#thm([Lemma 5.2.])[
  (Cone contact).  #emph[There is $K < 1$ such that 
#[#set math.equation(numbering: n => "(5.5)")
 $ \| phi \( z \) \| lt.eq K \| z \| #h(2em) \( z in bb(R)^(m + 2) \) . $ <eq:family-spacelike-bound>]

 For $z eq.not 0$, put $h = phi \( z \)$. Every closest point of $cal(C)$ to $z$ has the form $r_z x$, with $x in Sigma$ and 
#[#set math.equation(numbering: n => "(5.6)")
 $ r_z = sqrt(\| z \|^2 - h^2) > 0 \, #h(2em) z = r_z x + h N \( x \) \, #h(2em) r_z I - h A \( x \) gt.eq 0 . $ <eq:family-contact>]

 The final inequality is an inequality of self-adjoint endomorphisms of $T_x Sigma$.]
] <lem:family-cone-contact>

#proof[
  Define $H \( z \) = max_(x in Sigma) chevron.l z \, x chevron.r$. Lemma 5 gives $integral_Sigma x thin d mu = 0$ and fullness. Thus $H \( z \) > 0$ for $z eq.not 0$: a nonpositive coordinate function of mean zero would vanish identically. Compactness gives $c = min_(\| z \| = 1) H \( z \) > 0$. Minimizing first along each ray of the cone gives
  $ "dist" \( z \, cal(C) \)^2 = \| z \|^2 - H \( z \)^2 lt.eq \( 1 - c^2 \) \| z \|^2 . $
  This proves (5.5) with $K = sqrt(1 - c^2)$ and excludes the vertex as a closest point to nonzero $z$.
  A closest ray is determined by a maximum $x$ of $chevron.l z \, dot.op chevron.r$, and its radial coordinate is $H \( z \)$. At this maximum the tangential component of $z$ vanishes, so $z = H \( z \) x + tilde(h) N \( x \)$, where $\| tilde(h) \| = \| h \|$. The segment from $z$ to its closest point meets no earlier cone point. Its side near contact therefore agrees with the side of $z$, proving $tilde(h) = h$ with our signed-distance convention. Finally, at this height maximum the spherical immersion formula gives
  $ nabla_Sigma^2 chevron.l z \, x chevron.r = - H \( z \) I + h A lt.eq 0 . $
  These arguments apply to each maximum separately and therefore also apply when there are several closest points. ◻
]

=== 5.2 The transformed graph and its level parametrization <the-transformed-graph-and-its-level-parametrization>

For $v in B^(m + 2)$ write

$ v = tanh tau thin a \, #h(2em) C = cosh tau \, quad S = sinh tau \, quad B = I + \( C - 1 \) a a^t \, $

where $\| a \| = 1$ and $tau gt.eq 0$. At $v = 0$, the expressions below are understood by continuity; they do not depend on the choice of $a$. Indeed, $S a = C v$ and $\( C - 1 \) a a^t = C^2 v v^t \/ \( C + 1 \)$ are smooth in $v$. Use the Lorentz transformation

#[#set math.equation(numbering: n => "(5.7)")
 $ z = B y + b S a \, #h(2em) h = C b + S chevron.l a \, y chevron.r \, #h(2em) \| z \|^2 - h^2 = \| y \|^2 - b^2 . $ <eq:family-boost>]

#thm([Lemma 5.3.])[
  (Global graph and compactification).  #emph[For each $v in B^(m + 2)$ the inverse image under (5.7) of $h = phi \( z \)$ is the graph of a continuous function $b = psi_v \( y \)$ on all of $bb(R)^(m + 2)$. The functions depend continuously on $\( v \, y \)$. On $S^(m + 1)$ they satisfy $\| psi_v \| < 1$ and extend jointly continuously to $overline(B)^(m + 2) times S^(m + 1)$ by 
#[#set math.equation(numbering: n => "(5.8)")
 $ psi_a \( y \) = - chevron.l a \, y chevron.r #h(2em) \( \| a \| = 1 \) . $ <eq:family-boundary-graph>]

]
] <lem:family-graph>

#proof[
  For fixed $v \, y$, consider
  $ F_(v \, y) \( b \) = C b + S chevron.l a \, y chevron.r - phi \( B y + b S a \) . $
  The Lipschitz property of $phi$ gives, when $b_2 > b_1$,
  $ F_(v \, y) \( b_2 \) - F_(v \, y) \( b_1 \) gt.eq \( C - S \) \( b_2 - b_1 \) > 0 . $
  The same estimate implies limits $- oo$ and $+ oo$ at the two ends of the real line. Hence there is exactly one zero, and the local positive lower bound for $C - S$ proves continuous dependence of that zero on finite parameters and $y$.
  At a graph point with $\| y \| = 1$, (5.5) and Lorentz invariance give
  #[#set math.equation(numbering: n => "(5.9)")
   $ 1 - b^2 = \| z \|^2 - h^2 gt.eq \( 1 - K^2 \) \| z \|^2 \, #h(2em) \| h \| lt.eq K / sqrt(1 - K^2) sqrt(1 - b^2) . $ <eq:family-graph-estimate>]
  Equality $\| b \| = 1$ would force $z = h = 0$, contrary to $\| y \| = 1$ and invertibility of the boost. Thus $\| b \| < 1$. Since $b + chevron.l v \, y chevron.r = h \/ C$, we also obtain
  #[#set math.equation(numbering: n => "(5.10)")
   $ sup_(\| y \| = 1) \| psi_v \( y \) + chevron.l v \, y chevron.r \| lt.eq frac(K, C sqrt(1 - K^2)) . $ <eq:family-uniform-compactification>]
  This tends to zero as $\| v \| arrow.r 1$, uniformly in $y$ and in the boost direction, proving the claimed extension. ◻
]

Fix now $\| v \| < 1$ and $- 1 < b < 1$, and put $r = sqrt(1 - b^2)$. For $x in Sigma$ define

#[#set math.equation(numbering: n => "(5.11)")
 $ f = chevron.l a \, x chevron.r \, #h(2em) g = chevron.l a \, N chevron.r \, #h(2em) D = C - S g > 0 \,\
N' = frac(B N - S a, D) \, #h(2em) h_(v \, b) \( x \) = frac(b + S r f, D) \,\
Y_(v \, b) \( x \) = r \( B x + S f N' \) + b N' . $ <eq:family-level-formulas>]

These are obtained by applying the inverse boost

$ y = B z - S h a \, #h(2em) b = C h - S chevron.l a \, z chevron.r $

to $z = r x + h N$. In fact the second equation becomes $b = D h - S r f$, which gives precisely the displayed $h_(v \, b)$ and $Y_(v \, b)$.

The differential of this map has an especially useful form. For $w perp N \( x \)$ set

$ O w = B w + S chevron.l a \, w chevron.r N' . $

The identities $B^2 = I + S^2 a a^t$ and

$ \| B N - S a \|^2 = D^2 \, #h(2em) chevron.l B w \, N' chevron.r = - S chevron.l a \, w chevron.r quad \( w perp N \) $

show that $\| N' \| = 1$ and that $O : N^perp arrow.r \( N' \)^perp$ is a linear isometry. In particular,

#[#set math.equation(numbering: n => "(5.12)")
 $ Y_(v \, b) = r O x + b N' in S^(m + 1) \, #h(2em) chevron.l N' \, Y_(v \, b) chevron.r = b . $ <eq:family-orthogonal-decomposition>]

The two pointwise normal planes in Figure 1 explain the roles of the scalars. In $z = r x + h N$, the ratio $h \/ r$ is the tangent of the signed angle from $x$ to $z \/ \| z \|$; in (5.12), $b$ is the sine of the signed angle from $O x$ to $Y_(v \, b)$. Although $r$ is fixed on a level, $h_(v \, b)$ generally varies with $x$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((1.2, 2.9), [#text(size: 9pt)[Source contact plane]])
  line((0, 0), (2.7, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.7, 0), [#text(size: 9pt)[$x$]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (0, 2.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, 2.5), [#text(size: 9pt)[$N(x)$]], anchor: "east", padding: 0.1176cm)
  line((1.6, 0), (1.6, 1.8), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, 0), (1.6, 1.8), stroke: (paint: rgb("#234d73"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#234d73"))))
  circle((1.6, 1.8), radius: 0.04586, fill: black, stroke: none)
  content((1.6, 1.8), [#text(size: 9pt)[$z="rx"+"hN"$]], anchor: "south-west", padding: 0.1176cm)
  content((0.8, 0), [#text(size: 9pt)[$r$]], anchor: "north", padding: 0.1176cm)
  content((1.6, 0.9), [#text(size: 9pt)[$h$]], anchor: "west", padding: 0.1176cm)
  content((8.2, 2.9), [#text(size: 9pt)[Transformed normal plane]])
  line((7, 0), (9.7, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((9.7, 0), [#text(size: 9pt)[$"Ox"$]], anchor: "west", padding: 0.1176cm)
  line((7, 0), (7, 2.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((7, 2.5), [#text(size: 9pt)[$N'(x)$]], anchor: "east", padding: 0.1176cm)
  arc((9, 0), start: 0deg, stop: 100deg, radius: 2, stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((8.6, 0), (8.6, 1.2), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((7, 0), (8.6, 1.2), stroke: (paint: rgb("#234d73"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#234d73"))))
  circle((8.6, 1.2), radius: 0.04586, fill: black, stroke: none)
  content((8.6, 1.2), [#text(size: 9pt)[$Y="rOx"+"bN"'$]], anchor: "south-west", padding: 0.1176cm)
  content((7.8, 0), [#text(size: 9pt)[$r$]], anchor: "north", padding: 0.1176cm)
  content((8.6, 0.6), [#text(size: 9pt)[$b$]], anchor: "west", padding: 0.1176cm)
  content((9.6, 2.1), [#text(size: 9pt)[$|Y|=1$]])
})],
  caption: [Figure 1: The two decompositions at a fixed closest-point contact, shown schematically with positive normal coefficients. Lorentz invariance makes the coefficient $r = sqrt(1 - b^2)$ the same in both planes. The source vector $z$ need not be unit length. On a fixed level, $b$ is constant while $h = h_(v \, b) \( x \)$ can vary. The isometry $O$ and normal $N'$ depend on the source point; the picture does not represent a single ambient rotation. ],
) <fig:family-normal-planes>

Differentiating $N'$ and then $Y_(v \, b)$, with $v \, b$ fixed, gives

$ d N' = D^(- 1) #scale(x: 120%, y: 120%)[\(] B thin d N + S thin d g thin N' #scale(x: 120%, y: 120%)[\)] = D^(- 1) O thin d N \, $

and consequently

#[#set math.equation(numbering: n => "(5.13)")
 $ d Y_(v \, b) & = r O thin d x + \( b + r S f \) D^(- 1) O thin d N = O \( r I - h_(v \, b) A \) \,\
J_m Y_(v \, b) & = \| det \( r I - h_(v \, b) A \) #scale(x: 120%, y: 120%)[\|] . $ <eq:family-jacobian>]

Here $J_m$ is the metric $m$-dimensional Jacobian; the isometry $O$ accounts for the entire ambient change in the differential.

=== 5.3 Every level has the required perimeter bound <every-level-has-the-required-perimeter-bound>

Define

$ E_(v \, b) = { y in S^(m + 1) : psi_v \( y \) < b } \, #h(2em) Lambda_(v \, b) = { y in S^(m + 1) : psi_v \( y \) = b } . $

For finite boosts and interior levels, also define the closed source set

$ T_(v \, b) = { x in Sigma : r I - h_(v \, b) \( x \) A \( x \) gt.eq 0 } . $

#thm([Lemma 5.4.])[
  (The restricted area bound).  #emph[Every $E_(v \, b)$, for $\( v \, b \) in Q$, has finite perimeter. For $\| v \| < 1$, $\| b \| < 1$ and every open set $U subset S^(m + 1)$, 
#[#set math.equation(numbering: n => "(5.14)")
 $ "Per" \( E_(v \, b) \; U \) & lt.eq cal(H)^m \( Lambda_(v \, b) ∩ U \)\
 & lt.eq integral_(T_(v \, b) ∩ Y_(v \, b)^(- 1) \( U \)) det \( r I - h_(v \, b) A \) thin d mu \, $ <eq:family-restricted-perimeter>]

 and on $T_(v \, b)$, 
#[#set math.equation(numbering: n => "(5.15)")
 $ 0 lt.eq det \( r I - h_(v \, b) A \) lt.eq r^m lt.eq 1 . $ <eq:family-restricted-density>]

 Thus these estimates hold at every level, without an exceptional set of values of $b$.]
] <lem:family-all-levels>

#proof[
  Take $y in Lambda_(v \, b)$ and transform $\( y \, b \)$ to $\( z \, h \)$ by (5.7). Lemma 19 supplies a closest point $r_z x$. Lorentz invariance gives $r_z^2 = \| z \|^2 - h^2 = 1 - b^2$, so $r_z = r$. The inverse formulas then show that $h = h_(v \, b) \( x \)$, $y = Y_(v \, b) \( x \)$, and $x in T_(v \, b)$. Therefore
  #[#set math.equation(numbering: n => "(5.16)")
   $ Lambda_(v \, b) subset Y_(v \, b) \( T_(v \, b) \) . $ <eq:family-level-cover>]
  The nonnegative eigenvalues of $r I - h_(v \, b) A$ have sum $m r$, because $"tr" A = 0$. Their arithmetic–geometric mean inequality proves (5.15). The area formula #cite(label("Federer1969")) §3.2.3 #cite(label("Federer1978")) §3, pp. 299–300, with multiplicities counted in its source integral, now yields the second inequality in (5.14). The condition defining $T_(v \, b)$ is only necessary for a closest-point contact. Additional points in this source set, and multiple preimages of a level point, increase the upper bound and cause no difficulty.
  In particular $cal(H)^m \( Lambda_(v \, b) \) < oo$. Since $E_(v \, b)$ is open, its essential boundary is contained in its topological boundary, which is contained in $Lambda_(v \, b)$. The finite-essential-boundary criterion #cite(label("Federer1978")) §4, p. 302, applied in coordinate charts, gives finite perimeter. The intrinsic reduced-boundary representation #cite(label("BDFSphere")) §2.2 then gives
  $ "Per" \( E_(v \, b) \; U \) = cal(H)^m \( partial^(*) E_(v \, b) ∩ U \) lt.eq cal(H)^m \( Lambda_(v \, b) ∩ U \) . $
  This proves the first inequality with constant one.
  For $\| v \| < 1$ the endpoint sublevels are empty and full, respectively. For $\| v \| = 1$, formula (5.8) makes them round caps, whose boundary masses are $sigma_m \( 1 - b^2 \)^(m \/ 2)$, with zero mass at $b = plus.minus 1$. These cases also have finite perimeter. ◻
]

All of the levels $Lambda_(v \, b)$ have zero $\( m + 1 \)$-dimensional volume: this follows from their finite $m$-dimensional measure in the interior; on the boost boundary they are round spheres or singletons; and at finite-boost endpoints they are empty. If $\( v_j \, b_j \) arrow.r \( v \, b \)$, Lemma 20 gives uniform convergence of $psi_(v_j) - b_j$ to $psi_v - b$. Indicators of the sublevels consequently converge pointwise off $Lambda_(v \, b)$. Dominated convergence proves

#[#set math.equation(numbering: n => "(5.17)")
 $ "Vol"_(m + 1) \( E_(v_j \, b_j) triangle.stroked.t E_(v \, b) \) arrow.r 0 . $ <eq:family-filling-continuity>]

Thus

$ hat(Phi) \( v \, b \) = partial \[ E_(v \, b) \] $

is flat continuous on $Q$, since the flat distance between two of these cycles is at most the volume of the symmetric difference of their fillings. Its mass equals the perimeter of the filling, so (5.1) follows from Lemma 21.

=== 5.4 Infinite boosts and no concentration of mass <infinite-boosts-and-no-concentration-of-mass>

We have obtained a flat-continuous family with the required total mass bound. To apply the min–max theorem, we must also control its mass in small balls uniformly over parameters, including boosts tending to infinity. The restricted Jacobian estimate lets us do this on the one fixed compact source $Sigma$.

#thm([Lemma 5.5.])[
  (No concentration).  #emph[The family $hat(Phi)$ satisfies 
#[#set math.equation(numbering: n => "(5.18)")
 $ lim_(rho arrow.b 0) #h(0.27778em) sup_(\( v \, b \) in Q) sup_(y in S^(m + 1)) parallel hat(Phi) \( v \, b \) parallel \( B_rho \( y \) \) = 0 . $ <eq:family-no-concentration>]

]
] <lem:family-no-concentration>

#proof[
  We prove the sequential form of the assertion. Consider $u_j = \( v_j \, b_j \) arrow.r \( v_(*) \, b_(*) \)$, $y_j arrow.r y_(*)$, and $rho_j arrow.b 0$. The case $\| b_(*) \| = 1$ follows directly from (5.1). Parameters on $\| v \| = 1$ are harmless as well: an $m$-sphere of Euclidean radius $r$ in any affine $\( m + 1 \)$-plane has at most $c_m rho^m$ area in a ball of radius $rho$, uniformly in $r$ and the plane. For $r lt.eq 2 rho$ use its total area; for $r > 2 rho$ the intersection lies in a spherical cap with angular radius at most $arcsin \( rho \/ r \)$, and the same bound follows by the cap area formula. Spherical balls in the ambient unit sphere lie in Euclidean balls of the same radius. We may therefore pass to a subsequence with $\| v_j \| < 1$ and $\| b_(*) \| < 1$.
  Put $Y_j = Y_(v_j \, b_j)$ and $T_j = T_(v_j \, b_j)$. The local perimeter bound reduces the desired assertion to
  #[#set math.equation(numbering: n => "(5.19)")
   $ integral_Sigma I_j thin d mu arrow.r 0 \, #h(2em) I_j = upright(bold(1))_(T_j) thin upright(bold(1))_(Y_j^(- 1) \( B_(rho_j) \( y_j \) \)) thin J_m Y_j . $ <eq:family-concentration-integrands>]
  The restricted bound gives $0 lt.eq I_j lt.eq 1$ on the fixed compact source.
  If $\| v_(*) \| < 1$, the maps $Y_j$ converge smoothly on $Sigma$ to $Y_(*) = Y_(v_(*) \, b_(*))$. Away from the fiber $Y_(*)^(- 1) \( y_(*) \)$, the ball indicator in (5.19) eventually vanishes. The area formula applied to the fiber gives
  $ integral_(Y_(*)^(- 1) \( y_(*) \)) J_m Y_(*) thin d mu = 0 \, $
  because a singleton has zero $cal(H)^m$ measure. Thus $J_m Y_(*) = 0$ almost everywhere on that fiber, and smooth convergence gives $I_j arrow.r 0$ there almost everywhere as well. Dominated convergence completes this case.
  It remains to consider $v_(*) = a$ with $\| a \| = 1$. Write $a_j = v_j \/ \| v_j \|$, $t_j = S_j \/ C_j = \| v_j \|$, and $f_j = chevron.l a_j \, x chevron.r$, $g_j = chevron.l a_j \, N chevron.r$. The cancellation identity
  #[#set math.equation(numbering: n => "(5.20)")
   $ B x + S f N' = x + f thin frac(S N - \( C - 1 \) a, D) $ <eq:family-cancelled-map>]
  gives
  $ Y_j = r_j [x + f_j frac(t_j N - \( 1 - C_j^(- 1) \) a_j, 1 - t_j g_j)] + b_j N'_j . $
  On compact subsets of $Sigma \\ Z_a$, where $Z_a = { x : N \( x \) = a }$, the denominators stay uniformly positive. Also
  $ N'_j = frac(C_j^(- 1) N + \( 1 - C_j^(- 1) \) g_j a_j - t_j a_j, 1 - t_j g_j) arrow.r - a . $
  The maps and all their source derivatives therefore converge locally to
  #[#set math.equation(numbering: n => "(5.21)")
   $ Y_oo \( x \) = r_(*) [x + frac(chevron.l a \, x chevron.r, 1 - chevron.l a \, N chevron.r) \( N - a \)] - b_(*) a \, #h(2em) r_(*) = sqrt(1 - b_(*)^2) . $ <eq:family-infinite-map>]
  This computation allows the directions $a_j$ to vary.
  The exceptional normal fiber $Z_a$ is source-null. Indeed $Z_a subset { x : chevron.l a \, x chevron.r = 0 }$, whereas $chevron.l a \, x chevron.r$ is a nontrivial analytic function by Lemma 5. Its zero set has zero $m$-dimensional measure. No rank assumption on the Gauss map is involved.
  The point fiber $F = Y_oo^(- 1) \( y_(*) \)$, defined off $Z_a$, may instead have positive source measure. On a countable cover by relatively compact coordinate patches in $Sigma \\ Z_a$, the area formula gives
  $ integral_(F ∩ K) J_m Y_oo thin d mu = 0 $
  for each such patch $K$. Hence $J_m Y_oo = 0$ almost everywhere on $F$. Off $F union Z_a$ the shrinking-ball indicator is eventually zero; on $F$, local smooth convergence gives $J_m Y_j arrow.r 0$ almost everywhere. We conclude that $I_j arrow.r 0$ almost everywhere on $Sigma$, and $0 lt.eq I_j lt.eq 1$ again permits dominated convergence. In particular, convergence of the indicators $upright(bold(1))_(T_j)$ is unnecessary. Only the restricted Jacobians are bounded; no bound for the unrestricted $J_m Y_j$ near $Z_a$ has been used.
  Finally, if (5.18) failed, compactness of $Q$ and $S^(m + 1)$ would supply sequences of the above form whose ball masses stay bounded below by a positive constant. The sequential result excludes them. ◻
]

=== 5.5 The projective parameter space <the-projective-parameter-space>

On $\| v \| = 1$, formula (5.8) gives

$ E_(v \, b) = { chevron.l v \, y chevron.r > - b } \, #h(2em) E_(- v \, - b) = { chevron.l v \, y chevron.r < - b } . $

These fillings are complementary modulo their null common level. On the top and bottom faces they are full and empty, respectively. Together with the volume continuity in (5.17), these facts verify every hypothesis of Lemma 13. Therefore $hat(Phi) \( u \) = partial \[ E_u \]$ descends to a flat-continuous detecting map $Phi$ on $bb(R P)^p$. Its image is unchanged by passage to the quotient, so Lemma 22 also gives no concentration for $Phi$.

At $\( 0 \, 0 \)$, $psi_0 = phi$ on the sphere, and the level is $Sigma$, with sublevel $Omega$. Combining the upper mass bound, Lemma 22, and Lemma 14 proves part (i) of Proposition 18, in particular

#[#set math.equation(numbering: n => "(5.22)")
 $ \| Sigma \| gt.eq gamma_m > sigma_m . $ <eq:family-gap>]

=== 5.6 Uniform area loss away from the center <uniform-area-loss-away-from-the-center>

The family now detects the required cohomology class and has no concentration. We next prove that all parameters away from the original hypersurface lose a uniform amount of area. This isolates the maximum that the extra negative direction will remove.

#thm([Lemma 5.6.])[
  (A fixed source patch gives strict loss).  #emph[For every neighborhood $U$ of $\( 0 \, 0 \)$, (5.2) holds.]
] <lem:family-strict-loss>

#proof[
  Suppose otherwise. There are $u_j = \( v_j \, b_j \) in Q \\ U$ with $upright(bold(M)) \( hat(Phi) \( u_j \) \) arrow.r \| Sigma \|$. The mass bound forces $b_j arrow.r 0$. Parameters on the boost boundary have mass at most $sigma_m$, which is strictly smaller by (5.22); discard those terms. After taking a subsequence, $v_j arrow.r v_(*) eq.not 0$. Set $t_(*) = \| v_(*) \| in \( 0 \, 1 \]$ and $a = v_(*) \/ \| v_(*) \|$. Discard finitely many terms so that $v_j eq.not 0$. For each $j$, set $t_j = \| v_j \|$, $a_j = v_j \/ \| v_j \|$, $C_j = \( 1 - t_j^2 \)^(- 1 \/ 2)$, $r_j = sqrt(1 - b_j^2)$, $f_j = chevron.l a_j \, x chevron.r$, and $g_j = chevron.l a_j \, N chevron.r$.
  The open set ${ A eq.not 0 }$ is nonempty. The analytic function $f = chevron.l a \, x chevron.r$ cannot vanish on that entire open set, by fullness and connectedness. Choose a compact source patch $K_0$ of positive measure on which $\| A \|$ and $\| f \|$ are bounded below by positive constants. It is also disjoint from ${ N = a }$, because $N = a$ implies $f = 0$. On this fixed patch, the formula for $h_j = h_(v_j \, b_j)$ becomes
  $ h_j = frac(b_j \/ C_j + t_j r_j f_j, 1 - t_j g_j) arrow.r h_(*) := frac(t_(*) f, 1 - t_(*) chevron.l a \, N chevron.r) \, $
  uniformly. Its limit is finite and nonzero on $K_0$, including when $t_(*) = 1$.
  For a real symmetric matrix $M$, define its truncated determinant by
  $ cal(D) \( M \) = cases(delim: "{", det M \, & M gt.eq 0 \,, 0 \, & M gt.eq.not 0 .) $
  This is continuous: every boundary point of the positive-semidefinite cone is singular, so its determinant vanishes. At every $x in K_0$, the matrix $I - h_(*) \( x \) A \( x \)$ has trace $m$ and is not the identity. If it is positive semidefinite, strictness in the arithmetic–geometric mean inequality gives determinant less than one; if it is not, $cal(D)$ is zero. Compactness of $K_0$ and continuity therefore give $delta > 0$ with
  $ cal(D) \( I - h_(*) A \) lt.eq 1 - 2 delta quad upright("on ") K_0 . $
  For all large $j$ this yields $cal(D) \( r_j I - h_j A \) lt.eq r_j^m - delta$ on $K_0$. On all of $Sigma$, the restricted determinant is at most $r_j^m$. Thus the area formula estimate gives
  $ upright(bold(M)) \( hat(Phi) \( u_j \) \) lt.eq integral_Sigma cal(D) \( r_j I - h_j A \) thin d mu lt.eq r_j^m \| Sigma \| - delta mu \( K_0 \) \, $
  contradicting convergence to $\| Sigma \|$. The proof supplies a uniform loss on a fixed portion of the source; it makes no upper-semicontinuity assumption about area in the flat topology. ◻
]

=== 5.7 The entire central level is a smooth boundary <the-entire-central-level-is-a-smooth-boundary>

#thm([Lemma 5.7.])[
  (The central tube).  #emph[For all sufficiently small $\( v \, b \)$, the entire level $Lambda_(v \, b)$ is $Y_(v \, b) \( Sigma \)$, with $Y_(v \, b)$ a smooth embedding depending smoothly on the parameters. Every level point has a unique closest-point contact in the cone representation. Moreover 
#[#set math.equation(numbering: n => "(5.23)")
 $ nabla_(S^(m + 1)) psi_v = N' - b Y_(v \, b) \, #h(2em) \| nabla_(S^(m + 1)) psi_v \| = r > 0 quad upright("on ") Lambda_(v \, b) . $ <eq:family-regular-level>]

 Thus $Lambda_(v \, b) = partial E_(v \, b) = partial^(*) E_(v \, b)$ and its boundary cycle has multiplicity one.]
] <lem:family-central-tube>

#proof[
  Use a tubular neighborhood of the smooth cone on a compact annulus containing ${ s x : x in Sigma \, med 1 \/ 2 lt.eq s lt.eq 3 \/ 2 }$, constructed inside a slightly larger annulus. Compact embeddedness supplies a uniform $epsilon.alt > 0$ so that, for these central radii and $\| h \| < epsilon.alt$, the point $s x + h N \( x \)$ has unique closest cone point $s x$, and signed distance $h$. This is a tube for the whole cone: after shrinking $epsilon.alt$, points at radii outside the larger annulus cannot be closest, and uniqueness within that annulus follows from its tubular neighborhood.
  For any actual level point $y in Lambda_(v \, b)$, the boost gives
  $ \| h \| = \| C b + S chevron.l a \, y chevron.r \| lt.eq C \| b \| + S arrow.r 0 quad upright("as ") \( v \, b \) arrow.r \( 0 \, 0 \) . $
  Every closest cone point has radius $r = sqrt(1 - b^2) arrow.r 1$. Thus all actual contacts lie in this one fixed tube, so each is unique. Conversely, for every source point $x$, the inverse formula gives
  $ \| h_(v \, b) \( x \) \| lt.eq frac(\| b \| + S r, C - S) arrow.r 0 $
  uniformly on $Sigma$. Consequently $z = r x + h_(v \, b) \( x \) N \( x \)$ lies in the same tube and really has signed distance $h_(v \, b) \( x \)$. Its transformed point $Y_(v \, b) \( x \)$ is therefore an actual level point. This proves equality with the entire level and uniqueness of its source representation, not merely existence of one nearby component.
  For these parameters the matrix $r I - h_(v \, b) A$ is uniformly positive definite, so (5.13) gives an immersion. Uniqueness of the contact and invertibility of the boost give injectivity; compactness then gives an embedding. All the formulas are smooth in $\( v \, b \, x \)$ near the center.
  In the tube $d phi = N dot.op d z$. Differentiating the graph relation at one of the level points yields
  $ 0 = d h - N dot.op d z = D #scale(x: 120%, y: 120%)[\(] d b - N' dot.op d y #scale(x: 120%, y: 120%)[\)] . $
  The derivative with respect to $b$ is $D > 0$, so the graph is smooth near that point and its Euclidean gradient is $N'$. Projecting onto the tangent space of the unit sphere and using (5.12) proves (5.23). Each level point therefore has a neighborhood in which $E_(v \, b)$ is one side of a regular smooth hypersurface. This proves the claimed topological and reduced boundary identities, with multiplicity one. ◻
]

=== 5.8 The extra index direction removes the maximum <the-extra-index-direction-removes-the-maximum>

Expand the central embedding in the Euclidean parameter $u = \( v \, b \) in bb(R)^p$:

#[#set math.equation(numbering: n => "(5.24)")
 $ Y_(v \, b) \( x \) = x + \( b + chevron.l v \, x chevron.r \) N \( x \) + O \( \| u \|^2 \) . $ <eq:family-first-variation>]

The error is smooth and uniform with its source derivatives. The functions in (5.3) are independent: integrating a relation $t + chevron.l d \, x chevron.r = 0$ gives $t = 0$, and fullness then gives $d = 0$. To evaluate their second variation, use $L = Delta + m + P$, $P = \| A \|^2$, and write $w = t + f$, $f = chevron.l d \, x chevron.r$. Since $Delta f = - m f$ and $integral_Sigma f thin d mu = 0$,

#[#set math.equation(numbering: n => "(5.25)")
 $ integral_Sigma w L w thin d mu = m \| Sigma \| t^2 + integral_Sigma P \( t + f \)^2 thin d mu > 0 #h(2em) upright("if ") \( d \, t \) eq.not 0 . $ <eq:family-positive-form>]

For $t eq.not 0$ the first term suffices. For $t = 0$, $d eq.not 0$, the nontrivial analytic function $f$ cannot vanish throughout the nonempty open set where $P > 0$. The minimal second-variation formula is $delta^2 "Area" \( w \, w \) = - integral_Sigma w L w thin d mu$. Lemma 24 ensures that it computes the mass of the actual boundary family, proving part (iii) of the proposition.

Assume now that $"ind" \( Sigma \) > p$. Let

$ W = { t + chevron.l d \, x chevron.r : t in bb(R) \, med d in bb(R)^(m + 2) } \, #h(2em) cal(B) \( phi.alt \, chi \) = integral_Sigma phi.alt L chi thin d mu . $

Choose a finite-dimensional subspace spanned by $L$-eigenfunctions with positive eigenvalues, of dimension greater than $p$. The $p$ linear conditions $cal(B) \( eta \, w \) = 0$ for $w in W$ admit a nonzero smooth solution $eta$ in that subspace. Then $cal(B) \( eta \, eta \) > 0$, and (5.25) implies that $cal(B)$ is positive definite on $W xor bb(R) eta$.

Extend $eta N$ to a smooth ambient vector field on $S^(m + 1)$, and let $F_s$ be its flow. For small $u \, s$, set

$ E \( u \, s \) = F_s \( E_u \) \, #h(2em) cal(A) \( u \, s \) = "Per" \( E \( u \, s \) \) \, #h(2em) E_u = E_(v \, b) . $

Lemma 24 makes $cal(A)$ smooth in a neighborhood of $\( 0 \, 0 \)$. Its first derivative there vanishes by minimality, and its Hessian is negative definite, by the preceding positive-form calculation. Taylor’s theorem therefore gives constants $c > 0$ and $delta > 0$ such that

#[#set math.equation(numbering: n => "(5.26)")
 $ cal(A) \( u \, s \) lt.eq \| Sigma \| - c \( \| u \|^2 + s^2 \) #h(2em) upright("when ") \| u \|^2 + s^2 lt.eq delta^2 . $ <eq:family-morse-estimate>]

Shrink $delta$ so that this ball lies inside the central smooth parameter region.

Choose a smooth nonnegative function $beta \( u \)$ supported in $\| u \| < delta \/ 2$ and equal to one near $u = 0$. For sufficiently small $epsilon > 0$, replace $E_u$ on that region by $E \( u \, epsilon beta \( u \) \)$ and leave it unchanged elsewhere. The compact graph

$ { \( u \, epsilon beta \( u \) \) : \| u \| lt.eq delta \/ 2 } $

misses $\( 0 \, 0 \)$. It is contained in the ball on which (5.26) holds, so its area maximum is strictly below $\| Sigma \|$. On the complement of $\| u \| < delta \/ 2$, the same strict upper bound, possibly with a different positive gap, follows from Lemma 23. The boundaries of the modified domains consequently define a map $tilde(Phi)$ satisfying (5.4).

Replacing $epsilon$ by $t epsilon$, $0 lt.eq t lt.eq 1$, gives a flat homotopy, fixed outside the chosen interior neighborhood of $Q$. It descends through the quotient and preserves the detecting class. On the modified region, the boundaries belong to a compact smooth family of embeddings of $Sigma$, and hence have no concentration of mass. For completeness, a finite cover by coordinate graph patches, with uniform metric and first-derivative bounds over the compact parameter set, bounds their masses in radius-$rho$ balls by a constant times $rho^m$. Outside that region the original no-concentration estimate applies unchanged. This proves part (iv). Part (ii) is Lemma 23, so the proof of Proposition 18 is complete.

== 6 Low-density cones and attainment <sec:cones>

We now obtain the compactness needed to minimize among counterexamples. The regularity argument has two induction parameters: the hypersurface dimension $m$ in Theorem 1, and the dimension of a Euclidean cone. Keeping them separate is essential. The theorem in dimensions less than $m$ will classify cones of dimension at most $m$, and these classifications will give a smooth link for a cone of dimension $m + 1$.

For a varifold $V$, its weight measure is $parallel V parallel$ and its total mass, when finite, is $upright(bold(M)) \( V \)$. For a smooth embedded submanifold $S$, write $upright(bold(v)) \( S \)$ for its associated varifold with multiplicity one. For an integral $k$-varifold in Euclidean space, $\[ V \]$ denotes the locally rectifiable flat chain with coefficients in $bb(Z)_2$ obtained by reducing its integer multiplicity modulo two. We call $V$ #emph[cyclic modulo two] if $partial \[ V \] = 0$ locally in the ambient open set. This convention applies to noncompact cones and their translates, using locally flat chains as in #cite(label("White2009")) §2.1 and Appendix.

=== 6.1 Coning, density, and the radial factor <coning-density-and-the-radial-factor>

#thm([Lemma 6.1.])[
  (The cone operation).  #emph[Let $d gt.eq 1$ and let $V$ be a stationary integral $d$-varifold in the unit sphere $S^(d + 1)$. Its Euclidean cone $cal(C) \( V \)$ is a stationary integral $\( d + 1 \)$-varifold in $bb(R)^(d + 2)$, and 
#[#set math.equation(numbering: n => "(6.1)")
 $ parallel cal(C) \( V \) parallel \( B_R \( 0 \) \) = frac(R^(d + 1), d + 1) upright(bold(M)) \( V \) \, #h(2em) Theta \( cal(C) \( V \) \, 0 \) = frac(upright(bold(M)) \( V \), sigma_d) . $ <eq:cones-mass>]

 If $V$ is a finite sum of smooth closed embedded minimal hypersurfaces with positive integer multiplicities, then $cal(C) \( V \)$ is cyclic modulo two.]
] <lem:cone-operation>

#proof[
  At a spherical point $x$ with tangent plane $P subset x^perp$, assign to $r x$ the plane $bb(R) x xor P$ and the measure $r^d thin d r thin d V \( x \, P \)$. This defines the cone and gives (6.1). The polar map is a diffeomorphism away from the origin; rectifiability and integer multiplicity there follow from the area formula. The origin has zero mass.
  For stationarity, first take a smooth ambient field $X$ supported away from the origin and write $X \( r x \) = f \( r \, x \) x + Y_r \( x \)$, where $Y_r \( x \) perp x$. The trace of its derivative on the cone plane is
  $ "div"_(bb(R) x xor P) X \( r x \) = partial_r f \( r \, x \) + d / r f \( r \, x \) + 1 / r "div"_P^S Y_r \( x \) . $
  After multiplication by $r^d$ and integration, the first two terms integrate to the endpoint values of $r^d f$, and the last term vanishes by spherical stationarity for each $r$. Thus the cone is stationary off the origin. For a general compactly supported $X$, insert a radial cutoff that is zero on $B_epsilon$ and one outside $B_(2 epsilon)$, with derivative bounded by $c \/ epsilon$. Formula (6.1) bounds the omitted first-variation terms by $c_X \( epsilon^(d + 1) + epsilon^d \)$, which tends to zero.
  For the last assertion, $\[ cal(C) \( V \) \]$ has zero boundary on every annulus: an odd component multiplicity gives a smooth mod-two product cylinder, and an even multiplicity gives zero. Truncate this chain inside radius $epsilon$. Its difference from the full chain has mass at most $upright(bold(M)) \( V \) epsilon^(d + 1) \/ \( d + 1 \)$, whereas its inner boundary has mass at most $upright(bold(M)) \( V \) epsilon^d$. The truncated chains therefore converge locally flat to $\[ cal(C) \( V \) \]$ and their boundaries converge locally flat to zero. Continuity of the boundary operator proves $partial \[ cal(C) \( V \) \] = 0$ also at the vertex. ◻
]

We use the stationary monotonicity formula, tangent-cone existence, and integral-varifold closure of Allard #cite(label("Allard1972")) §5 and Theorem 6.4; see also the formulations in #cite(label("SimonGMT")) Chapter 4, §3 and #cite(label("White2009")) Theorem 3.2. In particular, on a fixed open set, locally bounded mass and locally bounded first variation give a subsequence with an integral-varifold limit. For the stationary sequences below the first variation is identically zero. White’s convergence theorem then gives the additional implication

#[#set math.equation(numbering: n => "(6.2)")
 $ V_i arrow.r V \, quad delta V_i = 0 \, quad partial \[ V_i \] = 0 quad arrow.r.double quad partial \[ V \] = 0 \, $ <eq:cones-white>]

provided the masses are locally bounded. Indeed, Allard gives integrality of $V$; the first variations satisfy White’s local bound with bound zero; and the boundary chains converge to zero. These are precisely the hypotheses of #cite(label("White2009")) Definition 3.1 and Theorem 3.3. The same statement applies after any translations and dilations, and hence to the blow-ups used below.

#thm([Lemma 6.2.])[
  (Density at every support point).  #emph[Let $V$ be a stationary integral $k$-varifold in an open set $U subset bb(R)^n$. At every $z in "spt" parallel V parallel$, $Theta \( V \, z \) gt.eq 1$. If $V = cal(C)$ is a cone in all of $bb(R)^n$, then 
#[#set math.equation(numbering: n => "(6.3)")
 $ 1 lt.eq Theta \( cal(C) \, z \) lt.eq Theta \( cal(C) \, 0 \) #h(2em) \( z in "spt" parallel cal(C) parallel \) . $ <eq:cones-density-comparison>]

 Every tangent cone at such a point is nonzero and has density $Theta \( cal(C) \, z \)$ at its vertex.]
] <lem:cones-density>

#proof[
  Integrality gives density at least one at $parallel V parallel$-almost every point. Every neighborhood of $z$ has positive mass, so choose such points $x_i arrow.r z$. If $overline(B_r \( z \)) subset U$ and $d_i = \| x_i - z \| < r$, monotonicity at $x_i$ and ball inclusion give
  $ parallel V parallel \( B_r \( z \) \) gt.eq parallel V parallel \( B_(r - d_i) \( x_i \) \) gt.eq omega_k \( r - d_i \)^k . $
  Let $i arrow.r oo$, then $r arrow.b 0$. This proves the asserted lower bound also at support points that are exceptional for rectifiability.
  For a cone, its homogeneous mass measure gives $parallel cal(C) parallel \( B_R \( 0 \) \) = omega_k Theta \( cal(C) \, 0 \) R^k$. For $R > \| z \|$, the inclusions
  $ B_(R - \| z \|) \( 0 \) subset B_R \( z \) subset B_(R + \| z \|) \( 0 \) $
  identify the limit of the mass ratios centered at $z$ as $R arrow.r oo$ with $Theta \( cal(C) \, 0 \)$. Monotonicity proves the upper bound in (6.3). Tangent-cone existence and the monotonicity formula give the stated tangent density, which is positive by the first part. ◻
]

#thm([Lemma 6.3.])[
  (Splitting the radial line).  #emph[Let $k gt.eq 2$ and let $cal(C)$ be a stationary integral $k$-dimensional cone in $bb(R)^(k + 1)$. For $0 eq.not z in "spt" parallel cal(C) parallel$, every tangent cone $T$ at $z$ has the form 
$ T = upright(bold(v)) \( bb(R) e \) times W \, #h(2em) e = z \/ \| z \| \, $

 where $W$ is a nonzero stationary integral $\( k - 1 \)$-dimensional cone in $e^perp tilde.equiv bb(R)^k$ and 
#[#set math.equation(numbering: n => "(6.4)")
 $ Theta \( W \, 0 \) = Theta \( T \, 0 \) = Theta \( cal(C) \, z \) . $ <eq:cones-factor-density>]

 If $cal(C)$ is cyclic modulo two, so are $T$ and $W$.]
] <lem:cones-splitting>

#proof[
  Write $T_i = \( eta_(z \, rho_i) \)_(\#) cal(C) arrow.r T$, where $eta_(z \, rho_i) \( y \) = \( y - z \) \/ rho_i$ and $rho_i arrow.b 0$. For fixed $b in bb(R)$, dilation invariance of $cal(C)$ by the positive factors $1 + b rho_i$ implies invariance of $T_i$ under
  $ y mapsto \( 1 + b rho_i \) y + b z . $
  Passing to the limit shows that $T$ is invariant under translation by $b z$. Its weight consequently disintegrates as $parallel T parallel = cal(L)^1 ⊗ nu$ on $bb(R) e xor e^perp$.
  We check that this is an integral varifold product. At almost every rectifiable point of $T$, a measure blow-up is an integer multiple of the measure on its approximate tangent plane. These blow-ups retain invariance under translations in the $e$-direction, so that plane contains $e$. The tangential Jacobian of the coordinate $pi \( t e + w \) = t$ is therefore one almost everywhere. Rectifiable coarea gives, for almost every $t$, a $\( k - 1 \)$-rectifiable slice with the original integer multiplicities; its tangent plane is the intersection of the tangent plane of $T$ with $e^perp$. Product disintegration identifies the weight of this slice, after translation to $e^perp$, with $nu$. Thus $nu$ defines an integral varifold $W$ and the tangent-plane identification gives $T = upright(bold(v)) \( bb(R) e \) times W$ as varifolds. Here we use rectifiable coarea #cite(label("Federer1978")) §3, p. 300.
  For a compactly supported field $Y$ on $e^perp$ and a compactly supported smooth function $chi$ on $bb(R)$ with $integral chi eq.not 0$, test stationarity of $T$ with $X \( t e + w \) = chi \( t \) Y \( w \)$. Since $Y$ is perpendicular to $e$,
  $ 0 = delta T \( X \) = (integral_(bb(R)) chi \( t \) thin d t) delta W \( Y \) . $
  Hence $W$ is stationary. Dilation invariance of the tangent cone $T$ and the product formula imply dilation invariance of $W$. Writing $theta = Theta \( W \, 0 \)$, integration over a ball gives
  $ parallel T parallel \( B_1 \) = theta omega_(k - 1) integral_(- 1)^1 \( 1 - t^2 \)^(\( k - 1 \) \/ 2) thin d t = theta omega_k . $
  This proves (6.4); Lemma 26 makes $W$ nonzero.
  If $partial \[ cal(C) \] = 0$, every $T_i$ is cyclic, and (6.2) implies $partial \[ T \] = 0$. The mod-two slicing identity for the boundary #cite(label("White1999")) §3, equation (1) and Proposition 3.1 gives
  $ partial chevron.l \[ T \] \, pi \, t chevron.r = chevron.l partial \[ T \] \, pi \, t chevron.r = 0 quad upright("for almost every ") t \, $
  where signs disappear modulo two. For the locally flat chain, apply the identity on a countable exhaustion by relatively compact regions; restriction compatibility gives one full-measure set of levels where it holds locally everywhere. Choose one such level where the preceding rectifiable slice description also holds. The slice there is the translate of $\[ W \]$ to $t e + e^perp$, because $T$ is the product just established. Translation back proves $partial \[ W \] = 0$. No assertion about whether zero is a good slicing level is needed. ◻
]

For clarity, we also record the precise regularity consequence used in the dimension reduction.

#thm([Lemma 6.4.])[
  (A multiplicity-one planar tangent).  #emph[Let $V$ be a stationary integral $k$-varifold, $k gt.eq 2$, in an open subset of Euclidean space. If one tangent cone at $z$ is a multiplicity-one plane, then in a neighborhood of $z$, $V$ is a smooth embedded minimal submanifold with multiplicity one.]
] <lem:cones-allard>

#proof[
  Apply Allard’s interior regularity theorem #cite(label("Allard1972")) §8, in the formulation of #cite(label("SimonGMT")) Chapter 5, hypotheses (5.1) and Theorem 5.2, on a sufficiently small rescaled ball from the sequence giving that tangent. Its hypotheses hold as follows. Integrality supplies the almost-everywhere density lower bound one. Stationarity supplies zero generalized mean curvature and zero first variation, hence the required mean-curvature bound for any exponent greater than $k$. Convergence to the multiplicity-one plane supplies normalized mass arbitrarily close to $omega_k$ and arbitrarily small height and tangent-plane excess on a fixed smaller ball. The center remains in the support. Allard’s theorem therefore gives a single $C^(1 \, alpha)$ graph near the center. On that connected graph the stationary integral multiplicity is constant; its tangent multiplicity is one, so the constant is one. The higher-regularity conclusion of #cite(label("SimonGMT")) Chapter 5, Theorem 6.1, applied with the smoothly prescribed mean curvature identically zero, makes the graph smooth; that statement permits arbitrary codimension. This theorem has no stability hypothesis and no upper bound on $k$. ◻
]

=== 6.2 The cone induction <the-cone-induction>

#thm([Proposition 6.5.])[
  (Low-density cones).  #emph[Fix $m gt.eq 2$ and assume Theorem 1 in dimensions $2 \, dots.h \, m - 1$, with an empty assumption when $m = 2$. Let $cal(C)$ be a nonzero stationary integral $k$-dimensional cone in $bb(R)^(k + 1)$ such that 
#[#set math.equation(numbering: n => "(6.5)")
 $ Theta \( cal(C) \, 0 \) < theta.alt_m . $ <eq:cones-threshold>]

 When $m = 2$ or $m = 3$, also assume that $cal(C)$ is cyclic modulo two. Then:]
  + #emph[if $1 lt.eq k lt.eq m$, $cal(C)$ is a multiplicity-one hyperplane;]
  + #emph[if $k = m + 1$, $cal(C)$ is smooth embedded with multiplicity one away from its vertex. Its link in $S^(m + 1)$ is a smooth closed connected embedded minimal hypersurface.]
] <prop:low-density-cones>

#proof[
  Hold $m$ fixed throughout. We prove (i) by induction in $k$ and then obtain (ii) from the final induction step.
  An integral one-dimensional cone is a finite union of rays with positive integer weights: radial slicing of its conical rectifiable measure gives a zero-dimensional integral measure on the unit circle, and local finiteness makes its total weight finite. Write the distinct unit ray directions as $u_j$, their weights as $q_j$, and $N = sum_j q_j$. Stationarity at the origin says
  $ sum_j q_j u_j = 0 \, #h(2em) Theta \( cal(C) \, 0 \) = N \/ 2 . $
  If $m gt.eq 4$, Lemma 2 gives $theta.alt_m lt.eq 3 \/ 2$, so the strict bound (6.5) gives $N < 3$. Nonzero stationarity excludes $N = 1$, leaving two opposite rays of weight one. If $m = 2$ or $3$, the same lemma gives $theta.alt_m < 2$, hence $N < 4$; cyclicity says that the boundary coefficient $N$ at the origin is even. Again $N = 2$ and balance gives a multiplicity-one line. This proves the base case in both branches.
  Suppose next that $2 lt.eq k lt.eq m + 1$ and that (i) has been proved in dimension $k - 1$. At any nonzero support point $z$, Lemma 27 expresses a tangent as $upright(bold(v)) \( bb(R) \) times W$. Its factor is nonzero, stationary and integral, is cyclic when required, and has density at most $Theta \( cal(C) \, 0 \) < theta.alt_m$ by Lemma 26. The induction hypothesis makes $W$ a multiplicity-one plane. Thus this tangent of $cal(C)$ is a multiplicity-one plane, and Lemma 28 proves smooth embedded multiplicity-one structure near $z$.
  It follows that $Lambda = "spt" parallel cal(C) parallel ∩ S^k$ is a smooth closed embedded $\( k - 1 \)$-manifold. The radial direction lies in the cone tangent plane and is normal to the sphere, so this intersection is transverse. Polar coarea gives $cal(C) = cal(C) \( upright(bold(v)) \( Lambda \) \)$ with multiplicity one. Reversing the angular first-variation calculation in Lemma 25 shows that $Lambda$ is minimal in $S^k$.
  Each connected component $Lambda_j$ is compact and minimal, and its cone is stationary. Lemma 26 applied to that cone, together with (6.1), yields
  #[#set math.equation(numbering: n => "(6.6)")
   $ frac("Vol" \( Lambda_j \), sigma_(k - 1)) gt.eq 1 . $ <eq:cones-component>]
  Since the total cone density is less than $theta.alt_m < 2$, there is only one component.
  If $k = 2$, a closed connected embedded minimal curve in $S^2$ is a great circle by the geodesic equation, so its cone is a plane. If $3 lt.eq k lt.eq m$ and $Lambda$ were not totally geodesic, the outer induction in dimension $k - 1$ would give
  $ Theta \( cal(C) \, 0 \) = frac("Vol" \( Lambda \), sigma_(k - 1)) gt.eq theta.alt_(k - 1) gt.eq theta.alt_m \, $
  contrary to (6.5). Thus $Lambda$ is a great sphere and $cal(C)$ a multiplicity-one plane, completing (i). For $k = m + 1$, the already proved plane assertion in dimension $m$ gives exactly the smoothness and connectedness asserted in (ii). We do not apply the dimension-$m$ volume statement to this last link. ◻
]

#thm([Corollary 6.6.])[
  (Spherical stationary output).  #emph[Under the outer induction hypothesis of Proposition 29, let $V eq.not 0$ be a stationary integral $m$-varifold in $S^(m + 1)$ with $upright(bold(M)) \( V \) < a_m$. If $m = 2$ or $3$, assume additionally that $cal(C) \( V \)$ is cyclic modulo two; this holds, in particular, if $V$ has smooth closed embedded support with integer component multiplicities. Then $V = upright(bold(v)) \( Sigma \)$ for a smooth closed connected embedded minimal hypersurface $Sigma$. If $upright(bold(M)) \( V \) > sigma_m$, this hypersurface is not an equator.]
] <cor:cones-spherical-output>

#proof[
  Lemma 25 and the mass bound put $cal(C) \( V \)$ under part (ii) of Proposition 29. Its smooth multiplicity-one link identifies $V$ by the polar cone formula. An equator has area $sigma_m$. ◻
]

=== 6.3 Exact attainment <exact-attainment>

#thm([Proposition 6.7.])[
  (A least counterexample).  #emph[Fix $m gt.eq 2$ and assume Theorem 1 in dimensions $2 \, dots.h \, m - 1$. Suppose the class $cal(E)_m$ of smooth closed connected embedded minimal hypersurfaces $Sigma subset S^(m + 1)$ satisfying 
$ Sigma upright(" is not totally geodesic") \, #h(2em) "Vol" \( Sigma \) < a_m $

 is nonempty. Then 
$ H = inf_(Sigma in cal(E)_m) "Vol" \( Sigma \) $

 is attained by some $Sigma_(*) in cal(E)_m$, and 
#[#set math.equation(numbering: n => "(6.7)")
 $ sigma_m < gamma_m lt.eq H < a_m . $ <eq:cones-attainment-gap>]

 Here $gamma_m$ is the detection gap from Lemma 14.]
] <prop:attainment>

#proof[
  For every member of $cal(E)_m$, the family of Proposition 18 is detecting and has maximum mass at most its area. Lemma 14 therefore gives $"Vol" \( Sigma \) gt.eq gamma_m > sigma_m$. Nonemptiness gives $H < a_m$, proving (6.7).
  Choose $Sigma_i in cal(E)_m$ with areas $H_i arrow.r H$ and set $cal(C)_i = cal(C) \( upright(bold(v)) \( Sigma_i \) \)$. These cones are stationary, integral, and cyclic by Lemma 25. Their exact masses satisfy
  #[#set math.equation(numbering: n => "(6.8)")
   $ parallel cal(C)_i parallel \( B_R \( 0 \) \) = frac(H_i R^(m + 1), m + 1) #h(2em) \( R > 0 \) . $ <eq:cones-exact-sequence>]
  Consequently their masses are uniformly bounded on every compact set. Allard’s integral-varifold compactness theorem and a diagonal subsequence give a stationary integral limit $cal(C)$ in all of $bb(R)^(m + 2)$. Every fixed dilation leaves each $cal(C)_i$ invariant, so by continuity of pushforward it leaves $cal(C)$ invariant as well. White’s theorem in the form (6.2) gives $partial \[ cal(C) \] = 0$.
  We verify that the limiting mass is exactly $H$ at the spherical level. The weight of the conical limit is homogeneous of degree $m + 1$. It has zero mass on every sphere of positive radius: otherwise dilation would produce infinitely many disjoint spheres with uniformly positive mass in a fixed compact annulus. Weak convergence can thus be evaluated on every centered ball. Passing to the limit in (6.8) yields
  $ parallel cal(C) parallel \( B_R \( 0 \) \) = frac(H R^(m + 1), m + 1) \, #h(2em) Theta \( cal(C) \, 0 \) = H / sigma_m < theta.alt_m . $
  In particular $cal(C)$ is nonzero. This exact identity retains the infimum value; a lower-semicontinuity bound would not give the same conclusion by itself.
  Proposition 29(ii) now makes the link $Sigma_(*) = "spt" parallel cal(C) parallel ∩ S^(m + 1)$ a smooth closed connected embedded minimal hypersurface, with multiplicity one. Its area is exactly $H$. The bounds $sigma_m < H < a_m$ exclude an equator and put $Sigma_(*)$ in $cal(E)_m$, as required. ◻
]

== 7 Proof of the volume theorem <sec:conclusion>

#proof[
  We induct on $m gt.eq 2$. Fix $m$, assuming the theorem in dimensions $2 \, dots.h \, m - 1$; this hypothesis is empty when $m = 2$. By Proposition 3, every counterexample in dimension $m$ would be a smooth closed connected embedded minimal hypersurface.
  Suppose such counterexamples exist. Proposition 31 gives one of least area $H$, denoted by $Sigma$, with
  $ sigma_m < gamma_m lt.eq H < a_m . $
  Set $p = m + 3$. Proposition 10 gives $"ind" \( Sigma \) gt.eq p$. Equality would make $Sigma$ a minimal Clifford product and force $H gt.eq a_m$. Therefore $"ind" \( Sigma \) > p$.
  By Proposition 18, there is a detecting family without mass concentration whose supremum mass $D_1$ satisfies $D_1 < H$. Theorem 16 yields a stationary integral $m$-varifold $V$ on $S^(m + 1)$ with
  $ gamma_m lt.eq parallel V parallel \( S^(m + 1) \) < H < a_m . $
  When $m = 2 \, 3$, choose the smooth embedded min–max output provided by that theorem, with its integer component multiplicities. Its Euclidean cone is cyclic modulo two by Lemma 25. In every higher dimension the cone is stationary and integral, which are the required hypotheses.
  Corollary 30, using the outer induction hypothesis, now shows that $V$ is a smooth connected embedded minimal hypersurface of multiplicity one. Its mass exceeds $sigma_m$, so it is non-equatorial. It is therefore a counterexample with area strictly smaller than $H$, a contradiction.
  This proves the embedded assertion in dimension $m$, and Proposition 3 gives the full immersion assertion. The induction proves the theorem for every $m gt.eq 2$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
