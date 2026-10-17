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

#align(center)[#text(size: 16pt, weight: "bold")[Bi-Lipschitz Coordinates at Regular Points \
of Noncollapsed $upright(R C D)$ Spaces]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <introduction>

Euclidean tangent spaces describe the geometry of a metric space at a point, but a coordinate chart must compare all pairs of points in a neighborhood. Under a lower Ricci curvature bound these are distinct regularity questions.

Throughout, noncollapsed means that the reference measure is exactly $cal(H)_d^n$. We use the full $upright("CD") \( K \, n \)$ condition together with quadratic Cheeger energy. Spaces are complete, separable, geodesic, and have full-support reference measure finite on bounded sets. A point is #emph[$n$-regular] if every pointed Gromov–Hausdorff tangent there is pointed-isometric to $\( bb(R)^n \, \| dot.op \| \, 0 \)$. Here a tangent is a pointed limit of rescalings by inverse radii tending to infinity. We prove the following open-neighborhood result.

#thm([Theorem 1.1.])[
  #emph[For every integer $n gt.eq 2$ there is a constant $L_n gt.eq 1$ with the following property. Let $K in bb(R)$, and let $\( X \, d \, cal(H)_d^n \)$ be a noncollapsed $upright("RCD") \( K \, n \)$ space. Let $p in X$. If every pointed Gromov–Hausdorff tangent of $X$ at $p$ is pointed-isometric to $\( bb(R)^n \, \| dot.op \| \, 0 \)$, then there exist an open neighborhood $U$ of $p$, an open set $V subset bb(R)^n$, and a homeomorphism $F : U arrow.r V$ such that 
$ L_n^(- 1) d \( x \, z \) lt.eq \| F \( x \) - F \( z \) \| lt.eq L_n d \( x \, z \) #h(2em) \( x \, z in U \) . $

 The distance on the left and right is the original distance $d$ restricted to $U$.]
] <thm:main>

The neighborhood may depend on $X$ and $p$; the distortion constant depends only on the dimension. The theorem concerns every prescribed regular point, not only almost every point of the reference measure. It also yields the following manifold region.

#thm([Corollary 1.2.])[
  #emph[Under the hypotheses of Theorem 1, there is an open set $cal(U) subset X$ containing every $n$-regular point, with $cal(H)_d^n \( X \\ cal(U) \) = 0$, and a countable atlas of $L_n$-bi-Lipschitz charts from ambient-open subsets of $cal(U)$ onto open subsets of $bb(R)^n$. Each chart uses the restricted ambient distance, and its transition maps are $L_n^2$-bi-Lipschitz.]
] <cor:full-measure-atlas>

#proof[
  The $n$-regular set has full $cal(H)_d^n$ measure by #cite(label("DPG18")) Theorem 1.12(ii),(vi), applied with reference measure $cal(H)_d^n$. Take $cal(U)$ to be the union of the chart domains in Theorem 1. As a separable metric space, $cal(U)$ is second countable, so these domains admit a countable subcover. On an overlap, composing one chart with the inverse of the other gives the stated transition bound. ◻
]

The open region $cal(U)$ may contain points outside the exact regular locus; the corollary does not assert that this locus is open.

=== 1.1 History and significance <history-and-significance>

The structure theory of noncollapsed limits of Riemannian manifolds with lower Ricci bounds provides an early form of this question. Cheeger and Colding obtained manifold neighborhoods with bi-Hölder parametrizations and asked about a bi-Lipschitz upgrade #cite(label("CC97")) Theorem 5.14 and Remark 5.15. Their question concerns quantitatively regular Ricci-limit neighborhoods and is a historical antecedent of the synthetic regular-point problem considered here.

Synthetic lower Ricci bounds were developed through optimal transport by Lott and Villani and by Sturm #cite(label("LV09")) #cite(label("Sturm06II")). The Riemannian refinement of Ambrosio, Gigli and Savaré distinguishes quadratic Cheeger energy and linear heat flow #cite(label("AGS14")); the finite-dimensional connections with Bochner inequalities were developed by Erbar, Kuwada and Sturm #cite(label("EKS15")). In the noncollapsed setting, De Philippis and Gigli established volume convergence, volume rigidity, and quantitative Euclidean approximation #cite(label("DPG18")).

Mondino and Naber proved countable bi-Lipschitz rectifiability of RCD spaces: measurable pieces cover almost every point and map to measurable Euclidean subsets #cite(label("MN19")) Theorem 1.1. This does not give an ambient-open neighborhood of each prescribed regular point. Kapovitch and Mondino proved that the entire regular set is contained in an open manifold region with bi-Hölder charts #cite(label("KM21")) Theorem 3.1 and Corollary 3.2. This statement does not require the exact regular locus itself to be open. An open bi-Lipschitz chart requires stronger control across infinitely many scales.

The conjecture that every regular point in the noncollapsed setting admits a bi-Lipschitz chart is explicitly recalled in the recent work of Honda and Zhang #cite(label("HZ26")) Section 1.2. Theorem 1 answers this question under the precise noncollapsed $upright("RCD") \( K \, n \)$ hypotheses stated above. Honda and Zhang’s geometric regularity theorems assume a positive lower bound for injectivity radius on neighborhoods #cite(label("HZ26")) Theorems 1.1 and 3.35. Their analytic criterion also permits Morrey $L^2$ control of the Laplacians, together with a neighborhood-uniform positive Gram determinant #cite(label("HZ26")) Theorem 3.9 and Proposition 3.10. Neither additional hypothesis is assumed here.

Several nearby results clarify the strength of the conclusion. Colding and Naber proved that bounded subsets of quantitative Reifenberg loci in noncollapsed Ricci limits, with sufficiently small flatness and scale parameters, admit bi-Lipschitz embeddings into a Euclidean space of possibly higher dimension #cite(label("CN13")) Theorem 1.1. They also constructed examples with Euclidean tangents that admit no coordinates inducing a Hölder continuous metric tensor #cite(label("CN13")) Theorem 1.2. The conclusion here is an open chart into $bb(R)^n$; it does not assert Hölder continuity of the metric tensor in that chart. Likewise, the restrictions on bi-Lipschitz regular maps in #cite(label("HP23")) Proposition 5.1 concern maps whose pullbacks of smooth target test functions have locally bounded Laplacians #cite(label("HP23")) Definition 3.1. No such analytic regularity is asserted for the limiting coordinates constructed below; in particular, their components are not asserted to have bounded Laplacian.

=== 1.2 The two main estimates <the-two-main-estimates>

After rescaling at $p$, volume comparison makes all sufficiently small balls at nearby centers quantitatively Euclidean. Harmonic functions approximating Euclidean coordinates then give an open coordinate map $u = \( u_1 \, dots.h \, u_n \)^T$. The scale-dependent mean Gram matrices of $u$ are invertible, but they need not be uniformly nondegenerate as the scale tends to zero. We compensate for this degeneration in the #emph[space of coordinate values].

Two kinds of control make this possible. Accumulated Bochner mass records how much the coordinates must be stretched to compensate for their degeneration; this accumulation may be unbounded. A separate estimate evaluates the same mass forms on actual coordinate differences $u \( x \) - u \( z \)$ and controls them by defects whose sum is small. The construction uses the cumulative mass to prescribe the stretching and the directional estimate to keep its metric error summable.

Write $r_i = 2^(- i)$, and let $G = \( chevron.l nabla u_j \, nabla u_k chevron.r \)_(j \, k = 1)^n$ be the Gram matrix field. Its mean on $B_(r_i) \( y \)$ is denoted by $R_i \( y \)$. Let $frak(m)$ denote Hausdorff measure in the current length units. If the rescaled curvature lower bound is $- kappa$, the matrix-valued Bochner measure is $M = 1 / 2 Delta G + kappa G frak(m)$, with the Laplacian understood entrywise. For a fixed enlargement $L > 1$, define the positive semidefinite matrix

$ D_(i \, y) = R_i \( y \)^(- 1) #scale(x: 120%, y: 120%)[\[] r_i^(2 - n) M \( B_(L r_i) \( y \) \) #scale(x: 120%, y: 120%)[\]] R_i \( y \)^(- 1) \, #h(2em) D \[ xi \] = xi^T D xi . $

Corrected heat averages of $G$ yield positive definite forms $H_i \( x \)$, increasing with $i$, on the space of coordinate values. Lemma 14 compares these forms with accumulated bounded-overlap sums of the local matrices $D_(i \, y)$, including a reverse comparison for suitable weighted sums. This is the cumulative input to the construction.

The first main estimate gives directional control of the same local matrices. For each fixed $L \, C_(upright("sep")) > 1$, there are nonnegative defect functions $E_i$ on the working region such that, whenever $x \, z \, y in B_4 \( p \)$ and $d \( x \, y \) \, d \( z \, y \) lt.eq C_(upright("sep")) r_i$,

$ D_(i \, y) \[ u \( x \) - u \( z \) \] lt.eq C r_i^2 #scale(x: 120%, y: 120%)[\(] E_i \( x \) + E_i \( z \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) sup_(x in B_4 \( p \)) sum_(i gt.eq 0) E_i \( x \) arrow.r 0 $

as the initial rescaling becomes flat (Proposition 24). The proof uses Poisson replacements of squared distance, affine approximation of radial derivatives, and a sharp projection estimate for the difference of two replacements. A radial transport argument preserves the #emph[squared] defect in this last estimate. Poisson replacement, harmonic transformation, heat Gram normalization, and sharp squared-Hessian pinching have substantive antecedents in the work of Cheeger and Colding and of Cheeger, Jiang and Naber #cite(label("CC96")) #cite(label("CJN21")). The two-center directional bound displayed above is proved here in the form needed for the value-space construction.

Scale-dependent transformations are also central in #cite(label("CN15")) Theorem 1.32 and #cite(label("HH24")) Theorems 1.7 and 4.1. Potentially unbounded, noncommuting normalization matrices already occur in these methods and in #cite(label("HZ26")) Theorem 3.8; those freedoms alone do not remove the Hölder loss. The issue here is how to use the directional estimate to control the cumulative metric error without assuming summability of its square root.

The second main ingredient is the analytic construction in Proposition 29. On the common open value domain $Omega = u \( B_1 \( p \) \)$, the construction produces smooth maps $h_i : Omega arrow.r bb(R)^n$ whose ordinary Jacobians $D h_i$ remain invertible. From the forms $D_(i \, y)$ and smooth cutoffs we build covector fields $v_i$ and, for $P in Omega$, iterate

$ h_0 \( P \) = P \, #h(2em) h_(i + 1) \( P \) = h_i \( P \) + D h_i \( P \)^(- T) v_i \( P \) . $

The leading change in the pullback metric is a positive sum of the forms $D_(i \, y)$. When the inverse transpose is differentiated, its linear contribution to a squared length contains $D^2 h_i \( xi \, xi \)$. A recurrence for these diagonal derivatives allows the errors to be summed using $sum_i E_i$, even when $sum_i sqrt(E_i)$ diverges. A separate estimate for all derivatives, with Gevrey growth in their order, closes the iteration despite the loss of one derivative in each update.

This part of the argument uses only positive matrix comparisons, directional smallness, and smooth cutoffs; it does not differentiate the scale metrics $H_i \( x \)$ or assume they remain bounded. It isolates an analytic way to turn summable directional information into coordinates, separate from the geometric origin of that information. The limit $F = lim_i h_i compose u$ has the asserted metric bounds. The openness of its image follows from the open coordinates $u$ and invariance of domain.

Summability also governs bi-Lipschitz Reifenberg parametrizations. For extrinsic sets, David and Toro control coherent changes of approximating planes by square-summable errors #cite(label("DT12")) Proposition 8.34. For metric spaces, Gigli and Violo obtain bi-Lipschitz parametrizations under summability of ordinary dyadic Gromov–Hausdorff errors #cite(label("GV25")) Theorems 2.2 and 2.7. Regularity at a point does not itself supply that summability. Here the summable quantity is instead the directional Bochner defect, and its conversion into metric control is proved by the explicit iteration above.

Section 2 constructs the open harmonic domain and its scale normalizations. Section 3 proves the cumulative matrix comparison, and Section 4 proves the summable directional estimate. Section 5 uses these two inputs to construct the renormalization and prove the all-pairs metric bounds and openness of the limiting chart.

=== 1.3 Conventions <conventions>

All balls use the ambient metric. Every enlargement appearing in a local estimate is fixed before a sufficiently late rescaling is chosen. We write $C$ for constants depending on the dimension and on specified fixed enlargement factors. Uniform quantities tending to zero along the rescalings will be denoted by $o \( 1 \)$; this notation includes uniformity over the centers and all dyadic scales under consideration. A subscript, as in $o_A \( 1 \)$, permits dependence on constants fixed earlier.

For a positive definite matrix $A$, set

$ A \[ xi \] = xi^T A xi \, #h(2em) \| xi \|_A = A \[ xi \]^(1 \/ 2) . $

Matrix inequalities are inequalities of quadratic forms. Vectors and covectors are represented using the fixed Euclidean pairing, and their length norms are specified explicitly. The norm $parallel T parallel_(H arrow.r Q)$ of a multilinear map uses $\| dot.op \|_H$ on each argument and $\| dot.op \|_Q$ on its value. Derivatives of maps on coordinate value space are ordinary Euclidean derivatives. We use $integral -_B$ for the integral divided by the measure of $B$.

== 2 Uniform harmonic coordinates <co:section>

We first obtain an open coordinate domain. The estimates in this section allow the derivatives of these coordinates to degenerate as the scale decreases. Their degeneration will be measured by positive matrices in the next section.

=== 2.1 Local calculus and rescaling <local-calculus-and-rescaling>

For locally Sobolev functions write $Gamma \( f \, g \) = chevron.l nabla f \, nabla g chevron.r$ and $Gamma \( f \) = Gamma \( f \, f \)$. Laplacians of gradient squares will be understood as measures. Products with such measures always use the continuous representative of a Lipschitz function, or the capacity representative of a Sobolev function when that is the appropriate meaning of the pairing.

We write $g$ for the canonical metric tensor.

#thm([Lemma 2.1.])[
  (Local analytic facts).  #emph[Let $\( Y \, d \, frak(m) \)$ be a noncollapsed $upright("RCD") \( - kappa \, n \)$ space and let $Omega subset Y$ be open. A locally bounded solution of $Delta w = a$ in $Omega$, with $a$ constant, is locally Lipschitz and is a local test function. In particular it has a local $L^2$ Hessian, $Gamma \( w_1 \, w_2 \) in W_(upright("loc"))^(1 \, 2) \( Omega \)$ for two such functions, and the Hessian product rule holds locally. The measure 
#[#set math.equation(numbering: n => "(2.1)")
 $ M \( w \) = 1 / 2 Delta Gamma \( w \) + kappa Gamma \( w \) frak(m) $ <co:M-definition>]

 is locally finite and nonnegative. For every constant $b$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ M \( w \) - \( 2 b Delta w - n b^2 \) frak(m) gt.eq \| "Hess" w - b g \|^2 frak(m) . $ <co:shifted-bochner>]

 On the real vector space of local constant-Laplacian functions, the left side is a nonnegative quadratic form in the pair $\( w \, b \)$, with both entries scaled together. All these statements hold on interior balls for weak solutions with locally bounded $L^2$ norm, after using the interior estimates to obtain local boundedness.]
  #emph[On fixed interior scales, bounded Lipschitz cutoffs with bounded Laplacian are available. Under uniform local volume comparison and a uniform rescaled curvature bound, their bounds, local Poincare and Sobolev constants, and interior harmonic and Poisson estimates are uniform. In particular, on a fixed-radius ball in the rescaled spaces below there is a number $d_(*) > 1$ and a constant $C$ such that 
#[#set math.equation(numbering: n => "(2.3)")
 $ parallel h parallel_(L^2) + parallel h parallel_(L^(2 d_(*))) lt.eq C parallel nabla h parallel_(L^2) \, #h(2em) h in W_0^(1 \, 2) \( B \) \, $ <co:dirichlet-sobolev>]

 whenever the ball and a fixed larger ball are contained in the working region.]
] <co:local-calculus>

#proof[
  The full curvature-dimension condition implies the reduced condition used in some of the references, by #cite(label("BS10")) Proposition 2.5(i). The interior Poisson regularity and gradient estimates apply to a constant right hand side; see #cite(label("Kell13")) #cite(label("Jiang14")). More precisely, if $8 B_R \( z \)$ is compactly contained in the domain, the quantitative estimate in #cite(label("Jiang14")) Theorem 3.1 has the form
  $ parallel nabla w parallel_(L^oo \( B_R \( z \) \)) lt.eq C #scale(x: 120%, y: 120%)[\(] R^(- 1) + sqrt(c_kappa \( R^2 \)) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] parallel w parallel_(L^oo \( B_(8 R) \( z \) \)) + R^2 parallel Delta w parallel_(L^oo \( B_(8 R) \( z \) \)) #scale(x: 120%, y: 120%)[\)] . $
  Here $c_kappa$ is the heat-semigroup variance constant in that estimate; the RCD curvature bound controls it, and the doubling and Poincare constants in $C$ are uniform on the rescaled balls in use. With bounded rescaled curvature this gives the usual $R^(- 1) parallel w parallel_oo + R \| a \|$ bound. The interior local-boundedness estimate first supplies the $L^oo$ norm from an $L^2$ bound. Our later uses always leave the required eightfold interior room. The local test class has the characterization
  $ "Test"_(upright("loc")) \( Y \) = { f in D_(upright("loc")) \( Delta \) ∩ L_(upright("loc"))^oo : \| nabla f \| in L_(upright("loc"))^oo \, med Delta f in W_(upright("loc"))^(1 \, 2) } \, $
  with the analogous definition on $Omega$; see #cite(label("CDNZPSW")) Lemmas 2.6–2.7. Thus constant-Laplacian solutions satisfy the stated local test condition. Equivalently, one may first multiply by a cutoff to obtain Laplacian-domain and Hessian regularity, and then use a test cutoff on a smaller ball to obtain the local product calculus. The relevant Hessian and product rules are those of #cite(label("Gigli18")).
  The noncollapsed hypothesis implies that the tangent module has dimension $n$ almost everywhere, and that $"tr" "Hess" w = Delta w$ there. The dimensional Bochner inequality therefore implies $M \( w \) gt.eq \| "Hess" w \|^2 frak(m)$; see #cite(label("DPG18")) #cite(label("Han18")). Expanding the square
  $ \| "Hess" w - b g \|^2 = \| "Hess" w \|^2 - 2 b Delta w + n b^2 $
  proves (2.2). Local finiteness and the measure formulation follow from the same local test calculus. Polarization of a nonnegative quadratic form gives the last assertion about $\( w \, b \)$.
  The cutoff, Poincare, and Sobolev statements are local RCD estimates. For the heat-regularized cutoff construction, see #cite(label("MN19")) Lemma 3.1 and #cite(label("CDNZPSW")) Lemma 2.6. To obtain the zero-boundary coercivity in (2.3), extend $h$ by zero to a fixed larger ball. Poincare on that ball and the positive lower bound for the measure of its annulus give the $L^2$ estimate. The local Sobolev inequality followed by this estimate gives the other term. One may use an effective doubling dimension larger than both $n$ and $2$, so that $d_(*) > 1$ also when $n = 2$; see #cite(label("HK00")) Theorem 5.1 and the following Remark 3. The annulus lower bound and all constants are uniform for the almost Euclidean balls used below. ◻
]

For a column $u = \( u_1 \, dots.h \, u_n \)^T$ of harmonic functions, define

#[#set math.equation(numbering: n => "(2.4)")
 $ G = \( Gamma \( u_j \, u_k \) \)_(j \, k = 1)^n \, #h(2em) M = \( M \( u_j \, u_k \) \)_(j \, k = 1)^n \, $ <co:G-M-matrix>]

where $M \( dot.op \, dot.op \)$ denotes polarization of (2.1). Thus $M \[ b \] = M \( b dot.op u \)$ is a positive measure for every $b in bb(R)^n$. If $E$ is Borel, positivity implies

#[#set math.equation(numbering: n => "(2.5)")
 $ \| M \( v \, w \) \| \( E \) lt.eq sqrt(M \[ v \] \( E \) M \[ w \] \( E \)) . $ <co:matrix-measure-cs>]

Here $\| M \( v \, w \) \|$ is total variation. To see this, take the trace measure as a dominating measure and apply matrix Cauchy–Schwarz to the positive semidefinite matrix density. The same argument applies to integrals with a nonnegative weight.

We record precisely the rescaling regime used throughout the proof. $omega_n$ denotes the measure of the unit ball in $bb(R)^n$.

#thm([Lemma 2.2.])[
  (An expanding almost Euclidean regime).  #emph[Fix an $n$-regular point $p$ in the space of Theorem 1. There are rescalings 
$ \( X_nu \, d_nu \, frak(m)_nu \, p_nu \) = \( X \, s_nu^(- 1) d \, s_nu^(- n) cal(H)_d^n \, p \) \, #h(2em) s_nu arrow.b 0 \, $

 numbers $kappa_nu arrow.b 0$, and radii $T_nu arrow.t oo$ with $kappa_nu T_nu^2 arrow.r 0$, having the following properties. The space $X_nu$ is $upright("RCD") \( - kappa_nu \, n \)$. For a sequence $delta_nu arrow.b 0$, all balls with center in $B_(64 T_nu) \( p_nu \)$ and radius at most $64 T_nu$ satisfy 
#[#set math.equation(numbering: n => "(2.6)")
 $ lr(|frac(frak(m)_nu \( B_r \( y \) \), omega_n r^n) - 1|) lt.eq delta_nu \, #h(2em) d_(G H) #scale(x: 120%, y: 120%)[\(] overline(B)_r \( y \) \, overline(B)_r \( 0^n \) #scale(x: 120%, y: 120%)[\)] lt.eq delta_nu r . $ <co:uniform-flatness>]

 There are harmonic columns $u_nu$ on $B_(32 T_nu) \( p_nu \)$, converging on every fixed ball locally uniformly and strongly in $W^(1 \, 2)$ to Euclidean coordinates, and 
#[#set math.equation(numbering: n => "(2.7)")
 $ \| nabla u_nu \| lt.eq C_n quad upright("on ") B_(16 T_nu) \( p_nu \) . $ <co:original-gradient-bound>]

]
] <co:flat-setup>

#proof[
  Take rescalings tending to zero. Compactness and the regular-point hypothesis imply pointed convergence to $bb(R)^n$, after passage to a subsequence, and noncollapsed volume convergence identifies the limit measure with $cal(H)^n$; see #cite(label("DPG18")). The rescaled curvature lower bound can be taken with $kappa_nu = max { - K \, 0 } s_nu^2$, enlarged by an arbitrarily small positive number if necessary.
  Fix for the moment a large finite radius. At every bounded center, volumes of balls at a fixed positive radius converge to their Euclidean values. This convergence is uniform in the center: otherwise a subsequence of centers converges in the Euclidean limit and contradicts volume convergence at that limit center. For a noncollapsed RCD space the volume density is at most one at every point, not merely almost everywhere. Bishop–Gromov therefore traps every smaller model-normalized volume ratio between its almost maximal value at the fixed radius and one. The model-volume correction tends uniformly to zero because the rescaled curvature does. This proves the first assertion in (2.6), uniformly over all smaller radii. The almost-volume-rigidity theorem in #cite(label("DPG18")), applied on a fixed enlargement of the ball, proves the second assertion. Its interior-radius conclusion is why an enlargement is taken first. No openness of the set of exactly regular points is used.
  Interior harmonic approximation to Euclidean coordinate functions is available by #cite(label("AH18")) Corollary 4.12. For each fixed large radius construct the harmonic functions on a strictly larger ball. Interior energy convergence, local boundedness, and the interior gradient estimate give convergence to coordinates and a dimensional gradient bound on the smaller ball. The latter bound is independent of the fixed large radius: the coordinate functions have size $O \( r \)$ on a ball of radius $r$, and the interior gradient estimate includes the factor $r^(- 1)$.
  Finally use a diagonal subsequence, allowing the finite radii just chosen to increase sufficiently slowly. It can be chosen so that all the estimates hold up to the multiples of $T_nu$ displayed above, with $delta_nu arrow.r 0$ and $kappa_nu T_nu^2 arrow.r 0$. This gives (2.7) and the expanding domains of harmonicity simultaneously. ◻
]

From now on the sequence index is suppressed. Every assertion on a fixed ball, or with finitely many fixed enlargement factors, is understood to hold for all sufficiently large $nu$. A quantity denoted by $o \( 1 \)$ is uniform in the centers in that ball and in all the smaller scales. We set

#[#set math.equation(numbering: n => "(2.8)")
 $ r_i = 2^(- i) \, #h(2em) R_i \( y \) = integral -_(B_(r_i) \( y \)) G thin upright(d) frak(m) \, #h(2em) i = 0 \, 1 \, dots.h . $ <co:dyadic-R>]

=== 2.2 Transformation at every center and scale <transformation-at-every-center-and-scale>

Harmonic normalization across scales is a central tool in #cite(label("CN15")) Theorem 1.32, #cite(label("CJN21")) Section 7, and #cite(label("HH24")) Theorem 4.1. The noncollapsed RCD transformation framework of Bruè–Naber–Semola #cite(label("BNS20")) Section 3.3, Proposition 3.13 and Corollary 3.16 is a further methodological antecedent. We give the all-center statement and its proof needed on the expanding domains used here.

#thm([Lemma 2.3.])[
  (Uniform harmonic normalization).  #emph[For every pair of fixed constants $A \, C gt.eq 1$, the matrices $R_i \( y \)$ are positive definite for $y in B_A \( p \)$ and $i gt.eq 0$. In the rescaled ball $B_(C r_i) \( y \)$, the map 
#[#set math.equation(numbering: n => "(2.9)")
 $ U_(i \, y) = frac(R_i \( y \)^(- 1 \/ 2) \( u - u \( y \) \), r_i) $ <co:normalized-column>]

 is, after an orthogonal change of target coordinates, an $o \( 1 \)$ approximation to Euclidean coordinates, uniformly and strongly in interior $W^(1 \, 2)$. Its gradients are uniformly bounded on each fixed interior enlargement. Its Gram matrix converges strongly in every finite $L^p$ on such enlargements to $upright("Id")$.]
  #emph[For every fixed $C gt.eq 1$, if $d \( y \, z \) lt.eq C r_i$ and $C^(- 1) r_i lt.eq r_j lt.eq C r_i$, then 
#[#set math.equation(numbering: n => "(2.10)")
 $ \( 1 - o \( 1 \) \) R_i \( y \) lt.eq R_j \( z \) lt.eq \( 1 + o \( 1 \) \) R_i \( y \) . $ <co:nearby-R>]

 For every $a > 0$, after choosing a sufficiently late rescaling, 
#[#set math.equation(numbering: n => "(2.11)")
 $ C_a^(- 1) 2^(- 2 a \| i - j \|) R_j \( y \) lt.eq R_i \( y \) lt.eq C_a 2^(2 a \| i - j \|) R_j \( y \) . $ <co:slow-R>]

 The constants are uniform in the center and the two indices. In particular, since $R_0 \( y \) = upright("Id") + o \( 1 \)$ on fixed balls, 
#[#set math.equation(numbering: n => "(2.12)")
 $ c_a r_i^(2 a) upright("Id") lt.eq R_i \( y \) lt.eq C upright("Id") . $ <co:R-lower>]

]
] <co:harmonic-normalization>

#proof[
  We give the compactness induction, including the order of the smallness choices. Say that a harmonic column is $tau$-normalizable at $\( y \, r \)$ if there is an invertible matrix $T$ for which $T \( u - u \( y \) \) \/ r$, on $B_(2 r) \( y \)$ in units $r$, differs by at most $tau$ from a Euclidean coordinate map under a Gromov–Hausdorff approximation. Replacing the uniform error in this definition by an interior normalized $L^2$ error gives an equivalent induction, after changing its tolerance by a fixed factor; we use harmonic interior estimates on a slightly larger ball whenever needed. Rotations of the Euclidean coordinates are allowed.
  Choose a small fixed tolerance $tau$. In an exactly Euclidean ball, a harmonic column $V$ that is $tau$-close to the coordinate functions has
  $ parallel D V \( 0 \) - upright("Id") parallel lt.eq C_n tau \, #h(2em) sup_(B_(2 b)) \| D V \( 0 \)^(- 1) \( V - V \( 0 \) \) - x \| lt.eq C_n tau b^2 . $
  These follow by applying interior derivative estimates to $V - x$. Choose a dyadic number $b = 2^(- m)$ so small that $2 C_n b < 1 \/ 4$, and then choose $tau$ small enough that the inverse derivative is bounded. Thus affine renormalization improves the error in units $b$ by a strict factor.
  The same propagation holds on all sufficiently flat balls in our sequence. Indeed, if it failed, rescale a failing ball to unit size and apply its assumed normalization. The spaces converge to a Euclidean ball by (2.6). The normalized harmonic columns have uniform local $L^2$, energy, and gradient bounds and therefore converge locally uniformly and strongly in interior $W^(1 \, 2)$ to a Euclidean harmonic column. These are interior convergence statements from #cite(label("AH18")) Section 4; no convergence of a full boundary-value problem is required. The limit has the $tau$-normalizability property. Its inverse derivative supplies a fixed matrix on the sequence which gives error strictly less than $tau$ at radius $b$, a contradiction. This additional correction to the already normalized target, and its inverse, have norm at most $1 + C_n tau$, after allowing the orthogonal target changes in the definition.
  At each bounded center the initial normalizability is supplied by Lemma 4, uniformly in that center. Run the preceding step down each of the finitely many dyadic residue classes modulo $m$. This proves normalizability at every dyadic scale. The mean Gram matrix of a normalized column on its unit ball is $upright("Id") + O \( tau \)$, uniformly once the space is sufficiently flat: a contrary sequence again converges strongly in energy to a Euclidean harmonic column, whose derivative is $O \( tau \)$-close to $upright("Id")$ on that interior ball. Consequently these Gram matrices are nonsingular and replacing an inductively chosen $T$ by the canonical normalization $R_i \( y \)^(- 1 \/ 2)$ changes the normalized map only by an orthogonal map and an $O \( tau \)$ error.
  To see explicitly why fixed enlargements are permitted, fix their largest factor first. Start the preceding induction on a larger fixed radius, allowing finitely many negative dyadic indices. For any scale $r_i$, an ancestor radius contains the desired enlargement, and at most a fixed number of the contraction steps separate that ancestor from $r_i$. Their normalizing matrices and inverse matrices are uniformly comparable. Apply the interior estimates on the ancestor ball and identify the mean Gram normalization on the descendant ball by strong energy convergence. All factors and the number of steps are fixed before $tau$ and the geometric flatness are chosen. This proves normalizability and bounded normalized gradients on every fixed enlargement. As $tau$ is arbitrary, the errors tend uniformly to zero along the original sequence, including when the chosen center and scale depend on the sequence index.
  The same argument on an enlargement containing both balls in (2.10) proves that their Gram averages in the first normalization both tend to $upright("Id")$. This gives (2.10). Iterating its same-center adjacent-scale case, with error chosen so that each factor is at most $2^(2 a)$, gives (2.11). The upper bound in (2.12) also follows directly from (2.7).
  For completeness, the strong convergence of the Gram functions can be seen without assuming convergence of pointwise gradient representatives. A Bochner cutoff estimate first bounds the local normalized Hessian energy. The Hessian product rule and bounded normalized gradients then bound the Gram functions in local $W^(1 \, 2)$. Sobolev compactness and the convergence of integrals of gradient scalar products identify their limit with $upright("Id")$; see #cite(label("AH18")) Corollary 4.3 and Theorem 4.6. Their uniform boundedness upgrades the resulting strong $L^2$ convergence to every finite $L^p$. ◻
]

#thm([Lemma 2.4.])[
  (Small normalized Bochner mass).  #emph[For each pair of fixed constants $A \, C gt.eq 1$, uniformly for $y in B_A \( p \)$ and $i gt.eq 0$, 
#[#set math.equation(numbering: n => "(2.13)")
 $ r_i^(2 - n) M \( B_(C r_i) \( y \) \) lt.eq o \( 1 \) R_i \( y \) . $ <co:small-mass>]

]
] <co:bochner-small>

#proof[
  In units $r_i$, apply Lemma 3 to a scalar combination of $U = U_(i \, y)$. The rescaled Bochner matrix is
  #[#set math.equation(numbering: n => "(2.14)")
   $ M_(r_i) \( U \) = r_i^(2 - n) R_i \( y \)^(- 1 \/ 2) M \( u \) R_i \( y \)^(- 1 \/ 2) \, $ <co:M-scaling>]
  where the curvature term in its definition is $kappa r_i^2$. Choose a nonnegative cutoff equal to one on $B_C$ and supported on a larger fixed ball. Its gradient and Laplacian are uniformly bounded. For a fixed vector $b$,
  $ integral phi.alt thin upright(d) M_(r_i) \( b dot.op U \) = 1 / 2 integral #scale(x: 120%, y: 120%)[\(] Gamma \( b dot.op U \) - \| b \|^2 #scale(x: 120%, y: 120%)[\)] Delta phi.alt thin upright(d) frak(m)_(r_i) + kappa r_i^2 integral phi.alt Gamma \( b dot.op U \) thin upright(d) frak(m)_(r_i) . $
  Here $integral Delta phi.alt thin upright(d) frak(m)_(r_i) = 0$. Both terms tend uniformly to zero by Lemma 5. Positivity of the Bochner measure bounds its mass on $B_C$. Polarization in the fixed finite dimension, or the same argument for unit vectors, gives the matrix bound. Conjugating back proves (2.13). ◻
]

=== 2.3 Open coordinate images <open-coordinate-images>

#thm([Lemma 2.5.])[
  (Open harmonic coordinates).  #emph[For every fixed $A gt.eq 1$, the map $u$ is a homeomorphism from $B_A \( p \)$ onto an open subset of $bb(R)^n$, once the rescaling is sufficiently late. There is a fixed $c > 0$ such that, whenever the balls involved stay in a fixed interior working region, 
#[#set math.equation(numbering: n => "(2.15)")
 $ { P : \| P - u \( x \) \|_(R_i \( x \)^(- 1)) < c r_i } subset u \( B_(r_i \/ 2) \( x \) \) . $ <co:ellipsoid-containment>]

 Moreover, for every fixed $D gt.eq 1$, if $D^(- 1) r_i lt.eq d \( x \, z \) lt.eq D r_i$, then 
#[#set math.equation(numbering: n => "(2.16)")
 $ \| \| u \( z \) - u \( x \) \|_(R_i \( x \)^(- 1)) - d \( x \, z \) #scale(x: 120%, y: 120%)[\|] lt.eq o_D \( 1 \) r_i . $ <co:separation-scale>]

]
] <co:open-coordinates>

#proof[
  The approximation in Lemma 5 gives (2.16). Test a pair of distinct points at a dyadic scale comparable with its distance. Once the error is less than one half of that distance, the coordinate values are distinct. Distances larger than the initial unit scale in a fixed ball are separated directly by the initial uniform Euclidean approximation. Thus $u$ is injective on $B_A \( p \)$.
  We prove (2.15) with its interior margin. Fix a target $P$ in the indicated ellipsoid and put $x_0 = x$, $rho_0 = r_i$. Write $R \( rho \, y \)$ for the Gram average at a dyadic radius. Suppose inductively that
  $ \| P - u \( x_j \) \|_(R \( rho_j \, x_j \)^(- 1)) < c rho_j \, #h(2em) rho_j = 4^(- j) rho_0 . $
  Approximate surjectivity of the normalized Euclidean coordinate map provides $x_(j + 1)$ with
  $ d \( x_j \, x_(j + 1) \) lt.eq \( c + eta \) rho_j \, #h(2em) \| P - u \( x_(j + 1) \) \|_(R \( rho_j \, x_j \)^(- 1)) lt.eq eta rho_j . $
  Here $eta arrow.r 0$ is uniform in the scale. For example, choose a point under the Gromov–Hausdorff correspondence whose Euclidean coordinate is the normalized target. Its distance from the center and the error in its coordinate value have the displayed bounds. By (2.10), the second bound is at most $2 eta rho_j$ when measured in $R \( rho_j \/ 4 \, x_(j + 1) \)^(- 1)$. Choose $c < 1 \/ 8$, and then choose $eta < c \/ 8$. It is at most $c rho_(j + 1)$, so the induction continues.
  The total displacement is at most $\( c + eta \) sum_j rho_j < rho_0 \/ 2$. All centers therefore stay in the region where the estimates are valid. Completeness gives a limit $x_oo in B_(rho_0 \/ 2) \( x \)$, with a strict margin because of the preceding choices. The upper bound $R \( rho \, y \) lt.eq C upright("Id")$ in the original coordinate units shows that the Euclidean residual $\| P - u \( x_j \) \|$ tends to zero. Continuity of $u$ now gives $u \( x_oo \) = P$.
  Apply the ellipsoid statement at each point with a sufficiently small radius contained in $B_A \( p \)$. Its image is open. Finally, a continuous injection is a homeomorphism locally on each compact interior ball, since these spaces are proper. Alternatively the same separation-scale estimate gives continuity of the inverse. This proves the assertion on the whole open domain. ◻
]

== 3 Heat averages and cumulative matrix control <co:heat-section>

We next replace the ball Gram averages by matrices that are monotone as the spatial scale decreases. The local mass forms use inverse ball averages at nearby centers. Relative comparability of these averages with the heat averages does not by itself compare the twice-conjugated mass forms. We will bound the accumulated cost of changing the normalization by a small multiple of the final inverse heat matrix. Heat Gram normalization and quadratic telescoping are used in #cite(label("CJN21")) Sections 8.1–8.2. The estimates below give the cumulative comparison for the inverse matrices without a commutativity assumption.

=== 3.1 Continuous kernels and compactly supported sources <continuous-kernels-and-compactly-supported-sources>

Let $p_t \( x \, z \)$ be the common continuous heat kernel and $P_t$ the heat semigroup. We use the Gaussian and first spatial gradient estimates of #cite(label("JLZ16")) Theorem 1.2 and Corollary 1.2. On the fixed testing regions, for $0 < t lt.eq 1$, volume comparison allows their form

#[#set math.equation(numbering: n => "(3.1)")
 $ p_t \( x \, z \) lt.eq C t^(- n \/ 2) e^(- d \( x \, z \)^2 \/ \( C t \)) \, #h(2em) \| nabla_x p_t \( x \, z \) \| lt.eq C t^(- \( n + 1 \) \/ 2) e^(- d \( x \, z \)^2 \/ \( C t \)) . $ <co:kernel-bounds>]

The gradient statement initially holds almost everywhere. The lower bound, used when $d \( x \, z \) lt.eq A sqrt(t)$, is

#[#set math.equation(numbering: n => "(3.2)")
 $ p_t \( x \, z \) gt.eq c_A t^(- n \/ 2) . $ <co:kernel-lower>]

We may use one fixed weaker negative curvature bound in these estimates. The constants are then uniform in the sequence.

The following interpretation will be useful because $M$ can have a singular part.

#thm([Lemma 3.1.])[
  (Kernel differences and measure sources).  #emph[Fix $C_0 gt.eq 1$, $x \, y$ in a fixed testing region, and $d \( x \, y \) lt.eq C_0 r$, where $0 < r lt.eq 1$. Put 
$ K_t \( z \) = integral -_(B_r \( y \)) p_t \( a \, z \) thin upright(d) frak(m) \( a \) \, #h(2em) D = d \( x \, z \) . $

 After enlarging fixed constants, the following bounds hold at every source pole $z$: 
#[#set math.equation(numbering: n => "(3.3)")
 $ K_t \( z \) & lt.eq C r^(- n) e^(- c D^2 \/ r^2) \, &  & 0 < t lt.eq r^2 \,\
\| K_t \( z \) - p_t \( x \, z \) \| & lt.eq C r t^(- \( n + 1 \) \/ 2) e^(- c D^2 \/ t) \, &  & r^2 lt.eq t lt.eq 1 . $ <co:short-kernel>]

 If $f in W^(1 \, 2) ∩ L^oo$ has compact support and its Laplacian is a finite signed measure $mu$ of compact support, then 
#[#set math.equation(numbering: n => "(3.4)")
 $ P_t f - P_s f = integral_s^t P_tau mu thin upright(d) tau \, #h(2em) 0 < s < t \, $ <co:semigroup-measure>]

 using the continuous representatives. In the application $f = chi Gamma \( u_j \, u_k \)$, this identity can also be averaged over a ball and passed to $s arrow.b 0$.]
] <co:kernel-measures>

#proof[
  When $D lt.eq 2 \( C_0 + 2 \) r$, symmetry and total heat mass bound the integral of $p_t \( a \, z \)$ over the ball by one. Dividing by its volume gives $C r^(- n)$, which is the first bound with adjusted constants. If $D > 2 \( C_0 + 2 \) r$, then $d \( a \, z \) gt.eq D \/ 2$ for all $a in B_r \( y \)$. The Gaussian upper bound gives $C t^(- n \/ 2) e^(- c D^2 \/ t)$. For $t lt.eq r^2$ and $D \/ r$ bounded below by this fixed constant, its small-time power is absorbed in the exponential, giving (3.3).
  For the second bound, $d \( a \, x \) lt.eq \( C_0 + 1 \) r$. Integrate the first spatial gradient estimate along a minimizing curve from $x$ to $a$; that curve stays in a fixed testing enlargement. The inequality $d \( b \, z \)^2 gt.eq D^2 \/ 2 - d \( b \, x \)^2$, with $t gt.eq r^2$, absorbs the variation of the Gaussian along the curve. This gives (3.3), initially for almost every fixed source pole $z$. For each such pole, local Sobolev-to-Lipschitz gives the difference inequality for the continuous representative in the first variable. By symmetry, continuity of the common heat kernel, and full support, a sequence of these full-measure poles converges to any prescribed $z$. Passing to the limit, with relaxed Gaussian constants if necessary, proves the bounds at every pole. No gradient representative has been paired with a singular measure.
  For (3.4), first test the distributional Laplacian against positive-time heat regularizations of compactly supported test functions. Symmetry and integration by parts give the asserted identity in distributions. Equivalently, differentiate $P_tau f$ for positive $tau$, pair the Laplacian with the continuous Sobolev function $p_tau \( x \, dot.op \)$, and integrate. A cutoff equal to one on the compact supports justifies this pairing; the kernel belongs locally to $W^(1 \, 2)$ at positive time. The measure and its Sobolev-dual realization agree on this continuous representative. The kernel bounds give continuity of both sides in $x$, so the identity holds pointwise.
  In our application the short-time averaged integral of the total variation of the source is finite: (3.3), integrated up to $r^2$, bounds it by a finite Gaussian-weighted multiple of $r^(2 - n) \| mu \|$. Also $P_s f arrow.r f$ in $L^1$ on the averaging ball. Thus the averaged identity passes to $s = 0$ by absolute convergence. These statements also follow by first using positive lower time endpoints throughout and then applying the bounds just proved. ◻
]

Choose a nonnegative cutoff $chi$ equal to one on $B_T \( p \)$, supported in $B_(2 T) \( p \)$, with

$ \| nabla chi \| lt.eq C \/ T \, #h(2em) \| Delta chi \| lt.eq C \/ T^2 \, $

where $T = T_nu$ comes from Lemma 4. Extend $chi G$ by zero outside its support. Its distributional Laplacian is the compactly supported matrix measure

#[#set math.equation(numbering: n => "(3.5)")
 $ Delta \( chi G \) = 2 chi M - 2 kappa chi G frak(m) + E_(upright("cut")) frak(m) \, #h(2em) E_(upright("cut")) = \( Delta chi \) G + 2 Gamma \( chi \, G \) . $ <co:cutoff-source>]

The last expression is a matrix of $L^1$ functions supported in the cutoff annulus.

#thm([Lemma 3.2.])[
  (Monotone heat Gram matrices).  #emph[There is $lambda = lambda_nu > 0$, with $lambda_nu arrow.r 0$, such that, at all fixed testing centers and $0 < t lt.eq 1$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ P_t \( chi M \) lt.eq partial_t #scale(x: 120%, y: 120%)[\(] P_t \( chi G \) + lambda t upright("Id") #scale(x: 120%, y: 120%)[\)] lt.eq 3 P_t \( chi M \) + C upright("Id") . $ <co:heat-derivative>]

 Define 
#[#set math.equation(numbering: n => "(3.7)")
 $ Q_i \( x \) = P_(r_i^2) \( chi G \) \( x \) + lambda r_i^2 upright("Id") \, #h(2em) H_i \( x \) = Q_i \( x \)^(- 1) . $ <co:QH-definition>]

 Then 
#[#set math.equation(numbering: n => "(3.8)")
 $ & \( 1 - o \( 1 \) \) R_i \( x \) lt.eq Q_i \( x \) lt.eq \( 1 + o \( 1 \) \) R_i \( x \) \, #h(2em) Q_0 \( x \) = upright("Id") + o \( 1 \) \,\
 & H_i \( x \) lt.eq H_(i + 1) \( x \) lt.eq \( 1 + o \( 1 \) \) H_i \( x \) . $ <co:QR-comparison>]

 The nearby-center and slow-growth estimates of Lemma 5 hold for $Q_i$ as well. In particular, for every prescribed $a > 0$, with a sufficiently late rescaling, 
#[#set math.equation(numbering: n => "(3.9)")
 $ Q_j \( x \) lt.eq C_a 2^(2 a \( i - j \)) Q_i \( x \) quad \( j lt.eq i \) \, #h(2em) parallel H_i \( x \) parallel lt.eq C_a 2^(2 a i) . $ <co:slow-QH>]

]
] <co:heat-matrices>

#proof[
  The original gradient bound and a Bochner cutoff on a ball of radius $s gt.eq 1$ give, for centers in a fixed bounded set and up to the support region,
  #[#set math.equation(numbering: n => "(3.10)")
   $ M \( B_s \( x \) \) \[ v \] lt.eq C \( s^(n - 2) + kappa s^n \) \| v \|^2 lt.eq C s^(n - 2) \| v \|^2 . $ <co:raw-mass-growth>]
  For radii larger than the support radius the same bound holds with $chi M$ in place of $M$, by monotonicity and $n gt.eq 2$. The cutoff for this estimate lies inside the expanding domain where (2.7) holds. The same estimate for the Hessian, followed by Cauchy–Schwarz in the product rule, gives
  $ integral \| E_(upright("cut")) \| thin upright(d) frak(m) lt.eq C T^(n - 2) . $
  Since its support is a distance at least $T \/ 2$ from the fixed testing centers for large $nu$, (3.1) yields
  #[#set math.equation(numbering: n => "(3.11)")
   $ sup_(0 < t lt.eq 1) parallel P_t E_(upright("cut")) \( x \) parallel lt.eq C T^(n - 2) sup_(0 < t lt.eq 1) t^(- n \/ 2) e^(- c T^2 \/ t) = o \( 1 \) . $ <co:cutoff-small>]
  Choose $lambda$ at least this supremum plus $2 kappa parallel G parallel_oo$, and add a positive number tending to zero. Equations (3.4) and (3.5) give
  $ partial_t \( P_t \( chi G \) + lambda t upright("Id") \) = 2 P_t \( chi M \) - 2 kappa P_t \( chi G \) + P_t E_(upright("cut")) + lambda upright("Id") . $
  The last three terms have nonnegative sum and bounded norm. This proves (3.6), in fact with lower bound $2 P_t \( chi M \)$.
  We verify relative, rather than merely absolute, comparison with the ball averages. Fix $i \, x$ and conjugate by $R_i \( x \)^(- 1 \/ 2)$. On every fixed ball $B_(L r_i) \( x \)$, the conjugated Gram field converges in normalized $L^1$ to $upright("Id")$, by Lemma 5. The heat kernel at time $r_i^2$ is at most $C r_i^(- n)$, so the integral of its local error tends to zero. The tails are uniform in $i$: on the shell with radius $2^m r_i lt.eq 1$, slow growth bounds the conjugated Gram average by $C 2^(2 a m)$, while the Gaussian bounds its contribution by
  $ C 2^(\( n + 2 a \) m) e^(- c 4^m) . $
  When $2^m r_i > 1$, use the original gradient bound and (2.12); its conjugation cost $C r_i^(- 2 a)$ is at most $C 2^(2 a m)$. Volume comparison and the same Gaussian again give the displayed summable bound. This treats the entire support of $chi$. The missing mass from $1 - chi$ is bounded in the same way, using total heat mass one. First choose $L$ large enough to make the tail small and then choose the rescaling late enough to make the local error small. Beyond the expanding almost Euclidean region, the global volume bound adds at most $e^(C 2^m r_i)$ to a shell estimate; since $r_i lt.eq 1$, this factor is absorbed by decreasing the Gaussian constant in $e^(- c 4^m)$. Thus the assertion about the missing heat mass is uniform there as well. Finally,
  $ lambda r_i^2 R_i \( x \)^(- 1) lt.eq C_a lambda r_i^(2 - 2 a) upright("Id") = o \( 1 \) upright("Id") $
  for $a < 1$. This proves (3.8); its initial scale assertion follows from Euclidean convergence.
  The derivative positivity makes $Q_i gt.eq Q_(i + 1)$, hence $H_i lt.eq H_(i + 1)$. Relative comparison with $R_i$ and (2.10) give the adjacent-scale upper bound and all fixed nearby comparisons. Iteration gives (3.9), choosing the adjacent-scale tolerance after the prescribed exponent $a$. ◻
]

=== 3.2 The dyadic heat comparison <the-dyadic-heat-comparison>

The matrices

#[#set math.equation(numbering: n => "(3.12)")
 $ N_j \( x \) = r_j^(2 - n) M \( B_(r_j) \( x \) \) $ <co:N-definition>]

are masses in the original harmonic coordinate components. They have not been conjugated by a Gram inverse. In particular, Lemma 6 and (3.8) give

#[#set math.equation(numbering: n => "(3.13)")
 $ N_j \( x \) lt.eq epsilon_nu Q_j \( x \) \, #h(2em) epsilon_nu arrow.r 0 \, $ <co:N-small>]

uniformly in $j$ and in fixed testing regions. We allow $epsilon_nu$ to increase by fixed multiplicative constants in what follows.

#thm([Lemma 3.3.])[
  (Dyadic heat comparison).  #emph[Fix constants $A \, C_0 gt.eq 1$, where $C_0$ bounds $d \( x \, y \) \/ r_i$, and fix a bounded region for $x$. There is a fixed exponent $gamma > 0$, which may be taken to be $1 \/ 2$, with the following properties for all sufficiently late rescalings. Set 
#[#set math.equation(numbering: n => "(3.14)")
 $ cal(F)_i \( x \) = 2^(- gamma i) upright("Id") + sum_(j = 0)^i 2^(- gamma \( i - j \)) N_j \( x \) . $ <co:F-definition>]

 For the prescribed enlargement $A$, 
#[#set math.equation(numbering: n => "(3.15)")
 $ c_A r_i^(2 - n) M \( B_(A r_i) \( x \) \) lt.eq Q_i \( x \) - Q_(i + 1) \( x \) lt.eq C cal(F)_i \( x \) . $ <co:heat-decrement>]

 For $d \( x \, y \) lt.eq C_0 r_i$ and $v \, w in bb(R)^n$, 
#[#set math.equation(numbering: n => "(3.16)")
 $ \| v^T \( R_i \( y \) - Q_i \( x \) \) w \| lt.eq C \| v \|_(Q_i \( x \)) sqrt(cal(F)_i \( x \) \[ w \]) . $ <co:bilinear-heat-comparison>]

 All constants are independent of $i$ and of the expanding cutoff radius. They may depend on the stated fixed parameters.]
] <co:heat-comparison>

#proof[
  #emph[The semigroup identity.] Write $r = r_i$, suppress $x$ in $N_j \, Q_j$, and let $cal(A) f = integral -_(B_r \( y \)) f thin upright(d) frak(m)$. We first prove the more explicit estimate
  #[#set math.equation(numbering: n => "(3.17)")
   $ \| v^T \( R_i \( y \) - Q_i \( x \) \) w \| & lt.eq C r \| v \| \| w \|\
 & quad + C sum_(j = 0)^i 2^(- \( i - j \)) sqrt(N_j \[ v \] N_j \[ w \]) . $ <co:raw-bilinear-heat>]
  This also specifies all the spatial and time tails entering (3.16).
  Put $f = chi G$, $S = Delta f$, and use the kernel functions from Lemma 8. Since $chi = 1$ on the averaging ball, the exact semigroup identity is
  #[#set math.equation(numbering: n => "(3.18)")
   $ R_i \( y \) - Q_i \( x \) =  & cal(A) P_1 f - P_1 f \( x \) - lambda r^2 upright("Id")\
 & - integral_0^(r^2) cal(A) P_t S thin upright(d) t - integral_(r^2)^1 #scale(x: 120%, y: 120%)[\(] cal(A) P_t S - P_t S \( x \) #scale(x: 120%, y: 120%)[\)] thin upright(d) t . $ <co:average-heat-identity>]
  The averaged endpoint at zero is justified in Lemma 8; it does not require pointwise convergence of the Gram field.
  #emph[The local source.] Consider the contribution of $2 chi M$ on $B_1 \( x \)$. The integrated short-time kernel obeys
  #[#set math.equation(numbering: n => "(3.19)")
   $ integral_0^(r^2) K_t \( z \) thin upright(d) t lt.eq C r^(2 - n) e^(- c d \( x \, z \)^2 \/ r^2) . $ <co:integrated-short-kernel>]
  For $0 lt.eq q < i$, integration of (3.3) on the time block $I_q = \[ r_(q + 1)^2 \, r_q^2 \]$ gives
  #[#set math.equation(numbering: n => "(3.20)")
   $ integral_(I_q) \| K_t \( z \) - p_t \( x \, z \) \| thin upright(d) t lt.eq C r r_q^(1 - n) e^(- c d \( x \, z \)^2 \/ r_q^2) . $ <co:integrated-long-kernel>]
  To integrate a Gaussian at scale $r_q$ against $M \( v \, w \)$, partition $B_1 \( x \)$ into $B_(r_q) \( x \)$ and the annuli
  $ B_(r_j) \( x \) \\ B_(r_(j + 1)) \( x \) \, #h(2em) 0 lt.eq j < q . $
  Define positive numerical coefficients
  #[#set math.equation(numbering: n => "(3.21)")
   $ k_0 = 1 \, #h(2em) k_h = 2^(\( n - 2 \) h) e^(- c 4^(h - 1)) quad \( h gt.eq 1 \) . #h(2em) sum_(h = 0)^oo 2^h k_h < oo . $ <co:gaussian-shell-coefficients>]
  On the annulus indexed by $j < q$, the distance from $x$ is at least $2^(q - j - 1) r_q$. Equation (2.5) and the identity $M \( B_(r_j) \( x \) \) = r_j^(n - 2) N_j$ show that the contribution of the time block $I_q$ is at most
  $ C 2^(- \( i - q \)) sum_(j = 0)^q k_(q - j) sqrt(N_j \[ v \] N_j \[ w \]) . $
  Reversing the finite sums, the sum of all these contributions is at most
  $ & C sum_(j = 0)^(i - 1) 2^(- \( i - j \)) (sum_(h = 0)^(i - 1 - j) 2^h k_h) sqrt(N_j \[ v \] N_j \[ w \])\
 & #h(25mm)  lt.eq C sum_(j = 0)^(i - 1) 2^(- \( i - j \)) sqrt(N_j \[ v \] N_j \[ w \]) . $
  The short-time term uses the same partition with $q = i$ and (3.19). It is bounded by
  $ C sum_(j = 0)^i k_(i - j) sqrt(N_j \[ v \] N_j \[ w \]) lt.eq C sum_(j = 0)^i 2^(- \( i - j \)) sqrt(N_j \[ v \] N_j \[ w \]) . $
  This proves the required contribution on $B_1 \( x \)$, with the original unit-ball $N_j$ and no unmentioned enlarged mass.
  #emph[The remaining source terms.] We treat all remaining parts of (3.18). If $D = d \( x \, z \) gt.eq 1$, the integrated kernel bounds imply
  #[#set math.equation(numbering: n => "(3.22)")
   $ integral_0^(r^2) K_t \( z \) thin upright(d) t + integral_(r^2)^1 \| K_t \( z \) - p_t \( x \, z \) \| thin upright(d) t lt.eq C r e^(- c' D^2) . $ <co:exterior-integrated-kernel>]
  For the second term, split the Gaussian into two factors, use one to retain $e^(- c' D^2)$, and use the other to integrate $t^(- \( n + 1 \) \/ 2) e^(- c'' \/ t)$ on $\( 0 \, 1 \)$. For the first term, (3.19) reduces the assertion to absorbing $r^(1 - n)$ in $e^(- c'' \/ r^2)$. Both bounds are uniform for $0 < r lt.eq 1$.
  Equation (3.10), summed over the annuli $B_(2^(h + 1)) \( x \) \\ B_(2^h) \( x \)$, gives
  $ integral e^(- c' d \( x \, z \)^2) thin upright(d) \( chi M \[ v \] \) \( z \) lt.eq C \| v \|^2 . $
  Therefore (3.22) and polarized Cauchy–Schwarz bound the exterior positive-source contribution by $C r \| v \| \| w \|$. The total variation of the cutoff source is $O \( T^(n - 2) \)$, is supported a distance comparable with $T$ from $x$, and has the same Gaussian moment bound, in fact a bound tending to zero. Its contribution is also at most $C r \| v \| \| w \|$.
  The curvature source in (3.5) has bounded density, of norm at most $C kappa$. For its short-time part use heat mass one. For its long-time part, integration of (3.3) in the source variable gives $C r \/ sqrt(t)$. This last Gaussian integral follows from local volume comparison for nearby shells and the global exponential volume bound for remote shells. Consequently the curvature contribution is at most
  $ C kappa (r^2 + integral_(r^2)^1 r t^(- 1 \/ 2) thin upright(d) t) \| v \| \| w \| lt.eq C r \| v \| \| w \| . $
  The time-one heat regularization of the bounded matrix field $f$ has uniformly bounded spatial gradient in the testing region, by the integrated first kernel gradient estimate. Hence $\| v^T \( cal(A) P_1 f - P_1 f \( x \) \) w \| lt.eq C r \| v \| \| w \|$. Also $lambda r^2 \| v \| \| w \| lt.eq C r \| v \| \| w \|$. These facts prove (3.17).
  #emph[Normalization and decrements.] Choose any sufficiently small fixed growth exponent $a > 0$ in (3.9). By (3.13), for $j lt.eq i$,
  $ sqrt(N_j \[ v \]) lt.eq C 2^(a \( i - j \)) \| v \|_(Q_i) . $
  Weighted Cauchy–Schwarz now gives, for instance when $a < 1 \/ 8$,
  $ sum_(j = 0)^i 2^(- \( i - j \)) sqrt(N_j \[ v \] N_j \[ w \]) & lt.eq C \| v \|_(Q_i) sum_(j = 0)^i 2^(- \( 1 - a \) \( i - j \)) sqrt(N_j \[ w \])\
 & lt.eq C \| v \|_(Q_i) (sum_(j = 0)^i 2^(- \( i - j \) \/ 2) N_j \[ w \])^(1 \/ 2) . $
  Indeed the unused scalar series has terms $2^(- \( 2 \( 1 - a \) - 1 \/ 2 \) \( i - j \))$, whose sum is bounded. Since $Q_i gt.eq c_a r_i^(2 a) upright("Id")$, the raw term in (3.17) is at most
  $ C r_i^(1 - a) \| v \|_(Q_i) \| w \| lt.eq C \| v \|_(Q_i) #scale(x: 120%, y: 120%)[\(] 2^(- i \/ 2) \| w \|^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $
  This proves (3.16) with $gamma = 1 \/ 2$.
  It remains to prove the decrement estimates. Integrate (3.6) on $\[ r_i^2 \/ 4 \, r_i^2 \]$. On a fixed ball $B_(A r_i) \( x \)$, where $chi = 1$, the heat lower bound (3.2) gives the left inequality in (3.15). The upper bound is
  $ Q_i - Q_(i + 1) lt.eq C r_i^(2 - n) integral e^(- c d \( x \, z \)^2 \/ r_i^2) thin upright(d) \( chi M \) \( z \) + C r_i^2 upright("Id") . $
  On $B_1 \( x \)$, the shell computation with $q = i$ bounds the positive term by $C sum_(j = 0)^i k_(i - j) N_j$, which is at most $C sum_(j = 0)^i 2^(- \( i - j \) \/ 2) N_j$. Outside $B_1 \( x \)$, (3.10) and Gaussian decay give $C r_i^2 upright("Id")$, after absorbing every fixed power of $r_i^(- 1)$ in $e^(- c \/ r_i^2)$. Since $r_i^2 lt.eq 2^(- i \/ 2)$, this proves the upper bound with the same $gamma$. ◻
]

#prodef([Remark 3.4.])[
  (Fixed enlargements and indexing).  No enlarged mass was needed in the preceding bilinear estimate. When one is used elsewhere, it can be returned to the same notation without losing the decay. Indeed, for fixed $A gt.eq 1$ put $h = ceil.l log_2 A ceil.r$. For $j gt.eq h$,
  $ r_j^(2 - n) M \( B_(A r_j) \( x \) \) lt.eq 2^(h \( n - 2 \)) N_(j - h) \( x \) . $
  The finitely many $j < h$ are bounded by $C_A upright("Id")$ in the original coordinate components, by a fixed-scale cutoff estimate. Thus an exponentially weighted sum of these enlarged masses is bounded by a fixed multiple of $2^(- gamma i) upright("Id") + sum_(j lt.eq i) 2^(- gamma \( i - j \)) N_j$. A center shift bounded by $C_0 r_j$ only increases $A$ by $C_0$. In contrast, the mass matrices $D_(i \, y)$ below include two Gram inverses; their comparison requires the argument that follows.
] <co:enlargement-indexing>

=== 3.3 Accumulation without commuting matrices <accumulation-without-commuting-matrices>

We separate the finite-dimensional calculation from its geometric application. All inequalities in this subsection are inequalities of quadratic forms on the fixed space $bb(R)^n$.

#thm([Lemma 3.5.])[
  (Weighted inverse increments).  #emph[Fix a testing center $x$, and suppress it in the notation. Let $a > 0$ in (3.9) be chosen so that $4 a < gamma$. Set 
$ B_i = H_(i + 1) - H_i \, #h(2em) Delta_i = Q_i - Q_(i + 1) \, #h(2em) a_i = H_i xi $

 for a fixed $xi in bb(R)^n$. Then, uniformly for every integer $k gt.eq 0$, 
#[#set math.equation(numbering: n => "(3.23)")
 $ & H_i Delta_i H_i lt.eq B_i lt.eq \( 1 + C epsilon_nu \) H_i Delta_i H_i \,\
 & sum_(i < k) cal(F)_i \[ a_i \] lt.eq C H_k \[ xi \] \,\
 & C^(- 1) H_k lt.eq upright("Id") + sum_(i < k) H_i N_i H_i lt.eq C H_k . $ <co:inverse-increment-order>]

 For every fixed $A gt.eq 1$, the upper sum bound also holds with $r_i^(2 - n) M \( B_(A r_i) \( x \) \)$ in place of $N_i$.]
] <co:inverse-increments>

#proof[
  Let $E_i = Q_i^(- 1 \/ 2) Delta_i Q_i^(- 1 \/ 2)$. By (3.8), $0 lt.eq E_i lt.eq epsilon_nu upright("Id")$ after increasing the sequence $epsilon_nu arrow.r 0$. The exact inverse identity is
  $ B_i = Q_i^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\(] \( upright("Id") - E_i \)^(- 1) - upright("Id") #scale(x: 120%, y: 120%)[\)] Q_i^(- 1 \/ 2) . $
  The spectral inequality $E_i lt.eq \( upright("Id") - E_i \)^(- 1) - upright("Id") lt.eq \( 1 + C epsilon_nu \) E_i$ proves (3.23). This use of the functional calculus is for one conjugated positive matrix at a time; matrices from different scales need not commute.
  We spell out the convolution estimate. Since $0 lt.eq B_l lt.eq C epsilon_nu H_l$, conjugation by $Q_l^(1 \/ 2)$ gives $B_l Q_l B_l lt.eq C B_l$. Consequently, by (3.9),
  #[#set math.equation(numbering: n => "(3.24)")
   $ \| B_l xi \|_(Q_j)^2 lt.eq C 2^(2 a \( l - j \)) B_l \[ xi \] \, #h(2em) j lt.eq l . $ <co:B-vector-bound>]
  For $j < i$, set $m = i - j$. The identity $a_i - a_j = sum_(l = j)^(i - 1) B_l xi$ and Cauchy–Schwarz give
  $ \| a_i - a_j \|_(Q_j)^2 lt.eq C m 2^(2 a m) sum_(l = j)^(i - 1) B_l \[ xi \] . $
  Using $N_j lt.eq epsilon_nu Q_j$, it follows that
  #[#set math.equation(numbering: n => "(3.25)")
   $ & sum_(i < k) sum_(j lt.eq i) 2^(- gamma \( i - j \)) N_j \[ a_i \]\
 & #h(2em) lt.eq C sum_(j < k) N_j \[ a_j \] + C epsilon_nu sum_(i < k) sum_(j < i) \( i - j \) 2^(- \( gamma - 2 a \) \( i - j \)) sum_(l = j)^(i - 1) B_l \[ xi \]\
 & #h(2em) lt.eq C sum_(j < k) N_j \[ a_j \] + C epsilon_nu H_k \[ xi \] . $ <co:convolution>]
  For the last inequality, fix $l$. For a specified $m = i - j$, there are at most $m$ intervals $\[ j \, i \)$ of length $m$ containing $l$. Hence its coefficient is bounded by $C sum_(m gt.eq 1) m^2 2^(- \( gamma - 2 a \) m) < oo$. Also $sum_(l < k) B_l \[ xi \] = \( H_k - H_0 \) \[ xi \] lt.eq H_k \[ xi \]$. The identity contribution is bounded separately using (3.9):
  #[#set math.equation(numbering: n => "(3.26)")
   $ sum_(i < k) 2^(- gamma i) \| a_i \|^2 lt.eq C \| xi \|^2 sum_(i gt.eq 0) 2^(- \( gamma - 4 a \) i) lt.eq C \| xi \|^2 . $ <co:background-sum>]
  The lower heat decrement with $A = 1$, together with (3.23), gives
  $ sum_(i < k) N_i \[ a_i \] lt.eq C sum_(i < k) B_i \[ xi \] lt.eq C H_k \[ xi \] . $
  Conversely, the upper heat decrement yields
  $ H_k \[ xi \] lt.eq C \| xi \|^2 + C sum_(i < k) cal(F)_i \[ a_i \] lt.eq C \| xi \|^2 + C sum_(i < k) N_i \[ a_i \] + C epsilon_nu H_k \[ xi \] . $
  Choose the rescaling late enough to absorb the last term. This proves (3.23), since $H_0$ is comparable with $upright("Id")$. Equations (3.25) and (3.26) now imply (3.23). Finally the lower heat decrement for a general fixed $A$ bounds each enlarged-mass quadratic form on $a_i$ by a fixed multiple of $B_i \[ xi \]$. Summing proves the last assertion. ◻
]

#thm([Lemma 3.6.])[
  (Changing the mean normalization).  #emph[Fix $C_0 gt.eq 1$. For $d \( x \, y \) lt.eq C_0 r_i$, put 
$ A_(i \, y) = R_i \( y \) - Q_i \( x \) \, #h(2em) e_(i \, y) = R_i \( y \)^(- 1) xi - H_i \( x \) xi . $

 Then 
#[#set math.equation(numbering: n => "(3.27)")
 $ \| e_(i \, y) \|_(Q_i \( x \))^2 lt.eq C cal(F)_i \( x \) \[ H_i \( x \) xi \] . $ <co:normalization-error-pointwise>]

 If at each $i < k$ at most $J$ such centers are chosen, then 
#[#set math.equation(numbering: n => "(3.28)")
 $ sum_(i < k) sum_y \| e_(i \, y) \|_(Q_i \( x \))^2 lt.eq C_J H_k \( x \) \[ xi \] . $ <co:normalization-error-sum>]

 For any positive semidefinite matrices $C_(i \, y)$ satisfying $C_(i \, y) lt.eq epsilon_nu Q_i \( x \)$, their error cost is 
#[#set math.equation(numbering: n => "(3.29)")
 $ sum_(i < k) sum_y C_(i \, y) \[ e_(i \, y) \] lt.eq C_J epsilon_nu H_k \( x \) \[ xi \] . $ <co:normalization-mass-error>]

]
] <co:normalization-error>

#proof[
  Taking the supremum over $v$ with $\| v \|_(Q_i) = 1$ in (3.16) gives
  #[#set math.equation(numbering: n => "(3.30)")
   $ A_(i \, y) H_i A_(i \, y) lt.eq C cal(F)_i . $ <co:bilinear-dual-form>]
  This follows directly from $sup_(\| v \|_(Q_i) = 1) \| v^T z \|^2 = z^T H_i z$. Write $a_i = H_i xi$. The inverse identity is
  $ e_(i \, y) = - R_i \( y \)^(- 1) A_(i \, y) a_i . $
  Relative comparison $R_i \( y \) asymp Q_i \( x \)$ implies $R_i \( y \)^(- 1) Q_i \( x \) R_i \( y \)^(- 1) lt.eq C H_i \( x \)$. Therefore (3.30) gives
  $ \| e_(i \, y) \|_(Q_i)^2 lt.eq C a_i^T A_(i \, y) H_i A_(i \, y) a_i lt.eq C cal(F)_i \[ a_i \] . $
  This proves (3.27). Sum it, use the bound $J$, and apply (3.23) to obtain (3.28). The last assertion follows by $C_(i \, y) \[ e_(i \, y) \] lt.eq epsilon_nu \| e_(i \, y) \|_(Q_i)^2$. No commutation of $R_i \( y \)$ with $Q_i \( x \)$ has been used. ◻
]

#thm([Lemma 3.7.])[
  (Cumulative comparison for local mass matrices).  #emph[Fix constants $A_0 \, C_0 \, L gt.eq 1$ and a positive integer $J$. At each center $x in B_(A_0) \( p \)$ and each scale $i gt.eq 0$, choose at most $J$ centers $y$ with $d \( x \, y \) lt.eq C_0 r_i$. The choice may depend arbitrarily on $x \, i$. Set 
#[#set math.equation(numbering: n => "(3.31)")
 $ C_(i \, y) = r_i^(2 - n) M \( B_(L r_i) \( y \) \) \, #h(2em) D_(i \, y) = R_i \( y \)^(- 1) C_(i \, y) R_i \( y \)^(- 1) . $ <co:D-definition>]

 Give the chosen centers weights $theta_(i \, y) in \[ 0 \, 1 \]$, and suppose that for every $i$ at least one has weight one and satisfies $B_(L r_i) \( y \) supset B_(r_i) \( x \)$. Write 
#[#set math.equation(numbering: n => "(3.32)")
 $ Z_i = sum_y D_(i \, y) \, #h(2em) S_i = sum_y theta_(i \, y) D_(i \, y) . $ <co:ZS-definition>]

 There is $C_(*) < oo$, depending only on $n \, A_0 \, C_0 \, L \, J$, such that for all sufficiently late rescalings, every such choice, and every integer $k gt.eq 0$, 
#[#set math.equation(numbering: n => "(3.33)")
 $ Z_i lt.eq o \( 1 \) H_i \( x \) \, #h(2em) upright("Id") + sum_(i < k) Z_i lt.eq C_(*) H_k \( x \) \, #h(2em) H_k \( x \) lt.eq C_(*) (upright("Id") + sum_(i < k) S_i) . $ <co:cumulative-estimates>]

 The $o \( 1 \)$ is uniform over the stated centers, all scales, and all choices satisfying these conditions.]
] <co:cumulative-comparison>

#proof[
  Fix $x$ and $xi$, and suppress $x$ from the notation. By (2.13) and nearby Gram comparison, $C_(i \, y) lt.eq epsilon_nu Q_i$, uniformly in all the choices. Conjugation by $R_i \( y \)^(- 1)$, followed by relative comparison, gives $D_(i \, y) lt.eq C epsilon_nu H_i$. Bounded overlap proves the first assertion of (3.33).
  For the upper sum, use $R_i \( y \)^(- 1) xi = a_i + e_(i \, y)$. Positivity gives
  $ D_(i \, y) \[ xi \] = C_(i \, y) \[ a_i + e_(i \, y) \] lt.eq 2 C_(i \, y) \[ a_i \] + 2 C_(i \, y) \[ e_(i \, y) \] . $
  The ball defining $C_(i \, y)$ is contained in $B_(\( L + C_0 \) r_i) \( x \)$. The enlarged upper sum assertion of Lemma 12 therefore bounds the sum of its first terms by $C_J H_k \[ xi \]$. Equation (3.29) bounds the sum of its second terms by $C_J epsilon_nu H_k \[ xi \]$. Since $upright("Id") lt.eq C H_0 lt.eq C H_k$, this proves the middle assertion in (3.33).
  For the reverse direction, at each scale select one of the weight-one centers whose ball covers $B_(r_i) \( x \)$. Then $N_i lt.eq C_(i \, y)$. Write $a_i = R_i \( y \)^(- 1) xi - e_(i \, y)$ to obtain
  $ N_i \[ a_i \] lt.eq 2 C_(i \, y) \[ R_i \( y \)^(- 1) xi \] + 2 C_(i \, y) \[ e_(i \, y) \] lt.eq 2 S_i \[ xi \] + 2 C_(i \, y) \[ e_(i \, y) \] . $
  The central comparison (3.23) and the normalization-error bound give
  $ H_k \[ xi \] lt.eq C (\| xi \|^2 + sum_(i < k) S_i \[ xi \]) + C epsilon_nu H_k \[ xi \] . $
  Choose the rescaling sufficiently late after all fixed constants and absorb the last term. The result is uniform in $k \, x \, xi$ and the center choices. Taking all vectors $xi$ proves the last matrix inequality and completes the lemma. ◻
]

== 4 Summable directional pinching <pi:section>

We prove the estimate which relates a difference of coordinate values to the Bochner measure. The summable quantity in this section is an energy; its square root will occur in individual estimates, but will never be summed without an exponentially decreasing weight.

=== 4.1 Conventions and domains <conventions-and-domains>

We use the sequence of rescaled spaces and harmonic columns constructed in Section 2. We suppress the index of that sequence. Thus the lower Ricci bound is $- kappa$, with $kappa arrow.r 0$, and $o \( 1 \)$ is uniform over the centers and dyadic scales under consideration. The measure is always the Hausdorff measure in the current length units. We write $r_i = 2^(- i)$, $i gt.eq 0$, and use the matrices $R_i$ and the matrix-valued positive measure $M \( u \)$ from the preceding section.

Fix numbers $L \, C_(upright("sep")) > 1$. The final estimate will involve the mass on $B_(L r_i) \( y \)$ and centers satisfying

#[#set math.equation(numbering: n => "(4.1)")
 $ x \, z \, y in B_4 \( p \) \, #h(2em) d \( x \, y \) \, d \( z \, y \) lt.eq C_(upright("sep")) r_i . $ <pi:center-configuration>]

There is no restriction in replacing an initially prescribed number by a larger number greater than one. Set

#[#set math.equation(numbering: n => "(4.2)")
 $ R = 16 \( L + C_(upright("sep")) + 2 \) \, #h(2em) S = 32 R . $ <pi:radii>]

All the balls used below are contained in $B_(16 S + 4) \( p \)$ before the additional dyadic rescaling. We choose this fixed enlargement first and then take a sufficiently late member of the sequence. In particular, the harmonic functions are defined there and all the conclusions of Lemma 5 apply on its fixed enlargements. Poisson solutions centered at $a$ will be defined on $B_(8 S r_i) \( a \)$. Their estimates will be used on $B_(2 S r_i) \( a \)$; the affine fits will be made on $B_(S r_i) \( a \)$; radial invariance will be used only on $B_(S r_i \/ 2) \( a \)$. In the two-center argument, its projection ball is $B_(R r_i) \( z \)$ and the transport calculation uses $B_(3 R r_i) \( z \)$. These choices leave strict margins between every testing ball and its domain of definition.

For a measurable ball $B$ of positive measure, put

$ parallel f parallel_(2 \, B)^(upright("av")) = (integral -_B \| f \|^2 thin upright(d) frak(m))^(1 \/ 2) . $

Unadorned $L^2$ norms below use integrals, rather than averages. After a dyadic rescaling, the volumes of all fixed-radius balls in use are bounded above and below by positive constants. Thus these two norm conventions differ by uniformly bounded factors at each of the fixed radii.

We use two consequences of the preceding section. First, the Dirichlet inequalities on the rescaled balls in use include, for some $d > 1$ and a constant depending on the fixed radius,

#[#set math.equation(numbering: n => "(4.3)")
 $ parallel psi parallel_(L^(2 d))^2 lt.eq C integral \| nabla psi \|^2 thin upright(d) frak(m) \, #h(2em) psi in W_0^(1 \, 2) \( B \) . $ <pi:dirichlet-sobolev>]

as provided by Lemma 3, specifically (2.3). The corresponding Poincaré inequality is included. In dimension two one may choose any one of the available exponents strictly greater than two. The domains are proper subsets of larger balls whose complements have a fixed positive volume, so the Dirichlet inequality is coercive. Second, if

$ sigma_i^a \( b \) = \| b \|_(R_i \( a \)) \, #h(2em) b in bb(R)^n \, $

then, after fixing for example $a_0 = 1 \/ 16$ in the growth estimate,

#[#set math.equation(numbering: n => "(4.4)")
 $ frac(sigma_j^a \( b \), sigma_i^a \( b \)) lt.eq C 2^(a_0 \| i - j \|) quad \( b eq.not 0 \) \, #h(2em) sup_(B_(2 S r_i) \( a \)) \| nabla \( b dot.op u \) \| lt.eq C sigma_i^a \( b \) . $ <pi:coordinate-input>]

Each constant in this section may depend on $n \, L \, C_(upright("sep"))$, and consequently on $R \, S$, but not on $i$, the centers, or the late member of the sequence.

=== 4.2 Positive sources and Poisson pinching <positive-sources-and-poisson-pinching>

Poisson replacements of squared distance follow the almost-rigidity method of Cheeger and Colding #cite(label("CC96")); see also the quantitative regularization in #cite(label("CJN21")) Section 6.1. We retain the full positive Bochner measure and prove the uniform estimates needed at all testing centers.

The following elementary Dirichlet-form observation is useful because an application of Cauchy–Schwarz to the energy estimate alone would not give the required dependence on the mass.

#thm([Lemma 4.1.])[
  (A linear gradient bound for a positive source).  #emph[Let $Omega$ be one of the bounded rescaled domains satisfying (4.3), and suppose that $h in W_0^(1 \, 2) \( Omega \)$ is nonnegative and bounded, with 
$ integral chevron.l nabla h \, nabla psi chevron.r thin upright(d) frak(m) = integral psi thin upright(d) mu $

 for compactly supported Lipschitz tests, where $mu$ is a finite positive measure. If $mu \( Omega \) lt.eq P$, then 
#[#set math.equation(numbering: n => "(4.5)")
 $ integral_Omega \| nabla h \| thin upright(d) frak(m) lt.eq C P \, #h(2em) integral_Omega \| nabla h \|^2 thin upright(d) frak(m) lt.eq parallel h parallel_oo P . $ <pi:positive-source-bounds>]

 The constant in the first inequality depends only on the Sobolev constant, its exponent, and an upper bound for $frak(m) \( Omega \)$.]
] <pi:positive-source>

#proof[
  We first explain the interpretation of tests against $mu$. Since $mu = - Delta h$, its action extends continuously to $W_0^(1 \, 2) \( Omega \)$. This positive functional does not charge a set of zero Sobolev capacity: for a compact such set, test it with nonnegative functions which are at least one near that set and whose $W_0^(1 \, 2)$ norms tend to zero, and use continuity of the functional. Regularity of the measure gives the same conclusion for a Borel set of zero capacity. Consequently bounded Sobolev functions are integrated using their quasi-continuous representatives. Approximation in $W_0^(1 \, 2)$, followed by bounded truncation and a subsequence converging outside a set of zero capacity, shows that the functional and the measure integral agree on these tests. In particular all bounded Lipschitz compositions of $h$ which vanish at zero are admissible. This justifies the truncations used next without making a choice of arbitrary $frak(m)$-almost-everywhere representatives on the support of $mu$.
  If $P = 0$, testing with $h$ proves $h = 0$. Suppose $P > 0$ and put $H = h \/ P$. For $t > 0$, the test $min { H \, t }$ gives
  $ integral_({ H < t }) \| nabla H \|^2 thin upright(d) frak(m) lt.eq t . $
  Applying (4.3) to the same truncation yields
  $ t^2 frak(m) \( H gt.eq t \)^(1 \/ d) lt.eq C t \, #h(2em) frak(m) \( H gt.eq t \) lt.eq C t^(- d) . $
  Choose $0 < alpha < d - 1$. The layer-cake formula, using the volume bound for $t lt.eq 1$ and the last estimate for $t gt.eq 1$, implies
  #[#set math.equation(numbering: n => "(4.6)")
   $ integral_Omega \( 1 + H \)^(1 + alpha) thin upright(d) frak(m) lt.eq C . $ <pi:source-moment>]
  The bounded test $1 - \( 1 + H \)^(- alpha)$ gives
  $ alpha integral_Omega frac(\| nabla H \|^2, \( 1 + H \)^(1 + alpha)) thin upright(d) frak(m) lt.eq 1 . $
  Combining this inequality with (4.6) by weighted Cauchy–Schwarz proves $integral \| nabla H \| lt.eq C$, which is the first assertion. Finally $h$ itself is an admissible bounded test, so $integral \| nabla h \|^2 = integral h thin upright(d) mu lt.eq parallel h parallel_oo P$. ◻
]

For a function with constant Laplacian and a scalar $b$, write

#[#set math.equation(numbering: n => "(4.7)")
 $ cal(B)_kappa \( w \, b \) = M \( w \) - \( 2 b Delta w - n b^2 \) frak(m) . $ <pi:shifted-measure>]

By Lemma 3, this is a nonnegative measure and

#[#set math.equation(numbering: n => "(4.8)")
 $ cal(B)_kappa \( w \, b \) gt.eq \| "Hess" w - b g \|^2 frak(m) . $ <pi:shifted-lower-bound>]

It is quadratic in the pair $\( w \, b \)$. Positivity, applied to the sum and difference of two such pairs, gives the measure inequality

#[#set math.equation(numbering: n => "(4.9)")
 $ cal(B)_kappa \( w_1 - w_2 \, b_1 - b_2 \) lt.eq 2 cal(B)_kappa \( w_1 \, b_1 \) + 2 cal(B)_kappa \( w_2 \, b_2 \) . $ <pi:shifted-triangle>]

These statements use the noncollapsed dimension and trace identity and the improved Bochner inequality; see #cite(label("DPG18")) #cite(label("Han18")) #cite(label("Gigli18")).

#thm([Lemma 4.2.])[
  (Poisson replacements with summable defects).  #emph[There are nonnegative numbers $P_i \( a \)$, defined for every $a in B_4 \( p \)$ and $i gt.eq 0$, with 
#[#set math.equation(numbering: n => "(4.10)")
 $ sup_(a in B_4 \( p \)) sum_(i = 0)^oo P_i \( a \) = o \( 1 \) \, $ <pi:poisson-sum>]

 and functions $f_i^a$ on $B_(8 S r_i) \( a \)$ such that, with $q^a = d_a^2 \/ 2$, 
#[#set math.equation(numbering: n => "(4.11)")
 $ Delta f_i^a = a_i := n + C_0 kappa r_i^2 \, #h(2em) f_i^a - q^a in W_0^(1 \, 2) \( B_(8 S r_i) \( a \) \) . $ <pi:poisson-definition>]

 Here $C_0$ depends only on $n \, S$ and is the same for every center and every scale. The following bounds hold: 
#[#set math.equation(numbering: n => "(4.12)")
 $ 0 lt.eq q^a - f_i^a & lt.eq C r_i^2 \, & sup_(B_(4 S r_i) \( a \)) \| nabla f_i^a \| & lt.eq C r_i \,\
integral_(B_(8 S r_i) \( a \)) \| nabla \( f_i^a - q^a \) \|^2 thin upright(d) frak(m) & lt.eq C r_i^(n + 2) P_i \( a \) \, & integral_(B_(8 S r_i) \( a \)) \| nabla \( f_i^a - q^a \) \| thin upright(d) frak(m) & lt.eq C r_i^(n + 1) P_i \( a \) \,\
cal(B)_kappa \( f_i^a \, 1 \) \( B_(2 S r_i) \( a \) \) & lt.eq C r_i^n P_i \( a \) . $ <pi:poisson-boundedness>]

]
] <pi:poisson-pinching>

#proof[
  Choose $C_0$ sufficiently large that Laplacian comparison gives
  $ Delta q^a lt.eq \( n + C_0 kappa r_i^2 \) frak(m) quad upright("on ") B_(16 S r_i) \( a \) . $
  This is possible because $d_a lt.eq 16 S r_i$ there. Take the sequence late enough that $C_0 kappa lt.eq 1$. Define the positive measure
  $ mu_i^a = a_i frak(m) - Delta q^a quad upright("on ") B_(16 S r_i) \( a \) \, #h(2em) P_i \( a \) = r_i^(- n) mu_i^a \( B_(8 S r_i) \( a \) \) + kappa r_i^2 . $
  Here the measure comparison for the squared distance is on the whole ball, including its center; see #cite(label("Gigli15")) Corollary 5.15, equation (5.29). The source restricted to $B_(8 S r_i) \( a \)$ is a continuous functional on $W_0^(1 \, 2)$ since it is the difference of a bounded density and the distributional Laplacian of the Sobolev function $q^a$. The Dirichlet variational problem therefore gives $h_i^a in W_0^(1 \, 2)$ with $- Delta h_i^a = mu_i^a$. Testing its negative part gives $h_i^a gt.eq 0$, and $f_i^a = q^a - h_i^a$ satisfies (4.11).
  Here is the mass estimate, including its normalization. Set $V_a \( t \) = frak(m) \( B_t \( a \) \)$ and $A_a \( t \) = t^(- n) V_a \( t \)$. Radial testing of the measure-valued Laplacian of $q^a$, with $\| nabla d_a \| = 1$ almost everywhere off $a$, gives
  $ Delta q^a \( B_t \( a \) \) = t V'_a \( t \) quad upright("for almost every ") t . $
  Equivalently, this follows by approximating radial indicators in $- integral t psi' \( t \) V'_a \( t \) thin upright(d) t$; the boundary term at zero vanishes by the local volume upper bound. Thus
  $ mu_i^a \( B_t \( a \) \) = \( a_i - n \) V_a \( t \) - t^(n + 1) A'_a \( t \) $
  at those radii. Positivity and integration for $8 S r_i < t < 16 S r_i$ imply
  #[#set math.equation(numbering: n => "(4.13)")
   $ r_i^(- n) mu_i^a \( B_(8 S r_i) \( a \) \) & lt.eq C integral_(8 S r_i)^(16 S r_i) frac(mu_i^a \( B_t \( a \) \), t^(n + 1)) thin upright(d) t\
 & lt.eq C { A_a \( 8 S r_i \) - A_a \( 16 S r_i \) + kappa r_i^2 } . $ <pi:volume-drop>]
  The last step uses $V_a \( t \) lt.eq C t^n$ on these fixed rescaled balls. For a finite dyadic sum, the volume terms on the right telescope exactly to $A_a \( 8 S r_N \) - A_a \( 16 S \)$. The noncollapsed Bishop inequality gives $lim_(t arrow.b 0) A_a \( t \) lt.eq omega_n$ at every center, where $omega_n$ is the Euclidean unit-ball volume. The fixed-radius volume convergence in the preceding section gives $A_a \( 16 S \) gt.eq omega_n - o \( 1 \)$ uniformly in $a in B_4 \( p \)$. Since $sum_i kappa r_i^2 lt.eq 4 kappa \/ 3$, this proves (4.10). In particular this argument does not assume that the neighboring centers are regular.
  For completeness, the bound for the Dirichlet solution can be obtained with uniform constants directly from (4.3). Work in units $r_i = 1$. Let $tau$ solve $- Delta tau = 1$ with zero boundary values on $B_(8 S) \( a \)$. If $Y \( k \) = frak(m) \( tau > k \)$, testing with $\( tau - k \)_(+)$ and applying Sobolev and Hölder gives, for $l > k$,
  $ Y \( l \) lt.eq C \( l - k \)^(- 2 d) Y \( k \)^(2 d - 1) . $
  Put $k_j = K \( 1 - 2^(- j) \)$. Since $2 d - 1 > 1$, choose $K$ using only $C \, d \, Y \( 0 \)$ so that this recursion implies $Y \( k_j \) lt.eq Y \( 0 \) 2^(- j d \/ \( d - 1 \))$ by induction. Then $tau lt.eq K$. The harmonic function $f_i^a + a_i tau$ has the nonnegative boundary values $q^a$, so the weak maximum principle gives $f_i^a gt.eq - a_i tau$. Together with $h_i^a gt.eq 0$ this gives $0 lt.eq h_i^a lt.eq q^a + a_i tau lt.eq C$. Rescaling proves the first bound in (4.12).
  The local Poisson gradient estimate gives $\| nabla f_i^a \| lt.eq C$ throughout $B_(4 S) \( a \)$ in these units, since the values and the constant right side are bounded. More explicitly, for each $q in B_(4 S) \( a \)$ apply the estimate on $B_(S \/ 4) \( q \)$; its eightfold enlargement $B_(2 S) \( q \)$ is contained in $B_(6 S) \( a \)$, strictly inside the Dirichlet domain $B_(8 S) \( a \)$. The estimate and its uniform local dependence follow from #cite(label("Kell13")) #cite(label("Jiang14")); the local test-function interpretation is supplied by Lemma 3 (see also #cite(label("CDNZPSW"))). Apply Lemma 15 to $h_i^a$ on this same rescaled Dirichlet domain. Its source mass is at most $P_i \( a \)$. This proves both estimates in (4.12), including their displayed powers of $r_i$.
  It remains to bound the full shifted measure. Choose a nonnegative test cutoff $chi$, equal to one on $B_(2 S r_i) \( a \)$ and supported in $B_(4 S r_i) \( a \)$, with $\| Delta chi \| lt.eq C r_i^(- 2)$. Since $h = q^a - f_i^a$ and $\| nabla q^a \| lt.eq 8 S r_i$, we have
  $ integral lr(|1 / 2 \| nabla f_i^a \|^2 - q^a|) thin upright(d) frak(m) lt.eq integral #scale(x: 120%, y: 120%)[\(] \| nabla q^a \| \| nabla h \| + 1 / 2 \| nabla h \|^2 #scale(x: 120%, y: 120%)[\)] thin upright(d) frak(m) lt.eq C r_i^(n + 2) P_i \( a \) . $
  The integral can be restricted to the cutoff support or taken over the Dirichlet domain. Testing the definition of $M$ and using $Delta q^a = a_i frak(m) - mu_i^a$ now gives
  $ integral chi thin upright(d) cal(B)_kappa \( f_i^a \, 1 \) & = 1 / 2 integral \| nabla f_i^a \|^2 Delta chi thin upright(d) frak(m) + kappa integral chi \| nabla f_i^a \|^2 thin upright(d) frak(m) - \( 2 a_i - n \) integral chi thin upright(d) frak(m)\
 & = \( n - a_i \) integral chi thin upright(d) frak(m) - integral chi thin upright(d) mu_i^a + kappa integral chi \| nabla f_i^a \|^2 thin upright(d) frak(m) + O \( r_i^n P_i \( a \) \)\
 & lt.eq C r_i^n P_i \( a \) . $
  The first two terms in the penultimate line are nonpositive, and the curvature term is bounded by $C kappa r_i^(n + 2)$, already included in $C r_i^n P_i \( a \)$. Positivity of $cal(B)_kappa \( f_i^a \, 1 \)$ proves (4.12). ◻
]

#prodef([Remark 4.3.])[
  (The units of the Poisson estimates).  Under $d' = r_i^(- 1) d$, $frak(m)' = r_i^(- n) frak(m)$ and $hat(f)_i^a = r_i^(- 2) f_i^a$, one has $Delta' hat(f)_i^a = a_i$ and $kappa' = kappa r_i^2$. The measure $cal(B)_(kappa') \( hat(f)_i^a \, 1 \)$ is $r_i^(- n) cal(B)_kappa \( f_i^a \, 1 \)$. Consequently all the Poisson bounds above have size $C P_i \( a \)$ in their natural rescaled units. In particular, by (4.9), differences of two replacements at the same scale are harmonic and have Bochner mass at most $C \( P_i \( x \) + P_i \( z \) \)$ on any of the common interior balls. This estimate controls the full measure, including its possible singular part.
] <pi:poisson-units>

=== 4.3 Radial differentiation of the coordinate span <radial-differentiation-of-the-coordinate-span>

The Poisson estimates provide a summable scalar budget. We next fit the radial derivatives by affine combinations of the harmonic coordinates and distribute the errors over neighboring scales.

We first record the weak cancellation used to replace a radial derivative by a harmonic function.

#thm([Lemma 4.4.])[
  (Weak radial cancellation).  #emph[Suppose that $f$ has constant Laplacian and $a$ is harmonic on a ball on which both functions have bounded gradients. Put $g_a = chevron.l nabla f \, nabla a chevron.r$. For interior Sobolev tests $phi.alt in W_0^(1 \, 2)$ one has 
#[#set math.equation(numbering: n => "(4.14)")
 $ integral chevron.l nabla g_a \, nabla phi.alt chevron.r thin upright(d) frak(m) = 2 integral \( "Hess" f - g \) \( nabla a \, nabla phi.alt \) thin upright(d) frak(m) . $ <pi:weak-cancellation-equation>]

 The identity is local, with the right side interpreted on a slightly larger interior ball if a cutoff is needed.]
] <pi:weak-cancellation>

#proof[
  Local test regularity and the Hessian product rule give
  $ nabla g_a = \( "Hess" f \) \( nabla a \, dot.op \) + \( "Hess" a \) \( nabla f \, dot.op \) . $
  For a test function $phi.alt$, express each of the two integrated Hessian terms by differentiating $chevron.l nabla a \, nabla phi.alt chevron.r$ or $chevron.l nabla f \, nabla phi.alt chevron.r$ and integrating by parts. The terms with $"Hess" phi.alt$ cancel, leaving
  $ & integral "Hess" a \( nabla f \, nabla phi.alt \) thin upright(d) frak(m) - integral "Hess" f \( nabla a \, nabla phi.alt \) thin upright(d) frak(m)\
 & #h(1cm)  = - integral Delta f thin chevron.l nabla a \, nabla phi.alt chevron.r thin upright(d) frak(m) + integral Delta a thin chevron.l nabla f \, nabla phi.alt chevron.r thin upright(d) frak(m) = 0 . $
  The constancy of $Delta f$ and harmonicity of $a$ are both used in the last equality. This proves the identity with $"Hess" f$ on the right. Subtracting the metric tensor changes its right side by $2 integral chevron.l nabla a \, nabla phi.alt chevron.r = 0$. Both sides are continuous in the $W_0^(1 \, 2)$ norm, by the bounded gradient factors and the local $L^2$ Hessian bounds. Density therefore extends the identity to the stated tests. ◻
]

#thm([Lemma 4.5.])[
  (Harmonic affine improvement).  #emph[There is an integer $m gt.eq 3$, depending only on $n \, S$, such that, with $theta = 2^(- m)$, the following holds for all sufficiently late spaces, all $i$ and all $a in B_4 \( p \)$. If $w$ is harmonic on $B_(S r_i) \( a \)$, then there is an affine combination $F$ of the components of $u$ with 
#[#set math.equation(numbering: n => "(4.15)")
 $ parallel w - F parallel_(2 \, B_(S theta r_i) \( a \))^(upright("av")) lt.eq 1 / 2 theta^(3 \/ 2) parallel w parallel_(2 \, B_(S r_i) \( a \))^(upright("av")) . $ <pi:affine-improvement-equation>]

]
] <pi:affine-improvement>

#proof[
  In a Euclidean ball, interior derivative estimates and Taylor’s formula at the center give
  $ parallel w - w \( 0 \) - nabla w \( 0 \) dot.op X parallel_(2 \, B_(S theta))^(upright("av")) lt.eq C_n theta^2 parallel w parallel_(2 \, B_S)^(upright("av")) \, #h(2em) theta < 1 \/ 4 . $
  Choose $m$ so that $C_n theta^2 < theta^(3 \/ 2) \/ 4$. If the asserted conclusion failed along increasingly late spaces, rescale by $r_i$, normalize the nonzero norm of $w$ to one, and apply interior harmonic compactness #cite(label("AH18")). The limit is Euclidean harmonic on $B_S$, with norm at most one there. The normalized coordinate columns converge locally uniformly to orthonormal affine Euclidean coordinates, by Lemma 5. An affine combination of these columns therefore approximates the affine Taylor polynomial of the limit uniformly on $B_(S theta)$. Strong convergence on this smaller ball contradicts the strict Euclidean estimate. This contradiction gives a single late-space threshold for every center, scale, and harmonic $w$. If the normalizing norm is zero, the assertion is immediate. ◻
]

#thm([Lemma 4.6.])[
  (Summable radial invariance).  #emph[There are functions $E_i \( a \) > 0$, for $a in B_4 \( p \)$, such that 
#[#set math.equation(numbering: n => "(4.16)")
 $ E_i \( a \) gt.eq P_i \( a \) \, #h(2em) sup_a sum_(i = 0)^oo E_i \( a \) = o \( 1 \) \, #h(2em) inf_a E_i \( a \) > 0 quad upright("for each fixed ") i . $ <pi:pinching-summability>]

 Let $T = R_i \( y \)^(- 1 \/ 2)$ with $d \( a \, y \) lt.eq C_(upright("sep")) r_i$, and put $U = T \( u - u \( a \) \) \/ r_i$. In the metric $r_i^(- 1) d$, with $hat(f)_i^a = f_i^a \/ r_i^2$, there is a matrix $A_i^a \( T \)$ satisfying $parallel A_i^a \( T \) - upright("Id") parallel = o \( 1 \)$ and 
#[#set math.equation(numbering: n => "(4.17)")
 $ ∥chevron.l nabla hat(f)_i^a \, nabla U chevron.r - A_i^a \( T \) \( U - U \( a \) \)∥_(W^(1 \, 2) \( B_(S \/ 2) \( a \) \)) lt.eq C sqrt(E_i \( a \)) . $ <pi:radial-invariance-equation>]

 The ball and all derivatives in this display use the rescaled metric. Arbitrary additive constants may be used in $U$.]
] <pi:radial-invariance>

#proof[
  #emph[Harmonic correction and affine fits.] We first work in the unrescaled units of the current member of the sequence and fix a center $a$ and a covector $b$. Define
  $ g_b = chevron.l nabla q^a \, nabla \( b dot.op u \) chevron.r \, #h(2em) g_(j \, b) = chevron.l nabla f_j^a \, nabla \( b dot.op u \) chevron.r . $
  The Poisson error and (4.4) imply
  #[#set math.equation(numbering: n => "(4.18)")
   $ parallel g_b - g_(j \, b) parallel_(2 \, B_(S r_j) \( a \))^(upright("av")) lt.eq C r_j sigma_j^a \( b \) sqrt(P_j \( a \)) . $ <pi:raw-radial-error>]
  By Lemma 18, the equation for $g_(j \, b)$ on this ball has divergence source $2 \( "Hess" f_j^a - g \) \( nabla \( b dot.op u \) \, dot.op \)$. Its $L^2$ norm is at most $C r_j^(n \/ 2) sigma_j^a \( b \) sqrt(P_j \( a \))$. Solve this divergence equation with zero boundary values to obtain $xi_(j \, b) in W_0^(1 \, 2) \( B_(S r_j) \( a \) \)$. Testing with $xi_(j \, b)$ and then applying Poincaré gives
  #[#set math.equation(numbering: n => "(4.19)")
   $ parallel xi_(j \, b) parallel_(2 \, B_(S r_j) \( a \))^(upright("av")) + r_j parallel nabla xi_(j \, b) parallel_(2 \, B_(S r_j) \( a \))^(upright("av")) lt.eq C r_j sigma_j^a \( b \) sqrt(P_j \( a \)) . $ <pi:radial-harmonic-correction>]
  In particular $g_(j \, b) - xi_(j \, b)$ is harmonic on that ball.
  Let $F_(j \, b)$ be the $L^2 \( B_(S r_j) \( a \) \)$ orthogonal projection of $g_b$ onto the finite-dimensional space of affine combinations of $u$, and set
  $ e_j \( b \) = r_j^(- 1) parallel g_b - F_(j \, b) parallel_(2 \, B_(S r_j) \( a \))^(upright("av")) . $
  The affine space is nondegenerate by harmonic normalization, so these projections exist uniquely as functions and depend linearly on $b$. Apply Lemma 19 to $g_(j \, b) - xi_(j \, b) - F_(j \, b)$. The two errors in (4.18) and (4.19), restricted to the smaller ball, acquire only the fixed volume factor depending on $m \, S$. Dividing by $r_(j + m) = theta r_j$ gives
  #[#set math.equation(numbering: n => "(4.20)")
   $ e_(j + m) \( b \) lt.eq theta^(1 \/ 2) e_j \( b \) + C sigma_j^a \( b \) sqrt(P_j \( a \)) . $ <pi:fit-recurrence>]
  The factor $1 \/ 2$ in the harmonic improvement leaves more than the needed margin in the coefficient of $e_j \( b \)$.
  #emph[Qualitative convergence.] We will also use the uniform estimate
  #[#set math.equation(numbering: n => "(4.21)")
   $ e_j \( b \) lt.eq epsilon sigma_j^a \( b \) \, #h(2em) epsilon = o \( 1 \) . $ <pi:qualitative-radial-error>]
  Here are details concerning the distance gradients in this assertion. In units $r_j = 1$, put $q = q^a \/ r_j^2$, normalize the coordinate column at $a$, and write $V = R_j \( a \)^(- 1 \/ 2) \( u - u \( a \) \) \/ r_j$. On every fixed interior ball, $V$ converges to orthonormal Euclidean coordinates and $q^a \/ r_j^2 - \| V \|^2 \/ 2 arrow.r 0$ uniformly. The norms of the gradients of these two functions have the same limiting squared integrals: for the distance function use $\| nabla \( d_a^2 \/ 2 \) \| = d_a$, and for $\| V \|^2 \/ 2$ use the strong Gram convergence. Their cross term has the same limit. Indeed, for a compactly supported Lipschitz cutoff $chi$,
  $ integral chi chevron.l nabla \( q - \| V \|^2 \/ 2 \) \, nabla \( \| V \|^2 \/ 2 \) chevron.r thin upright(d) frak(m) = - integral \( q - \| V \|^2 \/ 2 \) "div" \( chi nabla \( \| V \|^2 \/ 2 \) \) thin upright(d) frak(m) = o \( 1 \) \, $
  because $Delta \( \| V \|^2 \/ 2 \) = sum_k \| nabla V_k \|^2$ and the relevant gradients are uniformly bounded. Thus the two gradients are close in local $L^2$. Taking scalar products with $nabla V$ and using strong Gram convergence shows
  $ chevron.l nabla q \, nabla V chevron.r - V arrow.r 0 quad upright("in local ") L^2 . $
  This supplies an affine candidate in the defining infimum for $e_j \( b \)$. A contradiction subsequence over the center, scale, and unit normalized covector makes the estimate uniform, proving (4.21).
  #emph[Summable squared errors.] Choose a positive number $eta = o \( 1 \)$ with $eta gt.eq epsilon^2$; for example, add the reciprocal of the sequence index to $epsilon^2$. Fix $gamma = 1 \/ 8$. Iterating (4.20) in each of the finitely many residue classes modulo $m$, and using (4.4), yields
  #[#set math.equation(numbering: n => "(4.22)")
   $ e_i \( b \) lt.eq C sigma_i^a \( b \) sqrt(tilde(P)_i \( a \)) \, #h(2em) tilde(P)_i \( a \) = eta 2^(- gamma i) + sum_(j = 0)^i 2^(- gamma \( i - j \)) P_j \( a \) . $ <pi:smoothed-fit-error>]
  To see the exponent explicitly, the coefficient of a source at $j < i$ before squaring is bounded by $C_m 2^(- \( 1 \/ 2 - a_0 \) \( i - j \))$. The initial error has the same decay times $epsilon$. Weighted Cauchy–Schwarz bounds the square of the source sum by an exponential convolution of $P_j$. Since $a_0 = 1 \/ 16$ and $gamma = 1 \/ 8 < 1 \/ 2 - a_0$, weakening that convolution gives exactly (4.22). This calculation also covers the finitely many initial indices.
  #emph[Removing the constant term.] The constants in the affine fits must be removed with a quantitative bound. Put $c_j = F_(j \, b) \( a \)$. On $B_(S r_(j + 1)) \( a \)$, the difference of consecutive fits has averaged $L^2$ norm at most $C r_j \( e_j \( b \) + e_(j + 1) \( b \) \)$. Uniform affine nondegeneracy, or harmonic interior evaluation on this ball, therefore gives
  $ \| c_j - c_(j + 1) \| lt.eq C r_j \( e_j \( b \) + e_(j + 1) \( b \) \) . $
  Moreover $\| c_j \| lt.eq C r_j sigma_j^a \( b \)$. Indeed the raw radial function has this averaged size, its projection has no larger norm, and affine evaluation at the center is uniformly bounded. The growth exponent $a_0 < 1$ implies $c_j arrow.r 0$ as $j arrow.r oo$. Consequently, using (4.22),
  #[#set math.equation(numbering: n => "(4.23)")
   $ frac(\| c_i \|, r_i sigma_i^a \( b \)) & lt.eq C sum_(l gt.eq i) 2^(- \( 1 - a_0 \) \( l - i \)) #scale(x: 120%, y: 120%)[\(] sqrt(tilde(P)_l \( a \)) + sqrt(tilde(P)_(l + 1) \( a \)) #scale(x: 120%, y: 120%)[\)] . $ <pi:inward-constant-sum>]
  Fix $beta = 1 \/ 16$ and define, with a sufficiently large fixed constant $C_E$,
  #[#set math.equation(numbering: n => "(4.24)")
   $ E_i \( a \) = C_E sum_(l = 0)^oo 2^(- beta \| i - l \|) tilde(P)_l \( a \) . $ <pi:definition-E>]
  Weighted Cauchy–Schwarz in (4.23) then gives $\| c_i \| lt.eq C r_i sigma_i^a \( b \) sqrt(E_i \( a \))$. The two geometric convolution kernels have finite sums, so
  $ sup_a sum_i E_i \( a \) lt.eq C (eta + sup_a sum_i P_i \( a \)) = o \( 1 \) . $
  Also $E_i \( a \) gt.eq P_i \( a \)$ after increasing $C_E$, and the term $l = 0$ gives the center-independent positive floor $E_i \( a \) gt.eq C_E eta 2^(- beta i)$.
  #emph[Gradient control and normalization.] Combining the value estimates already proved gives
  $ parallel g_(i \, b) - \( F_(i \, b) - c_i \) parallel_(2 \, B_(S r_i) \( a \))^(upright("av")) lt.eq C r_i sigma_i^a \( b \) sqrt(E_i \( a \)) . $
  The difference $g_(i \, b) - F_(i \, b)$ satisfies the divergence equation of Lemma 18, because $F_(i \, b)$ is harmonic. Test it against its product with a squared Lipschitz cutoff, equal to one on $B_(S r_i \/ 2) \( a \)$. Cauchy–Schwarz and absorption give the interior energy estimate
  $ parallel nabla \( g_(i \, b) - F_(i \, b) \) parallel_(2 \, B_(S r_i \/ 2) \( a \))^(upright("av")) lt.eq C sigma_i^a \( b \) sqrt(E_i \( a \)) . $
  Here the value term is divided by $r_i$, and the divergence source has the bound used in (4.19).
  For $T = R_i \( a \)^(- 1 \/ 2)$, apply these scalar estimates to its rows, rescale, and stack the resulting affine fits. Their constants at $a$ have been removed, so they give a matrix $A_i^a \( T \)$ and (4.17). The qualitative radial convergence proved above, the Poisson error, and affine nondegeneracy imply $parallel A_i^a \( T \) - upright("Id") parallel lt.eq C \( epsilon + sqrt(P_i \( a \)) + sqrt(E_i \( a \)) \) = o \( 1 \)$ uniformly. Finally, replacing $R_i \( a \)^(- 1 \/ 2)$ by $R_i \( y \)^(- 1 \/ 2)$ conjugates this matrix by $R_i \( y \)^(- 1 \/ 2) R_i \( a \)^(1 \/ 2)$. This matrix and its inverse have uniformly bounded norms by fixed-distance normalization comparability. Thus both the quantitative bound and $A_i^a \( T \) - upright("Id") = o \( 1 \)$ persist. Translating $U$ changes neither side when its center value is subtracted. ◻
]

=== 4.4 Two centers and the sharp coordinate projection <two-centers-and-the-sharp-coordinate-projection>

In Euclidean space, the difference $q^z - q^x$ of the squared-distance potentials is affine, with gradient $x - z$. We need a quantitative version of both facts for the equal-Laplacian Poisson replacements: their harmonic difference must be close to an affine coordinate function, and its coefficient must be close to the coordinate difference of the centers.

Fix a configuration (4.1). In this subsection take $r_i$ as the length unit and replace the measure by $r_i^(- n) frak(m)$. Write

$ f^x = f_i^x \/ r_i^2 \, #h(2em) f^z = f_i^z \/ r_i^2 \, #h(2em) U = R_i \( y \)^(- 1 \/ 2) \( u - u \( z \) \) \/ r_i \, #h(2em) s^2 = E_i \( x \) + E_i \( z \) . $

All balls and derivatives until the final scale conversion are in these units. We write $M$ for the Bochner measure with lower-bound parameter $kappa r_i^2$ in these units, and $g$ for the rescaled metric tensor. The equal-source construction gives $Delta f^x = Delta f^z = a_i$. Put

#[#set math.equation(numbering: n => "(4.25)")
 $ v = f^z - f^x \, #h(2em) L_a w = chevron.l nabla f^a \, nabla w chevron.r med \( a = x \, z \) \, #h(2em) h = chevron.l nabla v \, nabla U chevron.r . $ <pi:pair-notation>]

The domain nesting in (4.2) gives

$ B_(8 R) \( z \) subset B_(S \/ 2) \( x \) ∩ B_(S \/ 2) \( z \) \, #h(2em) B_(2 L + 4) \( y \) subset B_(R \/ 2) \( z \) . $

All these inclusions are strict with a fixed margin, since $d \( x \, z \) lt.eq 2 C_(upright("sep"))$ and $S \/ 2 = 16 R$.

The commutator below first identifies $h$ with $U \( x \) - U \( z \)$ up to $O_(L^2) \( s \)$. The sharp projection then gives an affine function $c_0 + b dot.op U$ whose gradient differs from that of $v$ by $O_(L^2) \( s \)$ on the required interior ball. Averaging against the normalized Gram matrix recovers $b = U \( x \) - U \( z \) + O \( s \)$. These two conclusions transfer the $C s^2$ Bochner bound for $v$ to the coordinate function in the direction $U \( x \) - U \( z \)$.

#thm([Lemma 4.7.])[
  (The two-center commutator).  #emph[On $B_(8 R) \( z \)$ one has 
#[#set math.equation(numbering: n => "(4.26)")
 $ Delta v = 0 \, #h(2em) \| nabla v \| lt.eq C \, #h(2em) M \( v \) \( B_(8 R) \( z \) \) lt.eq C s^2 \, $ <pi:pair-poisson-bounds>]

 and 
#[#set math.equation(numbering: n => "(4.27)")
 $ parallel h - \( U \( x \) - U \( z \) \) parallel_(L^2 \( B_(8 R) \( z \) \)) lt.eq C s . $ <pi:constant-direction>]

]
] <pi:commutator>

#proof[
  The first assertions follow from the common value of the Laplacian, the Poisson gradient bounds, and (4.9); see Remark 17. In particular
  $ parallel "Hess" v parallel_(L^2 \( B_(8 R) \( z \) \)) + parallel "Hess" f^z - g parallel_(L^2 \( B_(8 R) \( z \) \)) lt.eq C s . $
  Let $A_x \, A_z$ be the matrices in Lemma 20 for the common normalization $R_i \( y \)^(- 1 \/ 2)$. Put
  $ delta = U \( x \) - U \( z \) \, #h(2em) B = A_z - A_x \, #h(2em) c = A_x delta . $
  Since $U \( z \) = 0$, subtraction of the two radial-invariance identities gives
  #[#set math.equation(numbering: n => "(4.28)")
   $ h = B U + c + e \, #h(2em) parallel e parallel_(W^(1 \, 2) \( B_(8 R) \( z \) \)) lt.eq C s . $ <pi:commutator-affine>]
  All coordinate gradients are bounded on this ball, and the values of $U$, $delta$, and $c$ are bounded by constants depending on the fixed radii. Also $A_x \, A_z = upright("Id") + o \( 1 \)$.
  Set $L_v w = chevron.l nabla v \, nabla w chevron.r$. Differentiate the radial identity $L_z U = A_z U + O_(W^(1 \, 2)) \( s \)$ along $nabla v$. Its error remains $O_(L^2) \( s \)$ because $\| nabla v \|$ is bounded, so
  $ L_v L_z U = A_z h + O_(L^2) \( s \) . $
  The Hessian product rule separately gives the exact identity
  $ L_v L_z U - L_z h = "Hess" f^z \( nabla v \, nabla U \) - "Hess" v \( nabla f^z \, nabla U \) . $
  The last displayed Hessian bounds and the bounded gradient factors turn its right side into $h + O_(L^2) \( s \)$. Thus
  #[#set math.equation(numbering: n => "(4.29)")
   $ L_z h = \( A_z - upright("Id") \) h + O_(L^2) \( s \) . $ <pi:commutator-equation>]
  Every derivative here is legitimate in $L^2$ by local test regularity and the gradient-product rule; no classical differentiability of the metric is being used.
  Insert (4.28) on both sides of (4.29), and use the radial identity once more to differentiate $B U$. This gives
  $ #scale(x: 120%, y: 120%)[\(] B A_z - \( A_z - upright("Id") \) B #scale(x: 120%, y: 120%)[\)] U - \( A_z - upright("Id") \) c = O_(L^2) \( s \) . $
  Affine nondegeneracy, for example on $B_R \( z \)$, bounds its linear and constant coefficients separately:
  #[#set math.equation(numbering: n => "(4.30)")
   $ parallel B A_z - \( A_z - upright("Id") \) B parallel + \| \( A_z - upright("Id") \) c \| lt.eq C s . $ <pi:commutator-coefficients>]
  Writing $C_z = A_z - upright("Id")$, the first operator is $B + B C_z - C_z B$. Consequently
  $ \( 1 - 2 parallel C_z parallel \) parallel B parallel lt.eq parallel B + B C_z - C_z B parallel lt.eq C s . $
  For sufficiently late spaces, $parallel C_z parallel < 1 \/ 4$, and hence $parallel B parallel lt.eq C s$. Next
  $ \( A_x - upright("Id") \) c = \( A_z - upright("Id") \) c - B c = O \( s \) . $
  Since $c = A_x delta$ and $A_x^(- 1)$ is bounded, this yields
  #[#set math.equation(numbering: n => "(4.31)")
   $ delta - c = - A_x^(- 1) \( A_x - upright("Id") \) c = O \( s \) . $ <pi:delta-from-c>]
  Finally (4.28), the bounded coordinate values, and (4.31) prove (4.27) on the full ball $B_(8 R) \( z \)$. ◻
]

The next lemma supplies the norm bound on a ball larger than the projection domain. This is the step which permits normalization of a potentially very small projected residual.

#thm([Lemma 4.8.])[
  (Radial transport of an unnormalized residual).  #emph[Work in the rescaled units above. Suppose that $w$ is a bounded Sobolev function on $B_(4 R) \( z \)$ with $parallel w parallel_oo lt.eq C_1$, and that 
#[#set math.equation(numbering: n => "(4.32)")
 $ L_z w = w + ell dot.op U + k + e_w \, #h(2em) parallel e_w parallel_(L^2 \( B_(4 R) \( z \) \)) lt.eq C_1 s . $ <pi:transport-hypothesis>]

 Put $alpha = parallel w parallel_(L^2 \( B_R \( z \) \))$. If $\| ell \| + \| k \| lt.eq C_1 \( alpha + s \)$, then 
#[#set math.equation(numbering: n => "(4.33)")
 $ parallel w parallel_(L^2 \( B_(2 R) \( z \) \)) lt.eq C \( alpha + s \) \, $ <pi:transport-conclusion>]

 where $C$ is independent of $alpha \, s$. The constants may depend on $C_1$ and the already fixed radii and coordinate bounds.]
] <pi:radial-transport>

#proof[
  The Sobolev product rule and $Delta f^z = a_i$ give
  #[#set math.equation(numbering: n => "(4.34)")
   $ "div" \( w^2 nabla f^z \) = \( a_i + 2 \) w^2 + w F \, #h(2em) F = 2 \( ell dot.op U + k + e_w \) \, $ <pi:transport-divergence>]
  with $parallel F parallel_(L^2 \( B_(3 R) \( z \) \)) lt.eq C \( alpha + s \)$. The identity is a weak identity: boundedness of $w$, its Sobolev regularity, and the bounded gradient of $f^z$ justify the product and its testing with compactly supported Lipschitz functions.
  Here is a particular cutoff with the required sign. For $t gt.eq 0$ let $k_R \( t \)$ equal one for $t lt.eq 2 R$, decrease linearly to zero on $\[ 2 R \, 3 R \]$, and equal zero for $t gt.eq 3 R$. Choose $A_0 = 2 \( n + 4 \) \/ \( R - 1 \)$ and put
  $ phi.alt \( t \) = cases(delim: "{", 1 \, & 0 lt.eq t lt.eq R \,, e^(- A_0 \( t - R \)) k_R \( t \) \, & R < t < 3 R \,, 0 \, & t gt.eq 3 R .) $
  This is a bounded nonnegative Lipschitz function. It is bounded below by $e^(- A_0 R) > 0$ on $\[ 0 \, 2 R \]$, and on $R < t < 3 R$ it satisfies $- phi.alt' \( t \) gt.eq A_0 phi.alt \( t \)$. Since $n lt.eq a_i lt.eq n + 1$ and $R > 1$, the choice of $A_0$ implies
  #[#set math.equation(numbering: n => "(4.35)")
   $ - t phi.alt' \( t \) - \( a_i + 2 \) phi.alt \( t \) gt.eq \| phi.alt' \( t \) \| + phi.alt \( t \) quad upright("for almost every ") R < t < 3 R . $ <pi:transport-cutoff-sign>]
  The derivative and the cutoff are bounded by fixed constants.
  Write $t = d_z$ and
  $ e_f = chevron.l nabla d_z \, nabla f^z chevron.r - d_z \, #h(2em) cal(A) = integral_(R < d_z < 3 R) \( \| phi.alt' \| + phi.alt \) w^2 thin upright(d) frak(m) . $
  The Poisson gradient error gives $parallel e_f parallel_(L^2 \( B_(3 R) \( z \) \)) lt.eq C s$, because $nabla \( d_z^2 \/ 2 \) = d_z nabla d_z$. Test (4.34) against $phi.alt \( d_z \)$. Using (4.35), and moving the inner-ball term to the right, gives
  #[#set math.equation(numbering: n => "(4.36)")
   $ cal(A) lt.eq C alpha^2 + lr(|integral phi.alt w F thin upright(d) frak(m)|) + lr(|integral_(R < d_z < 3 R) phi.alt' e_f w^2 thin upright(d) frak(m)|) . $ <pi:transport-energy>]
  The decisive coefficient error has the bound
  #[#set math.equation(numbering: n => "(4.37)")
   $ lr(|integral_(R < d_z < 3 R) phi.alt' e_f w^2 thin upright(d) frak(m)|) & lt.eq parallel w parallel_oo (integral \| phi.alt' \| w^2 thin upright(d) frak(m))^(1 \/ 2) (integral \| phi.alt' \| e_f^2 thin upright(d) frak(m))^(1 \/ 2)\
 & lt.eq C s sqrt(cal(A)) lt.eq 1 / 4 cal(A) + C s^2 . $ <pi:transport-square-error>]
  All integrals in the middle line are over the annulus. For the $F$ term, the inner ball contributes at most $C alpha \( alpha + s \)$, while the annulus contributes at most $C sqrt(cal(A)) \( alpha + s \)$. Another application of Young’s inequality therefore gives
  $ lr(|integral phi.alt w F thin upright(d) frak(m)|) lt.eq 1 / 4 cal(A) + C \( alpha^2 + s^2 \) . $
  Substitution in (4.36) proves $cal(A) lt.eq C \( alpha^2 + s^2 \)$. The positive lower bound for $phi.alt$ up to radius $2 R$ now gives (4.33).
  In particular, the fixed bound for $parallel w parallel_oo$ in (4.37) is used before $w$ is divided by $alpha$. The conclusion is quadratic in $s$ at the level of squared norms. ◻
]

#thm([Lemma 4.9.])[
  (Sharp approximation by the harmonic coordinate span).  #emph[For all sufficiently late spaces, there is a vector $b in bb(R)^n$ with $\| b \| lt.eq C$ such that 
#[#set math.equation(numbering: n => "(4.38)")
 $ parallel nabla \( v - b dot.op U \) parallel_(L^2 \( B_(2 L + 4) \( y \) \)) lt.eq C s . $ <pi:sharp-projection-equation>]

 The constants and the late-space threshold are uniform in the configuration (4.1) and the dyadic scale.]
] <pi:sharp-projection>

#proof[
  Subtract a constant from $v$ so that $v \( z \) = 0$; this does not change any gradient, Laplacian, or Bochner measure. Its bounded gradient gives a uniform bound for its values on $B_(8 R) \( z \)$. Let $c_0 + b dot.op U$ be its $L^2 \( B_R \( z \) \)$ orthogonal projection onto the affine coordinate span, and put
  $ w = v - c_0 - b dot.op U \, #h(2em) alpha = parallel w parallel_(L^2 \( B_R \( z \) \)) . $
  Affine nondegeneracy and the bounds for $v \, U$ give $\| c_0 \| + \| b \| lt.eq C$. The function $w$ is harmonic on $B_(8 R) \( z \)$ and has uniformly bounded values and gradients there.
  The gradient product rule and the Poisson estimates yield
  #[#set math.equation(numbering: n => "(4.39)")
   $ nabla \( L_z v - v \) = \( "Hess" f^z - g \) \( nabla v \, dot.op \) + "Hess" v \( nabla f^z \, dot.op \) \, #h(2em) parallel nabla \( L_z v - v \) parallel_(L^2 \( B_(8 R) \( z \) \)) lt.eq C s . $ <pi:euler-gradient>]
  Poincaré on $B_(4 R) \( z \)$, using the gradient on $B_(8 R) \( z \)$, therefore gives a constant $k_v$ such that $L_z v - v = k_v + O_(L^2 \( B_(4 R) \( z \) \)) \( s \)$. Subtracting the projection, and using $L_z U = A_z U + O_(W^(1 \, 2)) \( s \)$, gives
  #[#set math.equation(numbering: n => "(4.40)")
   $ L_z w = w + ell dot.op U + k + e_w \, #h(2em) parallel e_w parallel_(L^2 \( B_(4 R) \( z \) \)) lt.eq C s \, $ <pi:projected-euler-equation>]
  where $ell^T = b^T \( upright("Id") - A_z \)$ and $k = k_v + c_0$. We need a bound for these coefficients in terms of the small residual norm. Caccioppoli for the harmonic function $w$ gives
  $ parallel nabla w parallel_(L^2 \( B_(R \/ 2) \( z \) \)) lt.eq C alpha . $
  The bounded gradient of $f^z$ and (4.40) now bound the $L^2$ norm of $ell dot.op U + k$ on this smaller ball by $C \( alpha + s \)$. Affine nondegeneracy gives
  #[#set math.equation(numbering: n => "(4.41)")
   $ \| ell \| + \| k \| lt.eq C \( alpha + s \) . $ <pi:forcing-coefficient-bound>]
  Lemma 22 consequently applies and yields
  #[#set math.equation(numbering: n => "(4.42)")
   $ parallel w parallel_(L^2 \( B_(2 R) \( z \) \)) lt.eq C \( alpha + s \) . $ <pi:projection-outer-bound>]
  We claim that $alpha lt.eq C s$ with a uniform constant for all sufficiently late spaces. If no such constant and threshold existed, choose a sequence of increasingly late spaces and configurations with $alpha \/ s arrow.r oo$. The positive floor in (4.16) makes $s > 0$, so $hat(w) = w \/ alpha$ is defined along this sequence. The norm on $B_R \( z \)$ is one, and (4.42) bounds its norm on $B_(2 R) \( z \)$ uniformly. Interior harmonic compactness therefore gives local uniform and strong $W^(1 \, 2)$ convergence on $B_(3 R \/ 2) \( z \)$ to a Euclidean harmonic function $w_oo$; see #cite(label("AH18")). Use a rotation so that the normalized columns $U$, centered at $z$, converge to the Euclidean coordinate column $X$.
  The coefficients $ell \/ alpha \, k \/ alpha$ are bounded by (4.41); pass to a convergent subsequence. The error $e_w \/ alpha$ tends to zero in $L^2$. The gradients of $f^z$ converge strongly to the radial vector field $X$: the Poisson gradient error tends to zero, since $P_i \( z \) lt.eq s^2 arrow.r 0$, and the squared-distance gradient convergence was proved in Lemma 20. The normalized harmonic gradients have uniform interior bounds and converge strongly. Thus scalar products of these gradients pass to the limit in (4.40), which becomes
  #[#set math.equation(numbering: n => "(4.43)")
   $ X dot.op nabla w_oo = w_oo + ell_oo dot.op X + k_oo quad upright("on ") B_(3 R \/ 2) \( 0 \) . $ <pi:limiting-euler-equation>]
  One may first pass this identity against interior tests and then use the smoothness of the Euclidean harmonic limit.
  Uniform convergence on a neighborhood of $overline(B)_R \( 0 \)$ and convergence of the measures imply
  $ parallel w_oo parallel_(L^2 \( B_R \( 0 \) \)) = 1 \, #h(2em) integral_(B_R \( 0 \)) w_oo thin upright(d) X = 0 \, #h(2em) integral_(B_R \( 0 \)) w_oo X_j thin upright(d) X = 0 quad \( 1 lt.eq j lt.eq n \) . $
  The boundary sphere has zero Euclidean measure, so restriction to the projection ball causes no loss in these limits. Expand $w_oo$ in its harmonic Taylor series at zero. The operator $X dot.op nabla - 1$ multiplies the homogeneous term of degree $q$ by $q - 1$. Equation (4.43) therefore forces all terms of degree at least two to vanish. Analyticity makes $w_oo$ affine on the ball. Its affine orthogonality would then give zero norm, a contradiction. This proves the claimed uniform bound $alpha lt.eq C s$.
  Finally Caccioppoli on the projection ball gives $parallel nabla w parallel_(L^2 \( B_(R \/ 2) \( z \) \)) lt.eq C s$. Since $B_(2 L + 4) \( y \) subset B_(R \/ 2) \( z \)$ and the constant $c_0$ does not affect gradients, this is (4.38). ◻
]

#thm([Proposition 4.10.])[
  (Summable directional pinching).  #emph[For every fixed $L \, C_(upright("sep")) > 1$, the functions $E_i$ may be chosen as in (4.24), with the uniform summability and positive floors in (4.16), so that the following holds for all sufficiently late spaces. Define 
$ D_(i \, y) = R_i \( y \)^(- 1) #scale(x: 120%, y: 120%)[\[] r_i^(2 - n) M \( u \) \( B_(L r_i) \( y \) \) #scale(x: 120%, y: 120%)[\]] R_i \( y \)^(- 1) . $

 For every configuration (4.1), 
#[#set math.equation(numbering: n => "(4.44)")
 $ D_(i \, y) \[ u \( x \) - u \( z \) \] lt.eq C r_i^2 #scale(x: 120%, y: 120%)[\(] E_i \( x \) + E_i \( z \) #scale(x: 120%, y: 120%)[\)] . $ <pi:directional-estimate>]

 The same functions work simultaneously for all such centers and all dyadic scales. All enlargement constants are fixed before choosing the late-space threshold.]
] <pi:directional-pinching>

#proof[
  Continue first in the rescaled units used in the preceding subsection, and choose $b$ from Lemma 23. The normalization at $y$ is exactly
  $ integral -_(B_1 \( y \)) \( chevron.l nabla U_j \, nabla U_k chevron.r \)_(j \, k) thin upright(d) frak(m) = upright("Id") . $
  Consequently
  $ integral -_(B_1 \( y \)) h thin upright(d) frak(m) & = b + integral -_(B_1 \( y \)) chevron.l nabla U \, nabla \( v - b dot.op U \) chevron.r thin upright(d) frak(m) = b + O \( s \) . $
  Here the gradient bound for $U$ and (4.38) control the last error. Equation (4.27) then gives
  #[#set math.equation(numbering: n => "(4.45)")
   $ b = U \( x \) - U \( z \) + O \( s \) = delta + O \( s \) . $ <pi:coefficient-recovery>]
  The harmonic function $w = v - c_0 - b dot.op U$ has gradient energy at most $C s^2$ on $B_(2 L + 4) \( y \)$. Choose a nonnegative test cutoff $zeta$, equal to one on $B_L \( y \)$ and supported in $B_(2 L + 2) \( y \)$, with bounded Laplacian. Testing the definition of the nonnegative measure $M \( w \)$ gives
  #[#set math.equation(numbering: n => "(4.46)")
   $ M \( w \) \( B_L \( y \) \) & lt.eq 1 / 2 integral \| nabla w \|^2 Delta zeta thin upright(d) frak(m) + kappa r_i^2 integral zeta \| nabla w \|^2 thin upright(d) frak(m)\
 & lt.eq C s^2 . $ <pi:residual-mass>]
  Together with (4.26), positivity and polarization imply $M \( b dot.op U \) \( B_L \( y \) \) lt.eq C s^2$. The normalized mass $M \( U \) \( B_L \( y \) \)$ has bounded trace by Lemma 6. Therefore (4.45) implies
  $ M \( \( delta - b \) dot.op U \) \( B_L \( y \) \) lt.eq \| delta - b \|^2 "tr" M \( U \) \( B_L \( y \) \) lt.eq C s^2 . $
  Another positive quadratic-form triangle inequality gives
  #[#set math.equation(numbering: n => "(4.47)")
   $ M \( delta dot.op U \) \( B_L \( y \) \) lt.eq C s^2 . $ <pi:normalized-directional-mass>]
  In particular the $O \( s \)$ coefficient error has contributed $O \( s^2 \)$ mass, including the possibly singular part of the Bochner measure.
  We finish by recording the scale conversion explicitly. Return to the unrescaled units, set $T = R_i \( y \)^(- 1 \/ 2)$ and $delta u = u \( x \) - u \( z \)$. Under $d' = d \/ r_i$, $frak(m)' = r_i^(- n) frak(m)$ and $U = T u \/ r_i$ up to an additive constant, the matrix-valued measure transforms as
  #[#set math.equation(numbering: n => "(4.48)")
   $ M' \( U \) = r_i^(2 - n) T M \( u \) T^T . $ <pi:matrix-measure-scaling>]
  Indeed the squared gradient matrix of $U$ in the primed metric is $T G T^T$, the Laplacian gains a factor $r_i^2$, and the lower curvature parameter becomes $kappa r_i^2$. Meanwhile $delta = U \( x \) - U \( z \) = T delta u \/ r_i$. Hence, on the corresponding balls,
  $ M' \( delta dot.op U \) \( B'_L \( y \) \) & = r_i^(- n) delta u^T R_i \( y \)^(- 1) M \( u \) \( B_(L r_i) \( y \) \) R_i \( y \)^(- 1) delta u\
 & = r_i^(- 2) D_(i \, y) \[ delta u \] . $
  Applying (4.47) and $s^2 = E_i \( x \) + E_i \( z \)$ proves (4.44). ◻
]

#prodef([Remark 4.11.])[
  (Use with the heat-normalized matrices).  The construction of $E_i$ and the radial argument used $R_i$ for the scalar coordinate norms and did not use the heat matrices. Lemma 9, specifically (3.8), identifies $Q_i$ and $R_i$ up to uniform relative $o \( 1 \)$. They may therefore be interchanged in bounded norm comparisons in the next section. This introduces only multiplicative constants; it adds no per-scale error term to the summable quantities in (4.16) or (4.44). In particular the explicit floor $E_i \( a \) gt.eq C_E eta 2^(- beta i)$ is available when choosing a single center that nearly minimizes $E_i$ on an active coordinate patch.
] <pi:heat-interface>

== 5 Renormalization in the space of coordinate values <re:section>

We now turn the harmonic coordinates into a bi-Lipschitz chart. The construction takes place in the ordinary Euclidean space of their values. In particular, the differentiations below do not involve a pointwise inverse of the differential of the harmonic map.

=== 5.1 Notation and quantitative inputs <re:input-data>

Write $r_i = 2^(- i)$, $P_x = u \( x \)$, and

$ Omega = u \( B_1 \( p \) \) . $

By Lemma 7, $Omega$ is open and $u$ is a homeomorphism from $B_1 \( p \)$ onto $Omega$. We use the positive definite matrices $Q_i \( x \)$ and $H_i \( x \) = Q_i \( x \)^(- 1)$ of Lemma 9. For a positive definite matrix $H$, put $\| xi \|_H = \( xi^T H xi \)^(1 \/ 2)$. Vectors in the source value space are measured with $H_i \( x \)$; covectors in that space are measured with $Q_i \( x \)$, its dual matrix. If $T$ is an $m$-linear map with covector values, our operator norm is

$ parallel T parallel_(H arrow.r Q) = sup { \| T \( xi_1 \, dots.h \, xi_m \) \|_Q : \| xi_a \|_H lt.eq 1 med \( 1 lt.eq a lt.eq m \) #scale(x: 120%, y: 120%)[}] . $

The notation $parallel T parallel_(H arrow.r bb(R)^n)$ has the analogous meaning with the Euclidean target norm. For $m = 0$ these conventions mean the target norm of the value. We denote ordinary Fréchet derivatives in value space by $upright(D)^m$. Whenever a derivative norm at $P_x$ uses $H_i \( x \)$ or $Q_i \( x \)$, these matrices are frozen: they are not differentiated.

The fixed constants from the preceding sections, including all required enlargements of balls, will be chosen before the final rescaling. We may then use a small parameter $epsilon > 0$ tending to zero along that sequence of rescalings. Increasing this parameter by a fixed constant factor if necessary, the following bounds hold:

#[#set math.equation(numbering: n => "(5.1)")
 $ H_i \( x \) lt.eq H_(i + 1) \( x \) lt.eq \( 1 + epsilon \) H_i \( x \) \, #h(2em) Q_0 \( x \) = upright("Id") + o \( 1 \) . $ <re:monotone-metrics>]

The matrices $R_i \( y \)^(- 1)$ and $H_i \( x \)$ are uniformly comparable if $d \( x \, y \) lt.eq C r_i$, for each of the fixed constants $C$ used below. Moreover, normalized harmonic approximation gives the separation and central-ellipsoid conclusions of Lemmas 5 and 7. In particular, there are fixed $a > 0$ and $C_(upright("cmp")) gt.eq 1$ such that, whenever the balls involved are interior,

#[#set math.equation(numbering: n => "(5.2)")
 $ { P : \| P - P_x \|_(H_i \( x \)) < a r_i } subset u \( B_(r_i) \( x \) \) \, #h(2em) H_i \( y \) lt.eq C_(upright("cmp")) H_i \( x \) quad \( d \( x \, y \) lt.eq r_i \) . $ <re:ellipsoid-input>]

Here and below, the harmonic map is defined on the larger balls supplied by the preceding sections, even when an image in (5.2) is not contained in $Omega$.

For a fixed sufficiently large $L$, recall the positive semidefinite matrices

#[#set math.equation(numbering: n => "(5.3)")
 $ D_(i \, y) = R_i \( y \)^(- 1) #scale(x: 120%, y: 120%)[\[] r_i^(2 - n) M \( B_(L r_i) \( y \) \) #scale(x: 120%, y: 120%)[\]] R_i \( y \)^(- 1) . $ <re:patch-matrix>]

Lemma 14 applies to boundedly many centers at distance $O \( r_i \)$ from a testing point, with weights in $\[ 0 \, 1 \]$ and with at least one weight equal to one whose mass ball contains $B_(r_i) \( x \)$. With the notation $Z_i$ for the unweighted sum and $S_i$ for the weighted sum, it gives a fixed constant $C_(*) gt.eq 1$ such that

#[#set math.equation(numbering: n => "(5.4)")
 $ Z_i \( x \) & lt.eq epsilon H_i \( x \) \,\
upright("Id") + sum_(i < k) Z_i \( x \) & lt.eq C_(*) H_k \( x \) \,\
H_k \( x \) & lt.eq C_(*) (upright("Id") + sum_(i < k) S_i \( x \)) . $ <re:cumulative-input>]

Enlarging $C_(*)$ if needed, these statements include $k = 0$.

By Proposition 24, for these fixed choices of $L$ and center separations there are functions $E_i$ on a fixed domain containing $B_1 \( p \)$ such that

#[#set math.equation(numbering: n => "(5.5)")
 $ sup_(x in B_1 \( p \)) sum_(i = 0)^oo E_i \( x \) lt.eq epsilon \, #h(2em) E_i \( x \) gt.eq e_i^(*) > 0 \, $ <re:pinching-input>]

where $e_i^(*)$ is independent of $x$ at each fixed $i$, and

#[#set math.equation(numbering: n => "(5.6)")
 $ D_(i \, y) \[ P_x - P_z \] lt.eq C r_i^2 #scale(x: 120%, y: 120%)[\(] E_i \( x \) + E_i \( z \) #scale(x: 120%, y: 120%)[\)] quad upright("if ") d \( x \, y \) \, d \( z \, y \) lt.eq C_0 r_i . $ <re:directional-input>]

We use $D \[ xi \] = xi^T D xi$ for quadratic forms. The positive floor in (5.5) is supplied by the exponentially decreasing positive term in the construction of $E_i$. Such a term can always be added with arbitrarily small sum. It is used only to select fixed centers for the patches.

All later constants depend on dimension and the fixed preceding constants, but not on the scale, the testing point, or the number of scales. Constants denoted by $C_A$ may additionally depend on a bootstrap constant $A$ and on the jet constants fixed after $A$.

=== 5.2 Smooth fields with directional control <smooth-fields-with-directional-control>

For each $i$ choose a maximal $r_i$-separated subset $cal(Y)_i subset B_1 \( p \)$. Properness and local doubling imply that this family is finite; maximality implies that every point of $B_1 \( p \)$ is at distance at most $r_i$ from some member.

Fix a smooth function $psi : bb(R)^n arrow.r \[ 0 \, 1 \]$ equal to one on ${ \| X \| lt.eq 2 }$ and supported in ${ \| X \| < 3 }$, with

#[#set math.equation(numbering: n => "(5.7)")
 $ parallel upright(D)^m psi parallel_oo lt.eq C_b^(m + 1) \( m ! \)^s #h(2em) \( m gt.eq 0 \) $ <re:bump-jets>]

for a fixed $s > 1$. One may, for example, take $s = 2$. To recall why such bounds are available, the function $e^(- 1 \/ t)$ for $t > 0$, extended by zero for $t lt.eq 0$, has on each fixed bounded interval derivative bounds $C^(m + 1) \( m ! \)^2$. Cauchy’s estimate on a complex disk of radius a fixed small multiple of $t$ bounds its $m$th derivative by $m ! \( C \/ t \)^m e^(- c \/ t)$, and optimization in $t$ gives this assertion. Products, integration, and composition with a fixed quadratic polynomial give a radial cutoff with the specified radii and the same factorial order, by the finite product and chain formulas.

Define

$ phi.alt_(i \, y) \( P \) = psi (r_i^(- 1) R_i \( y \)^(- 1 \/ 2) \( P - P_y \)) . $

For $x in B_1 \( p \)$ let

$ cal(A)_i \( x \) = { y in cal(Y)_i : P_x in "supp" phi.alt_(i \, y) } . $

The harmonic separation estimates show that every member of $cal(A)_i \( x \)$ satisfies $d \( x \, y \) lt.eq C_0 r_i$ for a fixed $C_0$. Indeed, fix a growth exponent $alpha = 1 \/ 16$ in (2.11). For $r_i lt.eq t = d \( x \, y \) lt.eq 1$, choose $j lt.eq i$ with $t lt.eq r_j < 2 t$. The separation estimate at scale $r_j$, followed by inverse matrix comparison in (2.11), gives

$ \| P_x - P_y \|_(R_i \( y \)^(- 1)) gt.eq c \( r_i \/ r_j \)^alpha \| P_x - P_y \|_(R_j \( y \)^(- 1)) gt.eq c r_i \( t \/ r_i \)^(1 - alpha) . $

Membership in the cutoff support bounds the left side by $3 r_i$, so $t \/ r_i$ is bounded. For $t > 1$ in $B_1 \( p \)$, the initial harmonic approximation at scale one gives the same conclusion by comparison with $R_0 \( y \)$. Packing therefore gives $\| cal(A)_i \( x \) \| lt.eq N$ for a fixed $N$. For sufficiently small flatness, a net point with $d \( x \, y \) lt.eq r_i$ satisfies $\| P_x - P_y \|_(R_i \( y \)^(- 1)) < 2 r_i$, so that $phi.alt_(i \, y) \( P_x \) = 1$. Choose $L > C_0 + 2$ in (5.3). In particular the mass ball of this weight-one center contains $B_(r_i) \( x \)$.

These facts justify the application of (5.4) to

#[#set math.equation(numbering: n => "(5.8)")
 $ Z_i \( x \) = sum_(y in cal(A)_i \( x \)) D_(i \, y) \, #h(2em) S_i \( x \) = sum_(y in cal(A)_i \( x \)) phi.alt_(i \, y) \( P_x \) D_(i \, y) . $ <re:active-sums>]

We fix these sums from now on. They are used only pointwise as quadratic forms; no spatial differentiability of them is asserted.

For a patch let

$ T_(i \, y) = { x in B_1 \( p \) : P_x in "supp" phi.alt_(i \, y) } . $

It is nonempty, since it contains $y$. All its points lie within $C_0 r_i$ of $y$. By the positive floor in (5.5), its infimum of $E_i$ is positive. Choose one point $z_(i \, y) in T_(i \, y)$ satisfying

#[#set math.equation(numbering: n => "(5.9)")
 $ E_i \( z_(i \, y) \) < 2 inf_(x in T_(i \, y)) E_i \( x \) \, #h(2em) c_(i \, y) = P_(z_(i \, y)) . $ <re:fixed-center>]

Thus a single fixed point satisfies $E_i \( z_(i \, y) \) lt.eq 2 E_i \( x \)$ at every active testing point of the patch, including the support of every derivative of its cutoff. No continuity of $E_i$ or measurable selection is needed. Restricting the minimization to $T_(i \, y)$ also keeps its center in the stated domain at the coarsest scales.

The following is the covector field used in the iteration:

#[#set math.equation(numbering: n => "(5.10)")
 $ v_i \( P \) = sum_(y in cal(Y)_i) phi.alt_(i \, y) \( P \) D_(i \, y) \( P - c_(i \, y) \) . $ <re:field-definition>]

It is a smooth field on all of value space, since the sum is finite.

#thm([Lemma 5.1.])[
  (Field estimates).  #emph[At $P = P_x$, $x in B_1 \( p \)$, write $r = r_i$, $H = H_i \( x \)$, $Q = Q_i \( x \)$, $Z = Z_i \( x \)$, $S = S_i \( x \)$, and $E = E_i \( x \)$. There is a linear error $e \( xi \)$ such that 
#[#set math.equation(numbering: n => "(5.11)")
 $ r^(- 1) \| v_i \|_Q & lt.eq C sqrt(epsilon) sqrt(E) \,\
\( upright(D) v_i \) xi & = S xi + e \( xi \) \,\
\| S xi \|_Q & lt.eq sqrt(epsilon) sqrt(Z \[ xi \]) \, & \| e \( xi \) \|_Q & lt.eq C sqrt(epsilon) sqrt(E) thin \| xi \|_H \,\
\| xi^T e \( xi \) \| & lt.eq C sqrt(Z \[ xi \] E) thin \| xi \|_H \,\
r \| upright(D)^2 v_i \( xi \, xi \) \|_Q & lt.eq C (sqrt(Z \[ xi \]) thin \| xi \|_H + sqrt(E) thin \| xi \|_H^2) . $ <re:field-value>]

 There is a fixed $C_v gt.eq 1$ such that, in every order $m gt.eq 0$, 
#[#set math.equation(numbering: n => "(5.12)")
 $ r_i^(m - 1) parallel upright(D)^m v_i \( P_x \) parallel_(H_i \( x \) arrow.r Q_i \( x \)) lt.eq epsilon C_v^(m + 1) \( m ! \)^s . $ <re:field-jets>]

]
] <re:field-estimates>

#proof[
  All sums in this proof are over $cal(A)_i \( x \)$. Put $w_y = P_x - c_(i \, y)$. Equation (5.6) and the fixed choice (5.9) give
  #[#set math.equation(numbering: n => "(5.13)")
   $ D_(i \, y) \[ w_y \] lt.eq C r^2 E . $ <re:center-energy>]
  The same center-distance bounds and harmonic normalization give $\| w_y \|_H lt.eq C r$. Since $0 lt.eq D_(i \, y) lt.eq Z lt.eq epsilon H$, conjugation by $H^(- 1 \/ 2)$ gives
  #[#set math.equation(numbering: n => "(5.14)")
   $ \| D_(i \, y) w \|_Q^2 lt.eq epsilon D_(i \, y) \[ w \] quad upright("and") quad \| xi^T D_(i \, y) w \|^2 lt.eq D_(i \, y) \[ xi \] D_(i \, y) \[ w \] . $ <re:positive-matrix-bound>]
  Here the second inequality is Cauchy–Schwarz for a positive semidefinite form and does not require its invertibility. Applying the first inequality to (5.13) and using the bounded number of summands proves (5.11).
  Differentiation of (5.10) gives
  $ e \( xi \) = sum_y \( upright(D) phi.alt_(i \, y) \) xi med D_(i \, y) w_y . $
  By normalized cutoff bounds and matrix comparability,
  #[#set math.equation(numbering: n => "(5.15)")
   $ \| \( upright(D) phi.alt_(i \, y) \) xi \| lt.eq C r^(- 1) \| xi \|_H \, #h(2em) \| upright(D)^2 phi.alt_(i \, y) \( xi \, xi \) \| lt.eq C r^(- 2) \| xi \|_H^2 . $ <re:cutoff-derivative>]
  These inequalities and (5.14) prove the bound for $e$ in (5.11). Since $0 lt.eq S lt.eq Z lt.eq epsilon H$, the same conjugation gives $S Q S lt.eq epsilon S lt.eq epsilon Z$, proving its bound for $S$. For the sharper diagonal bound, use the second inequality in (5.14) before summing:
  $ \| xi^T e \( xi \) \| lt.eq C sqrt(E) thin \| xi \|_H sum_y sqrt(D_(i \, y) \[ xi \]) lt.eq C sqrt(Z \[ xi \] E) thin \| xi \|_H . $
  Finally,
  $ upright(D)^2 v_i \( xi \, xi \) = sum_y (upright(D)^2 phi.alt_(i \, y) \( xi \, xi \) D_(i \, y) w_y + 2 \( upright(D) phi.alt_(i \, y) \) xi med D_(i \, y) xi) . $
  Equations (5.14)–(5.15) bound the two sums by $C r^(- 1) sqrt(epsilon) sqrt(E) thin \| xi \|_H^2$ and $C r^(- 1) sqrt(epsilon) sqrt(Z \[ xi \]) thin \| xi \|_H$, respectively. Dropping $sqrt(epsilon) lt.eq 1$ proves (5.11).
  For the isotropic estimates, $D_(i \, y) lt.eq epsilon H$ also gives $parallel D_(i \, y) parallel_(H arrow.r Q) lt.eq epsilon$ and $\| D_(i \, y) w_y \|_Q lt.eq C epsilon r$. In order $m gt.eq 1$, the product in (5.10) has only the term with $m$ derivatives on the cutoff and the $m$ terms with one derivative on the affine factor. By (5.7), the frozen source-norm comparison, and bounded overlap, their total norm is at most
  $ C epsilon r^(1 - m) (C_1^(m + 1) \( m ! \)^s + m C_1^m \( \( m - 1 \) ! \)^s) . $
  Increase $C_v$ once to obtain (5.12). The preceding value bound with $\| w_y \|_H lt.eq C r$ proves its $m = 0$ case. ◻
]

=== 5.3 The iteration and its derivative bounds <the-iteration-and-its-derivative-bounds>

On the common open set $Omega$ define, as long as the Jacobians are invertible there,

#[#set math.equation(numbering: n => "(5.16)")
 $ h_0 \( P \) = P \, #h(2em) J_i \( P \) = upright(D) h_i \( P \) \, #h(2em) h_(i + 1) \( P \) = h_i \( P \) + J_i \( P \)^(- T) v_i \( P \) . $ <re:iteration>]

The inverse transpose is chosen to turn the leading derivative of $v_i$ directly into a change of metric. To see both the gain and the error, put $W = J^(- T) v$ for a smooth map $h$ with $J = upright(D) h$. Differentiating $J^T J^(- T) = upright("Id")$ gives the exact identity

#[#set math.equation(numbering: n => "(5.17)")
 $ \| \( J + upright(D) W \) xi \|^2 - \| J xi \|^2 =  & 2 xi^T upright(D) v thin xi - 2 chevron.l upright(D)^2 h \( xi \, xi \) \, J^(- T) v chevron.r\
 & + \| upright(D) W thin xi \|^2 . $ <re:metric-step>]

By the field estimates, $upright(D) v_i thin xi = S_i xi + e \( xi \)$. The first term therefore supplies the desired positive increment $2 S_i \[ xi \]$, up to the directional error. The middle term explains why we will estimate the diagonal derivative $upright(D)^2 h_i \( xi \, xi \)$ by a scale recurrence. Bounds on all higher derivatives serve a different purpose: they keep the smooth update controlled despite its loss of one derivative.

We shall prove simultaneously a metric bound and all higher-derivative bounds. Choose $A gt.eq 1$, subsequently fixed in terms of $C_(*)$, and fix $sigma gt.eq max { 1 \, s }$. The desired bounds are

#[#set math.equation(numbering: n => "(5.18)")
 $ A^(- 1) H_i \( x \) & lt.eq J_i \( P_x \)^T J_i \( P_x \) lt.eq A H_i \( x \) \,\
r_i^(m - 1) parallel upright(D)^m h_i \( P_x \) parallel_(H_i \( x \) arrow.r bb(R)^n) & lt.eq B^(m - 1) \( m ! \)^(1 + sigma) #h(2em) \( m gt.eq 2 \) \, $ <re:metric-bootstrap>]

where $B$ will depend on the fixed data and $A \, sigma$, but not on $epsilon \, i \, x \, m$.

The next lemma shows that matrix inversion preserves the exponential base $B$ in these derivative bounds. A new factor growing exponentially with the order at each step would prevent the simultaneous induction.

#thm([Lemma 5.2.])[
  (Factorial convolution and inverse coefficients).  #emph[Fix $sigma gt.eq 1$ and put $L_0 = 1$ and 
$ L_m = \( m + 1 \) \( \( m + 1 \) ! \)^sigma #h(2em) \( m gt.eq 1 \) . $

 Then 
#[#set math.equation(numbering: n => "(5.19)")
 $ delta_m := sum_(l = 1)^(m - 1) frac(L_l L_(m - l), L_m) arrow.r 0 \, #h(2em) sum_(l = 0)^m L_l L_(m - l) lt.eq C_sigma L_m . $ <re:convolution-decay>]

 Suppose a smooth matrix-valued function $J$ is invertible at a point and, in Euclidean operator norms at that point, 
$ parallel J^(- 1) parallel lt.eq sqrt(A) \, #h(2em) frac(parallel upright(D)^m J parallel, m !) lt.eq B^m L_m quad \( m gt.eq 1 \) \, #h(2em) A \, B gt.eq 1 . $

 There is a constant $C_(A \, sigma)$, independent of $m$ and $B$, such that 
#[#set math.equation(numbering: n => "(5.20)")
 $ frac(parallel upright(D)^m \( J^(- 1) \) parallel, m !) lt.eq C_(A \, sigma) B^m L_m #h(2em) \( m gt.eq 0 \) . $ <re:inverse-jets>]

 The assertion also holds for the inverse transpose.]
] <re:inverse-majorant>

#proof[
  For $1 lt.eq l lt.eq m - 1$ the summand in the first expression of (5.19) is
  $ frac(\( l + 1 \) \( m - l + 1 \), m + 1) (frac(\( l + 1 \) ! \( m - l + 1 \) !, \( m + 1 \) !))^sigma . $
  The two terms with $l = 1 \, m - 1$ are $O_sigma \( m^(- sigma) \)$; the terms with $l = 2 \, m - 2$ are $O_sigma \( m^(- 2 sigma) \)$. For $3 lt.eq l lt.eq m - 3$, the factorial ratio is at most $24 \/ \( \( m + 1 \) m \( m - 1 \) \)$: its maximum in this interval occurs at an endpoint, as is seen by taking the ratio of consecutive terms. The first factor is at most $m + 1$, and there are at most $m$ such terms. Their sum is therefore $O_sigma \( m^(2 - 3 sigma) \)$, which is $O_sigma \( m^(- sigma) \)$ because $sigma gt.eq 1$. This proves $delta_m arrow.r 0$; the finitely many small values of $m$ do not matter. Including the terms $l = 0 \, m$ proves the second assertion of (5.19).
  Let $K = J^(- 1)$. The multilinear product formula, followed by the operator norm inequality and division by $m !$, gives
  $ frac(parallel upright(D)^m K parallel, m !) lt.eq sqrt(A) sum_(l = 1)^m frac(parallel upright(D)^l J parallel, l !) frac(parallel upright(D)^(m - l) K parallel, \( m - l \) !) . $
  In particular the binomial coefficients in the product formula have been removed exactly. After dividing out $B^m$, universal majorants $a_m$ for the positive-order coefficients satisfy
  #[#set math.equation(numbering: n => "(5.21)")
   $ a_m lt.eq A L_m + sqrt(A) sum_(l = 1)^(m - 1) L_l a_(m - l) . $ <re:inverse-recursion>]
  Choose $M = M \( A \, sigma \)$ so that $sqrt(A) thin delta_m lt.eq 1 \/ 2$ for $m gt.eq M$. The recursion for the finitely many orders $m < M$ gives finite universal bounds depending only on $A$ and $sigma$. Choose $C_(A \, sigma)$ to dominate $sqrt(A)$, $2 A$, and all these bounds after division by $L_m$. If $a_q lt.eq C_(A \, sigma) L_q$ for $q < m$, then (5.21) gives, for $m gt.eq M$,
  $ a_m / L_m lt.eq A + sqrt(A) thin C_(A \, sigma) delta_m lt.eq A + 1 / 2 C_(A \, sigma) lt.eq C_(A \, sigma) . $
  This proves (5.20) with a single constant for all orders; no factor $C_(A \, sigma)^m$ has been introduced. Transposition preserves Euclidean operator norms and the same derivative estimates. ◻
]

#thm([Lemma 5.3.])[
  (One step for all jets).  #emph[Choose $B gt.eq C_v$ sufficiently large and then $epsilon$ sufficiently small, depending on $A \, sigma \, B$ and the fixed data. If (5.18) and (5.18) hold at level $i$, the update (5.16) satisfies (5.18) at level $i + 1$. This assertion does not require the new-level metric bound.]
] <re:jet-step>

#proof[
  Freeze $x$ and abbreviate $r = r_i$, $H = H_i \( x \)$, $Q = H^(- 1)$. The linear source and target normalizations are
  $ P & = P_x + r H^(- 1 \/ 2) X \,\
tilde(h) \( X \) & = r^(- 1) #scale(x: 120%, y: 120%)[\(] h_i \( P_x + r H^(- 1 \/ 2) X \) - h_i \( P_x \) #scale(x: 120%, y: 120%)[\)] \,\
tilde(v) \( X \) & = r^(- 1) H^(- 1 \/ 2) v_i \( P_x + r H^(- 1 \/ 2) X \) . $
  At $X = 0$, $tilde(J) = upright(D) tilde(h) = J_i H^(- 1 \/ 2)$ has singular values between $A^(- 1 \/ 2)$ and $A^(1 \/ 2)$, and
  $ tilde(J)^(- T) tilde(v) = r^(- 1) J_i^(- T) v_i . $
  This identity checks the covector normalization in the update. All matrices in the change of variables are constant matrices.
  For every $m gt.eq 1$, (5.18) gives
  $ frac(parallel upright(D)^m tilde(J) \( 0 \) parallel, m !) lt.eq frac(B^m \( \( m + 1 \) ! \)^(1 + sigma), m !) = B^m L_m . $
  Lemma 27 therefore bounds the coefficients of $tilde(J)^(- T)$ by $C_(A \, sigma) B^m L_m$. On the other hand, (5.12) gives
  $ frac(parallel upright(D)^q tilde(v) \( 0 \) parallel, q !) lt.eq epsilon C_v^(q + 1) \( q ! \)^(s - 1) lt.eq epsilon C_v B^q L_q #h(2em) \( q gt.eq 0 \) . $
  The product rule divided by $m !$ and (5.19) now imply
  #[#set math.equation(numbering: n => "(5.22)")
   $ frac(parallel upright(D)^m \( tilde(J)^(- T) tilde(v) \) \( 0 \) parallel, m !) lt.eq epsilon C_A B^m L_m . $ <re:increment-jets>]
  To pass to next-scale jet units, note that $H_(i + 1) \( x \) gt.eq H_i \( x \)$. Thus the norm of any multilinear map with source norm $H_(i + 1) \( x \)$ is at most its norm with source norm $H_i \( x \)$. The change from $r_i$ to $r_(i + 1) = r_i \/ 2$ supplies the additional factor $2^(1 - m)$. Relative to the allowance $B^(m - 1) \( m ! \)^(1 + sigma)$ at order $m gt.eq 2$, the old contribution is at most $2^(1 - m) lt.eq 1 \/ 2$, while (5.22) contributes at most
  $ epsilon C_A B thin 2^(1 - m) \( m + 1 \)^(1 + sigma) . $
  The supremum of $2^(1 - m) \( m + 1 \)^(1 + sigma)$ over $m gt.eq 2$ is finite. One sufficiently small choice of $epsilon$ therefore makes the new contribution at most one half in every order simultaneously. This proves the lemma. ◻
]

=== 5.4 Diagonal second derivatives and the metric bootstrap <diagonal-second-derivatives-and-the-metric-bootstrap>

#thm([Proposition 5.4.])[
  (Uniform metric and jet bounds).  #emph[There are fixed $A \, B$ and a sufficiently small flatness threshold such that the maps (5.16) are smooth on all of $Omega$ for every finite $i$, their Jacobians are invertible there, and (5.18)–(5.18) hold for all $x in B_1 \( p \)$ and every $i$.]
] <re:metric-iteration>

#proof[
  We give the estimates under the induction hypothesis through level $k - 1$ and then close that induction. Fix $x$ and a nonzero source vector $xi$. Every expression in this proof is evaluated at $P_x$. Set
  $ q_i = \| xi \|_(H_i \( x \)) \, #h(2em) b_i = frac(r_i \| upright(D)^2 h_i \( xi \, xi \) \|, q_i) \, #h(2em) K_i = J_i^(- T) \, #h(2em) W_i = K_i v_i . $
  The metric bound gives $\| K_i w \| lt.eq sqrt(A) \| w \|_(Q_i \( x \))$ for covectors $w$, since $\( J_i^T J_i \)^(- 1) lt.eq A Q_i \( x \)$. The jet bounds through order three, the ordinary inverse derivative formula, and the duality of $H_i$ and $Q_i$ give
  #[#set math.equation(numbering: n => "(5.23)")
   $ \| \( upright(D)_xi K_i \) w \| & lt.eq C_A q_i / r_i \| w \|_(Q_i \( x \)) \,\
\| \( upright(D)_xi^2 K_i \) w \| & lt.eq C_A q_i^2 / r_i^2 \| w \|_(Q_i \( x \)) . $ <re:first-inverse-cost>]
  For completeness, after the frozen normalization in the preceding lemma, the first formula is $upright(D)_xi K_i = - K_i \( upright(D)_xi J_i \)^T K_i$. The second derivative is a sum of two products containing two first derivatives of $J_i$ and one product containing $upright(D)_xi^2 J_i$. Bounds for $upright(D)^2 h_i$ and $upright(D)^3 h_i$, with the bounded normalized inverse, give exactly (5.23)–(5.23) after undoing the normalization. Thus these estimates are also valid for arbitrarily anisotropic $H_i$.
  Twice differentiating $W_i$ gives all three types of terms:
  #[#set math.equation(numbering: n => "(5.24)")
   $ upright(D)^2 W_i \( xi \, xi \) = K_i upright(D)^2 v_i \( xi \, xi \) + 2 \( upright(D)_xi K_i \) \( upright(D) v_i xi \) + \( upright(D)_xi^2 K_i \) v_i . $ <re:second-increment-terms>]
  By Lemma 26 and (5.23)–(5.23), multiplication by $r_i \/ q_i$ bounds each of these terms by a constant times
  $ f_i := sqrt(Z_i \( x \) \[ xi \]) + sqrt(E_i \( x \)) thin q_i . $
  More explicitly, the first term uses (5.11); the second uses $\| upright(D) v_i xi \|_(Q_i) lt.eq C sqrt(epsilon) f_i$; and the third uses $\| v_i \|_(Q_i) lt.eq C sqrt(epsilon) r_i sqrt(E_i \( x \))$. Because $q_(i + 1) gt.eq q_i$ and $r_(i + 1) = r_i \/ 2$, the old second derivative contracts by at least a factor of one half. Hence
  #[#set math.equation(numbering: n => "(5.25)")
   $ b_(i + 1) lt.eq 1 / 2 b_i + C_A f_i \, #h(2em) b_0 = 0 . $ <re:diagonal-recurrence>]
  Convolution with the sequence $1 \, 1 \/ 2 \, 1 \/ 4 \, dots.h$, whose sum is two, is bounded on $ell^2$. Thus, for every finite $k$ covered by the induction hypothesis,
  #[#set math.equation(numbering: n => "(5.26)")
   $ sum_(i < k) b_i^2 & lt.eq C_A sum_(i < k) (Z_i \( x \) \[ xi \] + E_i \( x \) q_i^2)\
 & lt.eq C_A H_k \( x \) \[ xi \] . $ <re:diagonal-square-sum>]
  The last line uses (5.4), monotonicity $H_i lt.eq H_k$, and (5.5). In particular it does not require that the matrices $H_i$ remain bounded as $i arrow.r oo$.
  The first derivative of the increment satisfies
  $ Delta_i J thin xi := \( J_(i + 1) - J_i \) xi = K_i \( upright(D) v_i xi \) + \( upright(D)_xi K_i \) v_i . $
  The same estimates give the pointwise square bound
  #[#set math.equation(numbering: n => "(5.27)")
   $ \| Delta_i J thin xi \|^2 lt.eq C_A epsilon (Z_i \( x \) \[ xi \] + E_i \( x \) q_i^2) . $ <re:squared-increment>]
  Consequently their sum for $i < k$ is at most $C_A epsilon H_k \( x \) \[ xi \]$.
  It remains to control the linear part of the increment of the squared length. The undifferentiated inverse gives
  $ chevron.l J_i xi \, K_i upright(D) v_i xi chevron.r = xi^T upright(D) v_i xi = S_i \( x \) \[ xi \] + xi^T e_i \( xi \) . $
  For the differentiated inverse, direct matrix multiplication gives
  #[#set math.equation(numbering: n => "(5.28)")
   $ chevron.l J_i xi \, \( upright(D)_xi K_i \) v_i chevron.r & = - xi^T \( upright(D)_xi J_i \)^T J_i^(- T) v_i\
 & = - chevron.l upright(D)^2 h_i \( xi \, xi \) \, K_i v_i chevron.r_(bb(R)^n) . $ <re:inverse-transpose-contraction>]
  The inner product on the right is the ordinary Euclidean target inner product. Its absolute value is bounded by $C_A b_i q_i sqrt(E_i \( x \))$, using (5.11) and dropping the additional factor $sqrt(epsilon) lt.eq 1$.
  Now expand $\| J_(i + 1) xi \|^2 - \| J_i xi \|^2$, sum over $i < k$, and use (5.11), (5.27), and (5.28). The two linear error sums satisfy, respectively,
  $ sum_(i < k) \| xi^T e_i \( xi \) \| & lt.eq C (sum_(i < k) Z_i \( x \) \[ xi \])^(1 \/ 2) (sum_(i < k) E_i \( x \) q_i^2)^(1 \/ 2) lt.eq C sqrt(epsilon) H_k \( x \) \[ xi \] \,\
sum_(i < k) b_i q_i sqrt(E_i \( x \)) & lt.eq (sum_(i < k) b_i^2)^(1 \/ 2) (sum_(i < k) E_i \( x \) q_i^2)^(1 \/ 2) lt.eq C_A sqrt(epsilon) H_k \( x \) \[ xi \] . $
  We have proved the quantitative cumulative error estimate
  #[#set math.equation(numbering: n => "(5.29)")
   $ lr(|thin \| J_k xi \|^2 - \| xi \|^2 - 2 sum_(i < k) S_i \( x \) \[ xi \] thin|) lt.eq C_A \( sqrt(epsilon) + epsilon \) H_k \( x \) \[ xi \] . $ <re:metric-error>]
  Only the sum of $E_i$ has been used, never the sum of its square roots.
  We now fix the constants and complete the simultaneous induction. By (5.4) and $0 lt.eq S_i lt.eq Z_i$,
  #[#set math.equation(numbering: n => "(5.30)")
   $ C_(*)^(- 1) H_k lt.eq upright("Id") + 2 sum_(i < k) S_i lt.eq 2 C_(*) H_k . $ <re:leading-metric-comparison>]
  Choose $A gt.eq 4 C_(*)$, increasing it if necessary for the initial comparability of $H_0$ and $upright("Id")$. Fix $sigma \, B$ as in Lemma 28. Only now choose the data sufficiently flat that its smallness requirement holds and
  $ C_A \( sqrt(epsilon) + epsilon \) < frac(1, 2 C_(*)) . $
  Then (5.29) and (5.30) imply (5.18) with slack at level $k$.
  Initially $h_0$ is affine, so all its positive-order derivatives beyond the first vanish, and both bootstrap statements hold. Suppose they hold through level $i$. The pointwise inverse of $J_i$ exists everywhere on $Omega$ and is smooth there; hence the update defines a smooth $h_(i + 1)$ on this same open set. The proof of (5.29) at $k = i + 1$ uses inverse and jet estimates only through level $i$: the error sum uses $b_j$ only for $j lt.eq i$, whose recurrence involves still earlier increments. It therefore proves the metric bound and invertibility at level $i + 1$ without assuming them. Lemma 28 proves all jet bounds at level $i + 1$ using the old-level data. This is an induction on the finite scale index with an all-orders assertion at each step, and completes the proof. ◻
]

#prodef([Remark 5.5.])[
  The construction neither differentiates the fields $H_i$ nor assumes that they have a finite limit. It also does not require the maps $h_i$ themselves to be globally injective. Their ordinary Jacobians are invertible on the fixed open value-space domain, which is exactly what the update needs.
]

=== 5.5 Passage to an open bi-Lipschitz chart <passage-to-an-open-bi-lipschitz-chart>

#thm([Proposition 5.6.])[
  (The limiting chart).  #emph[For sufficiently flat data in the preceding construction, there is $rho > 0$ such that the uniform limit 
$ F \( x \) = lim_(i arrow.r oo) h_i \( u \( x \) \) \, #h(2em) x in B_1 \( p \) \, $

 restricts to a bi-Lipschitz homeomorphism from $B_rho \( p \)$ onto an open subset of $bb(R)^n$. Its distance comparisons use the ambient distance $d$ restricted to $B_rho \( p \)$.]
] <re:limit-chart>

#proof[
  From (5.11) and (5.18),
  $ \| h_(i + 1) \( P_x \) - h_i \( P_x \) \| lt.eq C_A sqrt(epsilon) r_i sqrt(E_i \( x \)) lt.eq C_A epsilon r_i . $
  The geometric series gives uniform convergence on $B_1 \( p \)$ and a tail estimate
  #[#set math.equation(numbering: n => "(5.31)")
   $ sup_(x in B_1 \( p \)) \| F \( x \) - h_i \( P_x \) \| lt.eq tau r_i \, #h(2em) tau = C_A epsilon arrow.r 0 . $ <re:uniform-tail>]
  Each approximating map is continuous, so $F$ is continuous.
  Let $K_2 = B \( 2 ! \)^(1 + sigma)$, the fixed second-derivative constant in (5.18). By (5.2), along any value-space segment contained in the central ellipsoid at $x$, with preimages in $B_(r_i) \( x \) subset B_1 \( p \)$,
  #[#set math.equation(numbering: n => "(5.32)")
   $ \| upright(D)^2 h_i \( P_y \) \( zeta \, zeta \) \| lt.eq frac(K_2 C_(upright("cmp")), r_i) \| zeta \|_(H_i \( x \))^2 . $ <re:taylor-constant>]
  Put $K_T = K_2 C_(upright("cmp")) \/ 2$. Choose a fixed $D gt.eq 1$ so large that
  #[#set math.equation(numbering: n => "(5.33)")
   $ D > 4 \/ a \, #h(2em) 4 K_T \/ D lt.eq 1 \/ \( 8 sqrt(A) \) . $ <re:choice-D>]
  These choices depend only on constants already fixed in the construction.
  Take a further sufficiently late rescaling, without changing those constants, so that the normalized harmonic approximation at the fixed scale ratio $D$ gives
  #[#set math.equation(numbering: n => "(5.34)")
   $ 1 / 2 d \( x \, z \) lt.eq \| P_z - P_x \|_(H_i \( x \)) lt.eq 2 d \( x \, z \) quad upright("whenever ") D r_i^(- 1) d \( x \, z \) in \[ 1 \/ 2 \, 1 \] $ <re:pair-normalization>]
  on the interior balls in use. To justify this precise consequence, normalized harmonic approximation controls distances in value space up to $o \( 1 \) r_i$ on the fixed ball; since the displayed distances are at least $r_i \/ \( 2 D \)$, its relative error tends to zero after $D$ has been fixed. The relative comparison of $Q_i$ with the normalization matrices preserves these bounds. Also require
  #[#set math.equation(numbering: n => "(5.35)")
   $ 4 D tau lt.eq 1 \/ \( 8 sqrt(A) \) . $ <re:choice-tail>]
  Set, for example, $rho = \( 16 D + 4 \)^(- 1)$. If $x \, z in B_rho \( p \)$ are distinct and $t = d \( x \, z \)$, then $t lt.eq 2 rho$. Choose a dyadic scale with
  $ D t lt.eq r_i < 2 D t . $
  It has $r_i < 4 D rho < 1$, and $B_(r_i) \( x \) subset B_1 \( p \)$. Thus every pair in the final ball, not merely sufficiently generic pairs, is covered by an available scale. Write $Delta = P_z - P_x$. Equation (5.34) gives $t \/ 2 lt.eq \| Delta \|_(H_i \( x \)) lt.eq 2 t$. By (5.33), $\| Delta \|_(H_i \( x \)) < a r_i$. The entire straight segment
  $ P_x + s Delta \, #h(2em) 0 lt.eq s lt.eq 1 \, $
  therefore lies in the central ellipsoid in (5.2), and hence in $u \( B_(r_i) \( x \) \) subset Omega$. In particular every point where a derivative is integrated has an interior preimage and obeys the matrix comparison used in (5.32).
  Taylor’s formula along this segment yields
  $ h_i \( P_z \) - h_i \( P_x \) = J_i \( P_x \) Delta + cal(R) \, #h(2em) \| cal(R) \| lt.eq K_T / r_i \| Delta \|_(H_i \( x \))^2 lt.eq frac(4 K_T, D) t lt.eq frac(t, 8 sqrt(A)) . $
  The metric bound gives
  $ frac(t, 2 sqrt(A)) lt.eq \| J_i \( P_x \) Delta \| lt.eq 2 sqrt(A) thin t . $
  Finally the two tails in (5.31) have total size at most $2 tau r_i lt.eq 4 D tau t lt.eq t \/ \( 8 sqrt(A) \)$. Combining the last three inequalities proves, for every $x \, z in B_rho \( p \)$,
  #[#set math.equation(numbering: n => "(5.36)")
   $ frac(1, 4 sqrt(A)) d \( x \, z \) lt.eq \| F \( x \) - F \( z \) \| lt.eq 4 sqrt(A) thin d \( x \, z \) . $ <re:final-bilipschitz>]
  The case $x = z$ is immediate. In particular $F$ is injective there and has a continuous inverse onto its image.
  The set $u \( B_rho \( p \) \)$ is open, by the previously established open coordinates. The continuous injective map
  $ F compose u^(- 1) : u \( B_rho \( p \) \) arrow.r bb(R)^n $
  therefore has open image by invariance of domain #cite(label("Hatcher02")) Theorem 2B.3. This proves the proposition. All scale choices used $t = d \( x \, z \)$ in the ambient space; no intrinsic path distance on the chosen neighborhood was substituted. ◻
]

#proof[
  Let $p$ be the prescribed $n$-regular point of the noncollapsed $upright("RCD") \( K \, n \)$ space. The preceding sections provide the geometric, harmonic, heat, and directional-pinching conclusions on sufficiently late rescalings at $p$. First fix the finitely many patch enlargement constants using only $n$. Choose the cutoff with $s = 2$ and fix $sigma = 2$. The cumulative constant $C_(*)$, the bootstrap constants $A \, B$, and then $D$ in (5.33) consequently depend only on $n$. Choose a rescaling sufficiently late that all their flatness requirements, the simultaneous induction, and (5.35) hold. Proposition 31 gives an open ball about $p$ and a chart with the required two-sided distance bound on that rescaled space. If its metric is $d \/ r_(*)$, multiply the coordinate values of that chart by $r_(*)$ when returning to the original metric. Both sides of (5.36) then scale by the same factor, while the domain remains an open neighborhood and the image remains an open subset of $bb(R)^n$. Thus Theorem 1 holds with $L_n = 4 sqrt(A \( n \))$. The required rescaling, and hence the radius of the neighborhood in the original metric, may depend on $X$ and $p$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
