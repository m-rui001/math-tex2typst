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

#align(center)[#text(size: 16pt, weight: "bold")[Gigli's distributional curvature \
characterization of Alexandrov spaces]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

On a smooth Riemannian manifold, a lower bound for sectional curvature is equivalent to a lower comparison bound for geodesic triangles. Gigli’s distributional curvature tensor makes the analytic side of this statement meaningful on spaces with synthetic lower Ricci curvature bounds. The purpose of this paper is to prove that the same equivalence holds in that setting, with the Hausdorff measure and dimension hypotheses proposed by Gigli.

An Alexandrov lower curvature bound $upright("CBB") \( kappa \)$ means that geodesic triangles satisfy lower comparison with the simply connected surface of constant curvature $kappa$, at the usual model scale when $kappa > 0$. A $upright("RCD") \( K \, N \)$ space combines the unreduced optimal-transport curvature-dimension condition $upright("CD") \( K \, N \)$ with quadratic Cheeger energy. The latter gives a Hilbertian Sobolev calculus in which the tensor below is defined. We take the reference measure to be the exact Hausdorff measure, not merely a measure equivalent to it.

On a full-support finite-dimensional $upright("RCD")$ space $\( M \, d \, m \)$, we use the nonpositive Laplacian:

$ integral_M chevron.l nabla f \, nabla h chevron.r thin upright(d) m = - integral_M \( Delta f \) h thin upright(d) m . $

The domain $D \( Delta \)$ is the domain of the $L^2$ generator. In particular, its members belong to $W^(1 \, 2) \( M \)$. Our test classes are

#[#set math.equation(numbering: n => "(1.1)")
 $ "Test" \( M \) & = {f in D \( Delta \) : f upright(" has a bounded globally Lipschitz representative") \,\
Delta f in W^(1 \, 2) \( M \)} \,\
"TestV" \( M \) & = {sum_(j = 1)^ell a_j nabla b_j : ell < oo \, med a_j \, b_j in "Test" \( M \)} . $ <eq:test-class>]

For test fields set $\[ X \, Y \] = nabla_X Y - nabla_Y X$, where $nabla$ is the weak Levi–Civita covariant derivative. The curvature functional is

#[#set math.equation(numbering: n => "(1.2)")
 $ R \( X \, Y \, Z \, W \) \( f \) = integral_M & - chevron.l nabla_X \( f W \) \, nabla_Y Z chevron.r - f chevron.l nabla_Y Z \, W chevron.r "div" X\
 & + chevron.l nabla_Y \( f W \) \, nabla_X Z chevron.r + f chevron.l nabla_X Z \, W chevron.r "div" Y\
 & - f chevron.l nabla_(\[ X \, Y \]) Z \, W chevron.r thin upright(d) m . $ <eq:curvature-definition>]

The last derivative means contraction of the weak derivative of $Z$ with $\[ X \, Y \]$. This is the sign convention corresponding to $nabla_X nabla_Y - nabla_Y nabla_X - nabla_(\[ X \, Y \])$. All terms in (1.2) are integrable in the test classes (1.1)–(1.1). No classical curvature tensor is assumed.

#thm([Theorem 1.1.])[
  (Gigli’s characterization).  #emph[Let $n gt.eq 2$ be an integer, let $kappa in bb(R)$, and let $\( M \, d \)$ be a complete separable metric space. The following conditions are equivalent.]
  + #emph[$\( M \, d \)$ is an $n$-dimensional Alexandrov space with curvature bounded below by $kappa$.]
  + #emph[With $m = cal(H)_d^n$, the space $\( M \, d \, m \)$ has full support, is $upright("RCD") \( \( n - 1 \) kappa \, n \)$, and satisfies 
#[#set math.equation(numbering: n => "(1.3)")
 $ R \( X \, Y \, Y \, X \) \( f \) gt.eq kappa integral_M f #scale(x: 120%, y: 120%)[\(] \| X \|^2 \| Y \|^2 - chevron.l X \, Y chevron.r^2 #scale(x: 120%, y: 120%)[\)] thin upright(d) m $ <eq:main-curvature>]

 for every $X \, Y in "TestV" \( M \)$ and every nonnegative $f in "Test" \( M \)$.]
  #emph[The $upright("RCD")$ condition is unreduced, and the test classes and curvature sign are exactly those defined above.]
] <main:equivalence>

=== 1.1 History and significance <history-and-significance>

Lott–Villani and Sturm independently developed synthetic lower Ricci curvature bounds through convexity properties of entropy along Wasserstein geodesics #cite(label("LottVillani2009")) #cite(label("Sturm2006I")) #cite(label("Sturm2006II")). Ambrosio–Gigli–Savaré introduced the $upright("RCD") \( K \, oo \)$ framework, imposing quadratic Cheeger energy to select a Riemannian class #cite(label("AGS2014")). Ambrosio–Gigli–Mondino–Rajala extended the theory to reference measures finite on bounded sets and removed the strengthened entropy condition in the original definition #cite(label("AGMR2015")). These developments supply the ambient Ricci-curvature and Sobolev framework for the sectional-curvature question considered here.

Petrunin and Zhang–Zhu established the connection between Alexandrov lower curvature bounds and the curvature-dimension condition #cite(label("Petrunin2011")) #cite(label("ZhangZhu2010")). The quadratic Sobolev theory of Kuwae–Machigashira–Shioya #cite(label("KMS2001")) supplies the Riemannian structure. The full-scope Alexandrov-to-$upright("RCD")$ statement used below is recorded in #cite(label("KapovitchKettererSturm")) Theorem 2.9 and Corollary 2.10. Gigli subsequently defined (1.2) and conjectured the characterization proved here in dimensions at least two #cite(label("Gigli2019")) Conjecture 1.1. His construction gives tensor symmetries and tensoriality, but does not by itself relate a lower tensor bound to triangle comparison.

Theorem 1 resolves this conjecture positively for every integer $n gt.eq 2$. The exact choice of reference measure is important: the assumption $m = cal(H)^n$ supplies noncollapsed structure, including $n$-dimensional Euclidean tangents almost everywhere #cite(label("DPG2018")). The use of the original test classes is important as well. The theorem is neither a statement about a classical tensor on a regular subset nor a restriction to compactly supported fields.

Optimal transport also gives a characterization of sectional curvature in the smooth setting. Ketterer–Mondino express sectional and intermediate Ricci bounds through entropy inequalities along Wasserstein geodesics supported on lower-dimensional rectifiable sets #cite(label("KettererMondino2018")). The transport calculation here pairs full-dimensional densities with Gigli’s distributional tensor.

Several related developments locate the analytic difficulties. Lebedeva–Petrunin construct a weak curvature tensor for smoothable Alexandrov spaces, using noncollapsing smooth approximations with a common sectional lower bound #cite(label("LebedevaPetrunin2024")). Their weak-limit tensor is a separate framework from the global test-class functional considered here. Brena–Gigli studied measure representations of weak Hessians and curvature tensors, and explained the regularity obstruction in passing from a distributional Hessian bound to convexity #cite(label("BrenaGigli2024")) Remark 2.4 and Remark 2.18. For $C^1$ Riemannian metrics, Erös–Kunzinger–Ohanyan–Vardabasso proved a local distributional-to-Alexandrov comparison result #cite(label("EKOV2026")) Theorem 3.1. The argument here works directly with the Sobolev calculus of a noncollapsed $upright("RCD")$ space.

=== 1.2 The new arguments <the-new-arguments>

Section 3 proves the forward implication. The converse proceeds through the index inequality of Theorem 18, the Hessian comparison of Theorem 40, and the passage to comparison along every geodesic in Section 6.

===== 1.2.1 Integrated configurations. <integrated-configurations.>

Section 3 extracts the curvature functional from small Alexandrov configurations. The expansion is integrated against transported densities. A quantitative first-order estimate for the interpolating density permits pairing with fixed $L^2$ Hessian coefficients. The geometric comparison and the transport expansion bound the same energy difference. Averaging cancels the lower-order terms. Suitable endpoint corrections then identify the remaining coefficient as the curvature term plus a nonnegative square error. Local choices of gradient tests make this error arbitrarily small. Tensoriality, approximation and exhaustion then recover the global test classes in Theorem 5. The calculation uses only the weak derivatives provided by the test calculus.

===== 1.2.2 A heat-regularized index inequality. <a-heat-regularized-index-inequality.>

Section 4 pairs a forward heat factor with a backward heat factor normalized by the prescribed terminal density. Their product solves a continuity equation. The logarithmic potentials yield a Riccati identity, in which the terms containing the inverse viscosity cancel. The remaining acceleration error must be controlled uniformly up to the terminal time, including the singular measure terms in the Bochner inequality. A one-sided estimate supplies this control. An action identity gives strong convergence of the velocities in the density-weighted norm, which is needed for the quadratic index energy.

===== 1.2.3 Frames through exceptional times. <frames-through-exceptional-times.>

Almost-everywhere spatial regularity alone does not give a frame at every time on a path. Section 5 upgrades harmonic splitting maps to frames along almost every relevant entire path. A Hausdorff-content estimate controls the regular points where a countable family of test gradients fails to have full rank. Capacity estimates and bounded-compression path estimates remove the exceptional sets. Deng’s continuity theorem for tangent cones along every geodesic #cite(label("Deng2020")) supplies regularity at all interior times. Caputo–Gigli–Pasqualetto established parallel transport along test plans in the noncollapsed setting #cite(label("CGP2022")). Here finite-dimensional Sobolev ODEs in the selected frames construct and approximate the Jacobi trials needed by the index inequality. Only a countable trial catalog is needed; an integrated density theorem for parallel fields is not assumed.

===== 1.2.4 From Hessian comparison to every geodesic. <from-hessian-comparison-to-every-geodesic.>

Section 6 constructs bounded global modifications of the distance function. Their distributional Hessian bounds fit the general theorem of the companion paper #cite(label("WeakHessianCompanion")) Theorem 1.1, recalled with its exact hypotheses in Theorem 41. That theorem applies to every full-support $upright("RCD") \( K \, N \)$ space with $1 < N < oo$, including collapsed spaces. Its proof uses bounded changes of measure and a closed weighted Bochner inequality; it does not use the characterization or the frame construction of this paper. Applied to the modified distances, it gives the model differential inequality along every minimizing geodesic. A one-dimensional comparison and the local-to-global Alexandrov theorem finish the argument.

Figure 1 summarizes the reverse implication and the point where the companion theorem is used.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.112cm, inset: 0.1058cm, radius: 2pt, stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Global distributional#linebreak()sectional bound]]])])
  content((4.8, 0), [#box(width: 4.112cm, inset: 0.1058cm, radius: 2pt, stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Heat index inequality#linebreak()on fixed terminal paths]]])])
  content((9.6, 0), [#box(width: 4.112cm, inset: 0.1058cm, radius: 2pt, stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Radial Hessian bound#linebreak()as a signed measure]]])])
  content((9.6, -2.1), [#box(width: 4.112cm, inset: 0.1058cm, radius: 2pt, stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Bounded global#linebreak()distance modifications]]])])
  content((4.8, -2.1), [#box(width: 4.112cm, inset: 0.1058cm, radius: 2pt, stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Model ODE along#linebreak()every geodesic]]])])
  content((0, -2.1), [#box(width: 4.112cm, inset: 0.1058cm, radius: 2pt, stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Triangle comparison#linebreak()and global $upright("CBB") ( kappa )$]]])])
  line((2.056, 0), (2.744, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((6.856, 0), (7.544, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((9.6, -0.75), (9.6, -1.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((7.544, -2.1), (6.856, -2.1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((7.2, -3), [#text(size: 7pt)[Theorem~6.1]], anchor: "north", padding: 0.1176cm)
  line((2.744, -2.1), (2.056, -2.1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
})],
  caption: [Figure 1: The reverse implication. The noncollapsed frame and countable trial construction connects the heat index estimate to the radial Hessian bound. The companion theorem supplies the passage to every geodesic after the bounded distance modification and has general finite-dimensional RCD scope. ],
) <fig:proof-route>

The frame and pathwise trial constructions in the first two subsections of Section 5 also have an independent scope. They apply on full-support noncollapsed $upright("RCD") \( K \, n \)$ spaces, with $m = cal(H)^n$ and integer $n gt.eq 2$, to optimal geodesic plans with bounded positions, bounded speed and bounded compression throughout the relevant interval. The approximation is pathwise, using a countable catalog of global trials.

We state the foundational $upright("RCD")$ results in the form used in the proof and give complete arguments for the additional transport, index, frame and distance-comparison steps. The general reweighting argument is supplied by the companion paper #cite(label("WeakHessianCompanion")). Numbered external results refer to the source versions linked in the bibliography; version notes specify differences from published numbering where necessary.

== 2 Calculus and background results <sec:preliminaries>

We collect the analytic conventions and the precise approximation facts used below. Throughout this section $\( M \, d \, m \)$ is an $upright("RCD") \( K \, N \)$ space with $N < oo$, full support, and the usual locally finite reference measure. All the analytic results recalled here also hold under $upright("RCD")^(*) \( K \, N \)$. We use them under the unreduced hypothesis of Theorem 1.

=== 2.1 Test calculus and localization <test-calculus-and-localization>

Besides $"Test"$, defined in (1.1), it is useful to write

$ "Test"^oo \( M \) = { g in "Test" \( M \) : Delta g in L^oo \( M \) } . $

The superscript refers to the additional Laplacian bound; it does not mean classical smoothness. A function is a local test function on an open set if it agrees on every relatively compact smaller open set with a global test function. We write $H_g$ for $"Hess" g$, and identify the covector $H_g \( V \, dot.op \)$ with a vector when using the notation $H_g V$.

The following facts belong to the standard second-order $upright("RCD")$ calculus #cite(label("Gigli2018")) #cite(label("Gigli2019")) #cite(label("Savare2014")). Both test classes are algebras. A test function has an $L^2$ Hessian, and for test fields

$ X in L^2 \( T M \) ∩ L^oo \( T M \) \, #h(2em) nabla X in L^2 \( T^(*) M ⊗ T M \) \, #h(2em) "div" X in L^2 \( m \) . $

The connection is metric-compatible and torsion-free. In particular, inner products of bounded test fields belong to $W^(1 \, 2)$, and their differentials obey the usual product rule. For gradients,

$ nabla_(nabla g) nabla g = nabla #scale(x: 120%, y: 120%)[\(] \| nabla g \|^2 \/ 2 #scale(x: 120%, y: 120%)[\)] . $

The curvature functional (1.2) has the algebraic symmetries of Riemannian curvature and is tensorial over $"Test"$, including

#[#set math.equation(numbering: n => "(2.1)")
 $ R \( X \, Y \, Z \, W \) & = - R \( Y \, X \, Z \, W \) = R \( Z \, W \, X \, Y \) \,\
R \( a X \, Y \, Z \, W \) \( f \) & = R \( X \, Y \, Z \, W \) \( a f \) $ <eq:curvature-symmetries>]

for test functions $a \, f$, with the corresponding identity in every slot #cite(label("Gigli2019")) Proposition 2.7.

#thm([Lemma 2.1.])[
  (Cutoffs and approximation).  #emph[The following approximations are available.]
  + #emph[For a compact set $E$ in an open set $U$, there is $chi in "Test"^oo$ with $0 lt.eq chi lt.eq 1$, equal to one on a neighborhood of $E$, and compactly supported in $U$. There are also exhausting cutoffs $chi_R in "Test"^oo$, equal to one on $B_R \( o \)$, supported in $B_(R + 1) \( o \)$, whose gradient and Laplacian bounds are independent of $R$.]
  + #emph[For $g in D \( Delta \)$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ parallel H_g parallel_2^2 lt.eq parallel Delta g parallel_2^2 + max { - K \, 0 } parallel nabla g parallel_2^2 . $ <eq:pre-hessian-estimate>]

 Compactly supported functions in $"Test"^oo$ form a core for $Delta$.]
  + #emph[On a fixed compact region, a function $g in "Test"$ can be approximated by compactly supported $g_j in "Test"^oo$ with uniformly bounded gradients, with 
$ g_j arrow.r g \, #h(2em) nabla g_j arrow.r nabla g \, #h(2em) Delta g_j arrow.r Delta g \, #h(2em) H_(g_j) arrow.r H_g quad upright("strongly in ") L^2 $

 on that region.]
  + #emph[A compactly supported Lipschitz function $xi$ can be approximated by compactly supported test functions $xi_j$ with a common compact support and a common Lipschitz bound, uniformly and strongly in $W^(1 \, 2)$. If $xi gt.eq 0$, the approximants may be chosen nonnegative.]
] <pre:approximation>

#proof[
  The good-cutoff construction and the integrated Bochner estimate give (i) and (2.2); see #cite(label("GigliTamanini2021")) Appendix A, Lemma A.2 and Equation (A.13). For the local version of the cutoff construction one uses finitely many small good cutoffs inside $U$, and a smooth truncation of their sum. This keeps the Laplacian bounded and Sobolev by the test algebra and chain rules.
  Let $P_t$ denote the heat semigroup. For $h in L^2 ∩ L^oo$, positive-time regularization gives $P_t h in "Test"^oo$ #cite(label("GigliTamanini2021")) Appendix A, Equation (A.7). Spectral calculus and density of bounded $L^2$ data show that these regularizations form a core. For each such regularization $h$,
  $ Delta \( chi_R h \) = chi_R Delta h + h Delta chi_R + 2 chevron.l nabla chi_R \, nabla h chevron.r . $
  The uniform cutoff bounds and the $L^2$ tails imply convergence to $Delta h$ in $L^2$, as well as convergence of the functions and gradients. This proves the compact-core assertion.
  For (iii), choose nested cutoffs $chi \, zeta$ such that $chi = 1$ near the region in question and $zeta = 1$ near $"supp" chi$. Put
  $ g_t = chi P_t \( zeta g \) . $
  The function $zeta g$ lies in $"Test"$. The product rule, spectral continuity and the fixed cutoff bounds give convergence of $g_t$ to $chi zeta g$ in the Laplacian graph norm. The Bakry gradient estimate gives
  $ parallel nabla g_t parallel_oo lt.eq parallel chi parallel_oo e^(- K t) parallel nabla \( zeta g \) parallel_oo + parallel nabla chi parallel_oo parallel zeta g parallel_oo . $
  Apply (2.2) to $g_t - chi zeta g$ to obtain strong Hessian convergence. Since $chi zeta g = g$ near the region, (iii) follows.
  For (iv), use $xi_t = chi P_t xi$, with an outer cutoff $chi = 1$ near $"supp" xi$. The heat semigroup converges strongly in $W^(1 \, 2)$; the uniform Lipschitz estimate and the small-time heat-kernel moment bound give uniform convergence on the common compact support. The cutoff product gives the same conclusions for $xi_t$, and positivity is preserved. ◻
]

#prodef([Remark 2.2.])[
  A compactly supported test gradient is a member of the global $"TestV"$: multiply it by a test cutoff equal to one near its support. This observation is necessary when $m \( M \) = oo$, because the constant function one then need not lie in $"Test"$. All uses of a bare test gradient below are local in this sense.
] <pre:bare-gradients>

#thm([Lemma 2.3.])[
  (Lipschitz weights and continuity of the tensor).  #emph[For fixed test fields the formula (1.2) defines a functional on compactly supported Lipschitz weights. It has the form 
$ f mapsto integral f A + chevron.l nabla f \, B chevron.r thin upright(d) m \, #h(2em) A in L_(upright("loc"))^1 \( m \) \, quad B in L_(upright("loc"))^2 \( T M \) . $

 It is continuous under the weight approximation in Lemma 2(iv). More generally, for weights with a common compact support, uniform convergence of the weights and weak $L^2$ convergence of their gradients suffice. The tensor identities remain valid for these weights. Moreover, on a fixed compact set the functional is continuous under uniformly bounded field approximations for which the fields, their divergences and their covariant derivatives converge strongly in $L^2$, with the fields converging almost everywhere along a subsequence.]
] <pre:tensor-continuity>

#proof[
  Expand $nabla_X \( f W \) = X \( f \) W + f nabla_X W$. Every coefficient of $f$ is a product of two $L^2$ factors and bounded factors. The coefficients of $nabla f$ lie in $L^2$. Uniform convergence of $f_j$ pairs with the fixed $L^1$ coefficient, and weak $L^2$ convergence of their gradients pairs with the fixed $L^2$ coefficient. This proves the weight-continuity assertions. Approximation then extends the identities.
  For the field assertion,
  $ nabla_(X_j) Y_j - nabla_X Y = \( nabla Y_j - nabla Y \) \( X_j \) + nabla Y \( X_j - X \) . $
  The first term tends to zero in $L^2$ by uniform boundedness of $X_j$; the second does so by dominated convergence. The brackets therefore converge in $L^2$ as well. Products of the resulting strongly convergent $L^2$ quantities converge in $L^1$. Any remaining uniformly bounded field factor is handled by almost-everywhere convergence and domination. This includes the last term of (1.2). ◻
]

=== 2.2 Weak Hessians and Bochner measures <weak-hessians-and-bochner-measures>

For $F in W_(upright("loc"))^(1 \, 2) \( M \)$, a compact test gradient $Y = nabla g$, and a compactly supported Lipschitz weight $xi$, define

#[#set math.equation(numbering: n => "(2.3)")
 $ H_F \( Y \, Y \) \( xi \) = - integral_M "div" \( xi Y \) thin chevron.l nabla F \, Y chevron.r thin upright(d) m - integral_M xi thin chevron.l nabla F \, nabla_Y Y chevron.r thin upright(d) m . $ <eq:weak-hessian>]

Polarization defines the mixed evaluation. The two terms are integrable: $nabla F$, $"div" \( xi Y \)$ and $nabla_Y Y$ are locally $L^2$, and $Y \, xi$ are bounded. For fixed $Y \, xi$, the functional is continuous under weak local $W^(1 \, 2)$ convergence of $F$. When $F in D \( Delta \)$, this agrees with the usual $L^2$ Hessian. A statement $H_F \( Y \, Y \) lt.eq A thin m$ means the corresponding inequality on every nonnegative compact Lipschitz weight. It does not presuppose that $H_F$ is an $L^2$ tensor.

For a local test function $g$, the measure-valued Bochner inequalities are

#[#set math.equation(numbering: n => "(2.4)")
 $ Gamma_2 \( g \) & := Delta #scale(x: 120%, y: 120%)[\(] \| nabla g \|^2 \/ 2 #scale(x: 120%, y: 120%)[\)] - chevron.l nabla g \, nabla Delta g chevron.r m gt.eq #scale(x: 120%, y: 120%)[\(] K \| nabla g \|^2 + \| H_g \|^2 #scale(x: 120%, y: 120%)[\)] m \,\
Gamma_2 \( g \) & gt.eq #scale(x: 120%, y: 120%)[\(] K \| nabla g \|^2 + \( Delta g \)^2 \/ N #scale(x: 120%, y: 120%)[\)] m . $ <eq:bochner-hessian>]

Here the first Laplacian is a measure-valued Laplacian. We use the two inequalities separately or after taking a convex combination; no inequality with the sum of both squared terms and coefficient one is asserted. Our capacity normalization is

$ "Cap"_2 \( E \) = inf_(U supset E\
U med upright("open")) med inf_(v in W^(1 \, 2) \( M \)\
v gt.eq 1 med m upright("-a.e. on ") U) integral_M #scale(x: 120%, y: 120%)[\(] v^2 + \| nabla v \|^2 #scale(x: 120%, y: 120%)[\)] thin upright(d) m . $

A polar set has zero $2$-capacity; #emph[quasi-everywhere] means outside a polar set. The Bochner measures do not charge sets of zero $2$-capacity. Their Sobolev multipliers are evaluated using quasi-continuous representatives #cite(label("Savare2014")) Sections 2.3 and 3.2.

More explicitly, if bounded Sobolev multipliers converge strongly in $W^(1 \, 2)$, with a common bound and compact support, a subsequence converges outside a polar set. Dominated convergence therefore applies to their integrals against each fixed local Bochner measure. This extends the integration-by-parts identities from test multipliers to bounded Sobolev multipliers. The same argument shows that an almost-everywhere lower bound for a Sobolev multiplier holds for its quasi-continuous representative outside a polar set. These facts will be used when multiplying singular Bochner measures in Section 4.

The inequalities (2.4)–(2.4) also hold for our original test class, without a bounded Laplacian. One can see the extension locally by applying heat regularization to a test function. The gradients remain uniformly bounded, the Hessians converge strongly in $L^2$, and $nabla Delta P_t g arrow.r nabla Delta g$ in $L^2$. The local masses of the positive Bochner remainders are bounded by testing with a fixed outer cutoff. Passage to the distributional limit gives the asserted measure inequalities.

=== 2.3 Geometry, transport and along-curve calculus <geometry-transport-and-along-curve-calculus>

We use the following established facts, stating the restrictions that are relevant to the proof.

+ A finite-dimensional full-support $upright("RCD")$ space is proper and geodesic, is locally doubling, and satisfies a local $L^2$ Poincaré inequality and the Sobolev-to-Lipschitz property. Bounded sets have finite measure. When the dimension parameter is $N = n$ and $m = cal(H)^n$, almost every point is $n$-regular and the tangent module has dimension $n$ almost everywhere. For every bounded region and every fixed sufficiently small upper radius,
  #[#set math.equation(numbering: n => "(2.5)")
   $ c thin r^n lt.eq m \( B_r \( x \) \) lt.eq C thin r^n $ <eq:local-volume>]
  with positive constants uniform for centers in that region. The upper bound is the noncollapsed density bound; the lower bound follows from Bishop–Gromov and full support #cite(label("DPG2018")) Theorem 1.12 and Corollary 2.14.
+ Optimal quadratic transport between probability measures $mu \, nu in cal(P)_2 \( M \)$, with $mu lt.double m$, is induced by a unique dynamical map. For a fixed real-valued $c$-concave potential, $c = d^2 \/ 2$, the geodesic from almost every point into its $c$-superdifferential is unique #cite(label("GigliRajalaSturm2016")) Theorems 1.1 and 1.3. Between bounded densities with bounded support, the interpolating densities are uniformly bounded and obey the pointwise curvature-dimension distortion inequality. We use the density bound also on subintervals with a singular endpoint, whenever a separate positive-time compression estimate has been proved. We do not assume bounded compression at a Dirac endpoint.
+ A bounded-speed plan with bounded compression is a Sobolev test plan. For a Sobolev function $g$, its time derivative is $chevron.l nabla g \, v chevron.r$, where $v$ is the plan velocity #cite(label("GigliDifferentialStructure")) Theorem/Definition 2.33. For a $W_2$-continuous curve with bounded compression, the Sobolev continuity equation characterizes $2$-absolute continuity and its action, and such curves have a superposition by absolutely continuous metric paths #cite(label("GigliHan2015")) Theorem 3.5 and Proposition 2.1. The required $W_2$-continuity is verified before using this criterion in Section 4.
+ For a bounded-support optimal geodesic test plan, Gigli–Tamanini’s second-order differentiation formula applies to $H^(2 \, 2)$ functions and to vector-field pairings with $H_C^(1 \, 2) \( T M \)$, the closure of $"TestV" \( M \)$ in the covariant Sobolev norm #cite(label("GigliTamanini2021")) Theorem 5.13. Every vector field to which we apply this theorem is a compactly supported test field. It also applies after bounded measurable restriction of the plan. This permits passage from integrated identities to almost-sure time-distributional identities.
+ A compactly supported time-dependent test vector field, bounded with bounded divergence and integrable Sobolev covariant derivative, has the regular Lagrangian flow and uniqueness properties used for the short flows below #cite(label("AmbrosioTrevisan2014")) Sections 8 and 9.6. The compression estimate is the exponential of the integrated negative-divergence bound. The corresponding backward flow gives the inverse estimate. These are Sobolev flows; no spatial Lipschitz bound on the vector field is assumed.

The more specialized harmonic splitting, tangent-continuity, heat-kernel and variable-curvature theorems are stated at their points of use. For the geometric implication from (A) to the metric-measure part of (B), we use the Alexandrov curvature-dimension and infinitesimal Hilbertianity results #cite(label("Petrunin2011")) #cite(label("ZhangZhu2010")) #cite(label("KMS2001")). The unreduced statement for all curvature bounds, including Alexandrov spaces with boundary, is recorded in #cite(label("KapovitchKettererSturm")) Theorem 2.9 and Corollary 2.10. For the converse we use unreduced $upright("CD")$ as a hypothesis; invoking analytic results written with $upright("RCD")^(*)$ consequently changes neither $K$ nor $N$.

== 3 From Alexandrov comparison to the tensor bound <sec:forward>

#thm([Theorem 3.1.])[
  #emph[Let $\( M \, d \)$ be a complete $n$-dimensional Alexandrov space with curvature bounded below by $kappa$, where $n gt.eq 2$, and put $m = cal(H)_d^n$. Then $\( M \, d \, m \)$ is $upright("RCD") \( \( n - 1 \) kappa \, n \)$, its measure has full support, and 
#[#set math.equation(numbering: n => "(3.1)")
 $ R \( X \, Y \, Y \, X \) \( f \) gt.eq kappa integral f #scale(x: 120%, y: 120%)[\(] \| X \|^2 \| Y \|^2 - chevron.l X \, Y chevron.r^2 #scale(x: 120%, y: 120%)[\)] thin upright(d) m $ <fwd:target>]

 for every nonnegative $f in "Test" \( M \)$ and every $X \, Y in "TestV" \( M \)$, with the global test classes and curvature convention of Theorem 1.]
] <fwd:curvature>

The curvature-dimension and full-support assertions follow from the Alexandrov-to-$upright("CD")$ theorem and infinitesimal Hilbertianity #cite(label("Petrunin2011")) #cite(label("ZhangZhu2010")) #cite(label("KMS2001")). The unreduced statement for arbitrary $kappa$, including complete Alexandrov spaces with boundary, is recorded directly in #cite(label("KapovitchKettererSturm")) Theorem 2.9 and Corollary 2.10; it requires only local finiteness of $cal(H)^n$, with no compactness or assumption of finite total mass. Set $K = \( n - 1 \) kappa$. We shall use the resulting RCD calculus throughout this section. In particular, all covariant derivatives below are weak covariant derivatives. To prove the tensor inequality, we compare two energies associated with short flows in finitely many gradient directions: the action of the radial flows and the optimal transport action between their endpoint measures. Alexandrov comparison bounds twice the averaged radial action minus the averaged pair action from below. For the upper bound, a dual transport calculation first produces an error measuring radial acceleration. Second-order endpoint corrections remove that error, after which averaging identifies the upper bound as curvature plus a nonnegative square. Sobolev dual potentials chosen separately on finitely many localization pieces make this remaining square arbitrarily small. Positivity and tensoriality then extend the resulting gradient inequality to test coefficients; local approximation and exhaustion recover the global test classes. The successive limits are specified in Remark 17.

=== 3.1 Conventions and a short-flow expansion <conventions-and-a-short-flow-expansion>

All unlabelled spatial integrals in this section are with respect to $m$. Write

$ \| U and V \|^2 := \| U \|^2 \| V \|^2 - chevron.l U \, V chevron.r^2 . $

$ cal(G) := { nabla u : u in "Test" \( M \) \, med "supp" u upright(" compact") \, med Delta u in L^oo \( M \) } . $

Every member of $cal(G)$ is bounded, has bounded divergence, and has covariant derivative in $L^2$. It belongs to the global $"TestV" \( M \)$ by Remark 3. Throughout we use the stronger test cutoffs of Lemma 2(i).

For compactly supported Lipschitz $f$, we use $R \( X \, Y \, Z \, W \) \( f \)$ to denote the same integrated expression as in the statement, even when $f in.not "Test" \( M \)$. Lemma 4 gives this extension, its tensor identities, and continuity for weights with common compact support that converge uniformly with weakly convergent $L^2$ gradients.

We choose a finite probability law on compact test potentials with bounded Laplacian, invariant under $u mapsto - u$. Let $A = nabla u_A$ and $B = nabla u_B$ be independent choices from this law. The notation $bb(E)$ always refers to this finite averaging. The example to keep in mind is the uniform law giving the four fields $U \, - U \, V \, - V$, with $U \, V in cal(G)$. Sign symmetry will cancel the odd terms in the energy expansion, while the mixed pairs retain the sectional-curvature expression for $U \, V$. We work with a general finite law because the calculation uses only independence and sign symmetry. In particular,

#[#set math.equation(numbering: n => "(3.2)")
 $ bb(E) u_A = 0 \, #h(2em) bb(E) A = 0 \, #h(2em) bb(E) \| A - B \|^2 = 2 bb(E) \| A \|^2 . $ <fwd:centering>]

For a fixed compactly supported Lipschitz function $f gt.eq 0$, and a constant linear combination $C$ of the chosen gradients, put

$ L_C := - "div" \( f C \) = - chevron.l nabla f \, C chevron.r - f "div" C . $

This is a bounded function with compact support. The case $integral f = 0$ is trivial, so we may assume that $integral f > 0$.

For each choice of $A$, let $S_A$ be a bounded compact test field with bounded divergence. These fields provide the second-order endpoint corrections: the acceleration of the leading gradient flow is $nabla_A A$, so they will approach $- nabla_A A$ only after the limit in $h$. For $0 < h < 1$, let $F_(r \, A)^h$, $0 lt.eq r lt.eq 1$, be the regular Lagrangian flow of

#[#set math.equation(numbering: n => "(3.3)")
 $ b_(r \, A)^h = h A + h^2 r S_A . $ <fwd:prescribed-velocity>]

Denote its transported density and endpoint measure by

$ \( F_(r \, A)^h \)_(\#) \( f m \) = rho_(r \, A)^h m \, #h(2em) rho_A^h := rho_(1 \, A)^h \, #h(2em) mu_A^h := rho_A^h m . $

All statements as $h arrow.b 0$ initially keep the finite family, the weight, and the fields $S_A$ fixed.

#thm([Lemma 3.2.])[
  (Short-flow density expansion).  #emph[The flows above exist and are invertible modulo null sets. Their forward and inverse compression constants are $1 + O \( h \)$, their displacements are $O \( h \)$, and their transported densities have support in a common compact set. Uniformly in $r in \[ 0 \, 1 \]$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ parallel rho_(r \, A)^h - f parallel_(L^oo) = O \( h \) . $ <fwd:flow-density-bound>]

 Moreover, 
#[#set math.equation(numbering: n => "(3.5)")
 $ frac(rho_(r \, A)^h - f, h) harpoon.rt^(*) r L_A $ <fwd:flow-first>]

 in $L^oo$ on the common bounded support, both at each fixed $r$ and on $\[ 0 \, 1 \] times M$. For every fixed $q in W^(1 \, 2) \( M \)$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ integral q rho_A^h = integral q f + h integral q L_A + h^2 / 2 integral chevron.l nabla q \, f S_A + L_A A chevron.r + o \( h^2 \) . $ <fwd:flow-second>]

 If $g$ is Lipschitz on a neighborhood of the common support, then 
#[#set math.equation(numbering: n => "(3.7)")
 $ frac(g \( F_(1 \, A)^h \( z \) \) - g \( z \), h) arrow.r d g \( A \) \( z \) quad upright("in ") L^1 \( f m \) . $ <fwd:increment>]

]
] <fwd:flow>

#proof[
  The fields in (3.3) are bounded, have $L^2$ covariant derivative and bounded divergence, and have support in a fixed compact set. The Sobolev flow theorem applies #cite(label("AmbrosioTrevisan2014")) Theorems 4.3, 5.4, 6.7 and 8.3; Section 9.6. Applying it also to the time-reversed field, and using uniqueness, gives the inverse flow. The divergence bound is $O \( h \)$, so both compression constants are $1 + O \( h \)$. The speed is bounded by $h parallel A parallel_oo + h^2 parallel S_A parallel_oo$, which gives the displacement and support assertions. Properness is used here to replace bounded closed neighborhoods by compact sets.
  To check (3.4), the pushforward of $m$ under the flow has density between $1 - O \( h \)$ and $1 + O \( h \)$, by the forward and inverse compression bounds. Replacing $f \( z \)$ by $f \( F_(r \, A)^h \( z \) \)$ in the pushforward changes the density by at most $O \( h \) "Lip" \( f \)$, again by compression and the displacement bound. Multiplication of the pushed-forward reference density by $f$ changes it from $f$ by at most $O \( h \) parallel f parallel_oo$. This proves (3.4) without requiring a spatially Lipschitz velocity field.
  The continuity equation, tested with $q in W^(1 \, 2)$, reads
  #[#set math.equation(numbering: n => "(3.8)")
   $ integral q \( rho_(r \, A)^h - f \) = integral_0^r integral chevron.l nabla q \, h A + h^2 t S_A chevron.r rho_(t \, A)^h thin upright(d) t . $ <fwd:flow-ce>]
  All pairings are finite because the densities are bounded and have bounded support. Divide by $h$ and use (3.4). The right-hand side converges, uniformly in $r$, to $r integral f chevron.l nabla q \, A chevron.r = r integral q L_A$. The uniform $L^oo$ bound on the left quotient, followed by density of compact Lipschitz functions in $L^1$ on bounded sets, proves (3.5), also in space-time. Use (3.8) once more, with $r = 1$, to obtain
  $ integral q \( rho_A^h - f \) =  & h integral f chevron.l nabla q \, A chevron.r + h^2 integral_0^1 integral ⟨nabla q \, frac(rho_(r \, A)^h - f, h) A + r rho_(r \, A)^h S_A⟩ thin upright(d) r . $
  The functions paired with the normalized density difference are fixed and integrable on its support. Equation (3.5) therefore gives (3.6).
  For completeness, if $v in L^1$ on a common bounded neighborhood, then
  $ v compose F_(r \, A)^h arrow.r v quad upright("in ") L^1 \( thin upright(d) r thin f m \) . $
  Indeed this holds for continuous functions by the displacement bound, and follows for $L^1$ functions by approximation and the uniform compression bound. Differentiation of a Lipschitz function along the flow gives
  $ frac(g \( F_(1 \, A)^h \( z \) \) - g \( z \), h) = integral_0^1 d g \( A \) \( F_(r \, A)^h \( z \) \) thin upright(d) r + h integral_0^1 r thin d g \( S_A \) \( F_(r \, A)^h \( z \) \) thin upright(d) r . $
  The preceding composition convergence proves (3.7). A cutoff may be inserted when $g$ is only locally Lipschitz. ◻
]

=== 3.2 The configuration comparison <the-configuration-comparison>

If $mu \, nu$ are finite nonnegative measures of equal mass, define their transport energy by

$ J \( mu \, nu \) := 1 / 2 inf_(gamma in Pi \( mu \, nu \)) integral d \( x \, y \)^2 thin upright(d) gamma \( x \, y \) . $

This is the usual half squared Wasserstein distance after probability normalization, multiplied by the common mass. Let

$ J_(A B)^h := J \( mu_A^h \, mu_B^h \) \, #h(2em) J_(0 A)^h := 1 / 2 integral_0^1 integral \| h A + h^2 r S_A \|^2 rho_(r \, A)^h thin upright(d) r . $

The second quantity is the energy of the prescribed radial flow, not its optimal transport energy.

#thm([Lemma 3.3.])[
  (Fourth-order configuration inequality).  #emph[For the above centered finite law and flows, put 
$ a_A^h \( z \) := d \( z \, F_(1 \, A)^h \( z \) \) \, #h(2em) e_(A B)^h \( z \) := d \( F_(1 \, A)^h \( z \) \, F_(1 \, B)^h \( z \) \) . $

 Then 
#[#set math.equation(numbering: n => "(3.9)")
 $ a_A^h / h arrow.r \| A \| \, #h(2em) e_(A B)^h / h arrow.r \| A - B \| $ <fwd:distance-first>]

 in measure and in every finite $L^p \( f m \)$, for each choice of $A \, B$. Furthermore, 
#[#set math.equation(numbering: n => "(3.10)")
 $ liminf_(h arrow.b 0) frac(2 bb(E) J_(0 A)^h - bb(E) J_(A B)^h, h^4) gt.eq kappa / 6 integral f thin bb(E) \| A and B \|^2 . $ <fwd:energy-comparison>]

]
] <fwd:configuration>

#proof[
  At $m$-almost every base point $z$, the Alexandrov tangent cone is Euclidean. Choose a geodesic from $z$ to each endpoint $F_(1 \, A)^h \( z \)$. For the finite weights $p_A$, the radial vectors $v_A in T_z M$ satisfy
  $ sum_(A \, B) p_A p_B \| v_A \| \| v_B \| cos angle \( v_A \, v_B \) = lr(|sum_A p_A v_A|)^2 gt.eq 0 . $
  Actual angles are at least the corresponding $kappa$-comparison angles. Consequently,
  #[#set math.equation(numbering: n => "(3.11)")
   $ bb(E) #h(-0.16667em) [a_A^h a_B^h cos tilde(angle)_kappa \( a_A^h \, a_B^h \, e_(A B)^h \)] gt.eq 0 . $ <fwd:cosine-sum>]
  Zero radial lengths contribute zero. All sides are $O \( h \)$, so the model triangles are defined for sufficiently small $h$, including when $kappa > 0$.
  For radial side lengths $a \, b$ and opposite side length $e$, put $z_0 = \( a^2 + b^2 - e^2 \) \/ 2$. The model cosine law gives, uniformly for such small triangles,
  #[#set math.equation(numbering: n => "(3.12)")
   $ a b cos tilde(angle)_kappa = z_0 - kappa / 6 \( a^2 b^2 - z_0^2 \) + O \( h^6 \) . $ <fwd:model-expansion>]
  For $kappa = 0$ this is exact without the correction. For $kappa eq.not 0$, substitute the Taylor series of the model sine and cosine into their cosine law. After multiplication by $a b$, the denominators are the nonvanishing analytic factors $frak(s)_kappa \( a \) \/ a$ and $frak(s)_kappa \( b \) \/ b$, where $frak(s)''_kappa + kappa frak(s)_kappa = 0$, $frak(s)_kappa \( 0 \) = 0$, and $frak(s)'_kappa \( 0 \) = 1$. This also proves uniformity at degenerate triangles and zero sides.
  We first identify the leading distances. By integration of the speed and the composition convergence used in Lemma 6,
  $ (a_A^h / h - \| A \|)_(+) arrow.r 0 quad upright("in ") L^1 \( f m \) . $
  There is a countable collection of scalar $1$-Lipschitz functions whose differentials norm every tangent vector almost everywhere; one may use the norming family in #cite(label("AmbrosioTrevisan2014")) Lemma 9.2, with local cutoffs when needed. For each member $g$, (3.7) and its difference for two flows give the lower bounds
  $ a_A^h \/ h gt.eq \| g \( F_(1 \, A)^h \) - g \| \/ h \, #h(2em) e_(A B)^h \/ h gt.eq \| g \( F_(1 \, A)^h \) - g \( F_(1 \, B)^h \) \| \/ h . $
  First taking a finite part of the norming family, and then increasing it, shows that the negative parts of $a_A^h \/ h - \| A \|$ and $e_(A B)^h \/ h - \| A - B \|$ tend to zero in measure. The radial convergence follows. All scaled distances are uniformly bounded, so this convergence also holds in every finite $L^p \( f m \)$.
  Equations (3.11)–(3.12), initially retaining only their quadratic terms, imply
  $ bb(E) integral f \( e_(A B)^h \/ h \)^2 lt.eq 2 bb(E) integral f \( a_A^h \/ h \)^2 + O \( h^2 \) arrow.r 2 bb(E) integral f \| A \|^2 . $
  By (3.2), the last quantity is $bb(E) integral f \| A - B \|^2$. The pair-distance lower bounds already proved imply convergence of the negative errors in $L^1$. The displayed upper bound therefore forces the positive errors to converge in $L^1$ as well. Since the family is finite, this proves the pair convergence in (3.9) for every pair of positive probability.
  We may now retain the quartic term in (3.12). The convergence just proved gives
  $ h^(- 4) (\( a_A^h a_B^h \)^2 - (frac(\( a_A^h \)^2 + \( a_B^h \)^2 - \( e_(A B)^h \)^2, 2))^2) arrow.r \| A and B \|^2 $
  in $L^1 \( f m \)$. Thus
  #[#set math.equation(numbering: n => "(3.13)")
   $ liminf_(h arrow.b 0) 1 / h^4 (bb(E) integral f \( a_A^h \)^2 - 1 / 2 bb(E) integral f \( e_(A B)^h \)^2) gt.eq kappa / 6 integral f thin bb(E) \| A and B \|^2 . $ <fwd:distance-fourth>]
  The radial energy dominates half the squared radial displacement, and $\( F_(1 \, A)^h \, F_(1 \, B)^h \)_(\#) \( f m \)$ is a coupling of the endpoint measures. Hence
  $ 2 J_(0 A)^h gt.eq integral f \( a_A^h \)^2 \, #h(2em) J_(A B)^h lt.eq 1 / 2 integral f \( e_(A B)^h \)^2 . $
  Their combination with (3.13) proves (3.10). ◻
]

=== 3.3 First variation of the optimal interpolation densities <first-variation-of-the-optimal-interpolation-densities>

The transport expansion will pair the first density variation with fixed $L^2$ Hessian coefficients. We therefore need an $O \( h \)$ bound in $L^2$, as well as identification of the weak limit. For the next lemma, assume that $f$ is semiconcave with some finite constant along geodesics in a bounded region containing all the interpolations under consideration. No bound for that constant is required uniformly over later approximations of $f$. Let $sigma_s^h m$, $0 lt.eq s lt.eq 1$, be the optimal interpolation from $mu_A^h$ to $mu_B^h$, and let $v_s^h$ be its minimal continuity-equation velocity. Thus

$ 2 J_(A B)^h = integral_0^1 integral sigma_s^h \| v_s^h \|^2 thin upright(d) s . $

Existence, uniqueness, and bounded densities are used in their usual finite-dimensional RCD form #cite(label("GigliRajalaSturm2016")) #cite(label("Rajala2012")). We derive the needed pointwise distortion inequality from integrated $upright("CD")$ by restriction below.

#thm([Lemma 3.4.])[
  (Optimal density first variation).  #emph[Put $D = B - A$ and $C_s = \( 1 - s \) A + s B$. The densities $sigma_s^h$ have common compact support and a uniform $L^oo$ bound. They satisfy 
#[#set math.equation(numbering: n => "(3.14)")
 $ sup_(0 lt.eq s lt.eq 1) parallel sigma_s^h - f parallel_(L^2)^2 = O \( h^2 \) \, #h(2em) frac(sigma_s^h - f, h) harpoon.rt L_(C_s) quad upright("in ") L^2 \( thin upright(d) s thin upright(d) m \) . $ <fwd:density-bound>]

 Their velocities satisfy 
#[#set math.equation(numbering: n => "(3.15)")
 $ integral_0^1 integral sigma_s^h \| v_s^h \/ h - D \|^2 thin upright(d) s arrow.r 0 . $ <fwd:velocity-first>]

]
] <fwd:density>

#proof[
  #emph[Restriction of the plan.] The endpoints have uniformly bounded densities and support in a common ball. All connecting geodesics lie in a larger fixed ball, which is compact. The standard interpolation bound gives the uniform density estimate. We record a sharper consequence needed below. Weaken the Ricci parameter to a fixed $K' < 0$. The zero-mass case is immediate; otherwise let $pi^h$ be the optimal dynamical plan and normalize it to a probability $pi$, with marginals $r_t m$. By #cite(label("GigliRajalaSturm2016")) Theorem 1.1, $pi$ has a Borel conull set on which every evaluation $e_t$, $t < 1$, is injective. Both endpoints are absolutely continuous. Applying the same theorem to the reversed plan, pulling its conull set back under time reversal, and intersecting with the first set gives a Borel conull $Gamma$ on which $e_t$ is injective for every $t in \[ 0 \, 1 \]$.
  Fix $s in \( 0 \, 1 \)$, and let $H gt.eq 0$ be bounded Borel on $Gamma$, with $Z = integral H thin upright(d) pi > 0$. The probability $pi_H = \( H \/ Z \) pi$ is optimal for its endpoint marginals: after scaling $H lt.eq 1$, a cheaper transport for $H pi$ could be spliced with $pi - H pi$, contradicting optimality. Its endpoint densities are bounded and absolutely continuous. The integrated $upright("CD") \( K' \, n \)$ inequality supplies an optimal dynamical plan for these marginals, and uniqueness forces that plan to be $pi_H$. The measurable inverses of $e_t \|_Gamma$ give, by Lusin–Souslin,
  $ h_t = H compose \( e_t \|_Gamma \)^(- 1) \, #h(2em) r_t^H = \( h_t \/ Z \) r_t \, #h(2em) t in { 0 \, s \, 1 } \, $
  where $h_t$ is extended by zero off $e_t Gamma$. Write $beta_t \( ell \) = tau_(K' \, n)^(\( t \)) \( ell \)$ for the unreduced distortion coefficient and set
  $ F_s \( gamma \) = r_s \( gamma_s \)^(- 1 \/ n) - beta_(1 - s) \( ell \) r_0 \( gamma_0 \)^(- 1 \/ n) - beta_s \( ell \) r_1 \( gamma_1 \)^(- 1 \/ n) . $
  The integrated inequality for $pi_H$, after cancellation of $Z^(1 \/ n - 1)$, is exactly
  $ integral H^(1 - 1 \/ n) F_s thin upright(d) pi gt.eq 0 . $
  There are no undefined inverse powers in this calculation: zero or infinite density values lie over marginal-null sets at the three fixed times, and on the common finite-measure compact support $Q$,
  $ integral r_t \( gamma_t \)^(- 1 \/ n) thin upright(d) pi = integral_Q r_t^(1 - 1 \/ n) thin upright(d) m < oo . $
  Taking $H$ to be indicators of Borel sets proves $F_s gt.eq 0$ $pi$-almost everywhere. Restoring the common mass preserves this homogeneous inequality. Its exceptional set may depend on $s$; every fixed-time estimate below has the same constants, which suffices for the supremum over $s$. Jointly Borel density versions and Fubini give the corresponding $thin upright(d) s ⊗ pi$-almost-everywhere statements for time integrals.
  #emph[The density norm bound.] On the bounded range of possible geodesic lengths $ell$, the pointwise CD distortion coefficients, divided by their zero-curvature coefficients, have a positive lower bound and are at least $1 - C ell^2$, uniformly in $s$. The negative power mean is at most the arithmetic mean. Since the endpoint densities are bounded, the pointwise CD inequality therefore implies, along the optimal dynamical plan $pi^h$,
  #[#set math.equation(numbering: n => "(3.16)")
   $ sigma_s^h \( gamma_s \) lt.eq \( 1 - s \) rho_A^h \( gamma_0 \) + s rho_B^h \( gamma_1 \) + C ell \( gamma \)^2 . $ <fwd:pointwise-density>]
  To see that the error remains valid when $ell$ is not small, let $a \( ell \)$ be a common positive lower bound for the two distortion ratios. The CD inequality first gives the negative power mean multiplied by $a \( ell \)^(- n)$. On the fixed length interval, $a \( ell \)^(- n) - 1 lt.eq C ell^2$. This proves (3.16), including such lengths.
  Integration against $pi^h$ gives
  $ integral \( sigma_s^h \)^2 lt.eq \( 1 - s \) integral \( rho_A^h \)^2 + s integral \( rho_B^h \)^2 + C integral ell^2 thin upright(d) pi^h . $
  Semiconcavity of $f$ gives
  $ - 2 integral f sigma_s^h lt.eq - 2 \( 1 - s \) integral f rho_A^h - 2 s integral f rho_B^h + C integral ell^2 thin upright(d) pi^h . $
  Here $integral ell^2 thin upright(d) pi^h = 2 J_(A B)^h = O \( h^2 \)$, by the configuration coupling. Adding the last two inequalities and $integral f^2$ proves the norm bound in (3.14), using (3.4) for the endpoints.
  #emph[First variations of velocity and density.] The same coupling and (3.9) imply
  $ limsup_(h arrow.b 0) integral_0^1 integral sigma_s^h \| v_s^h \/ h \|^2 thin upright(d) s lt.eq integral f \| D \|^2 . $
  The continuity equation tested with $u_B - u_A$, and then (3.6), gives
  $ integral_0^1 integral sigma_s^h chevron.l v_s^h \/ h \, D chevron.r thin upright(d) s = 1 / h integral \( u_B - u_A \) \( rho_B^h - rho_A^h \) arrow.r integral f \| D \|^2 . $
  The norm estimate for the densities also gives $integral_0^1 integral sigma_s^h \| D \|^2 thin upright(d) s arrow.r integral f \| D \|^2$. Expanding the square proves (3.15).
  Finally, for any fixed $q in W^(1 \, 2) \( M \)$,
  $ integral q frac(sigma_s^h - f, h) = integral q frac(rho_A^h - f, h) + integral_0^s integral sigma_t^h chevron.l nabla q \, v_t^h \/ h chevron.r thin upright(d) t . $
  The first term converges to $integral q L_A$. In the second, use (3.15) and Cauchy–Schwarz to replace $v_t^h \/ h$ by $D$; then use the density norm bound to replace $sigma_t^h$ by $f$. The error tends to zero uniformly in $s$. The limit is $s integral f chevron.l nabla q \, D chevron.r = s integral q L_D$. Boundedness of the normalized density differences in $L^2 \( thin upright(d) s thin upright(d) m \)$, and density of finite sums of separated space-time test functions, prove the weak convergence in (3.14). ◻
]

=== 3.4 The fourth-order transport estimate <the-fourth-order-transport-estimate>

The configuration comparison gives a lower bound for $2 bb(E) J_(0 A)^h - bb(E) J_(A B)^h$. We now obtain an upper bound for the same difference in terms of curvature and a nonnegative square, which the following subsection removes by localization.

Continue to assume that $f$ is semiconcave as above, keeping the successive limits of Remark 17. For each ordered pair $A \, B$, choose an arbitrary fixed $q_(A B) in W^(1 \, 2) \( M \)$. The choices need not have any symmetry. These are dual energy tests. After extending the error estimate to Lipschitz weights, we will choose their gradients on finitely many localization pieces to approximate $- nabla_A \( B - A \)$ and remove the remaining square. Each potential is held fixed during the short-flow limit. For the duration of a calculation with this pair write

$ D = B - A \, #h(2em) C_s = \( 1 - s \) A + s B \, #h(2em) T_D = nabla_D D \, $

$ q_s = q_(A B) - s frac(\| D \|^2, 2) \, #h(2em) Q_s = nabla q_s = nabla q_(A B) - s T_D . $

The identity for $Q_s$ follows from Hessian symmetry, since $D$ is a gradient. Notice that $T_D in L^2$ and that $\| D \|^2 \/ 2 in W^(1 \, 2)$. No Hessian of $q_(A B)$ is required.

#thm([Lemma 3.5.])[
  (Dual expansion and radial defect).  #emph[With the preceding notation, 
#[#set math.equation(numbering: n => "(3.17)")
 $ J_(A B)^h gt.eq  & h integral \( u_B - u_A \) \( rho_B^h - rho_A^h \) - h^2 / 2 integral f \| D \|^2 - h^3 integral_0^1 integral f chevron.l C_s \, T_D chevron.r thin upright(d) s\
 & quad + h^4 K_(A B) \( S \) + o \( h^4 \) \,\
K_(A B) \( S \) :=  & 1 / 2 integral [chevron.l Q_1 \, f S_B + L_B B chevron.r - chevron.l Q_0 \, f S_A + L_A A chevron.r]\
 & quad - integral_0^1 integral [L_(C_s) chevron.l D \, Q_s chevron.r + f / 2 \| Q_s \|^2] thin upright(d) s . $ <fwd:dual-expansion>]

 For the prescribed radial action $J_(0 A)^h$, take pair indices $0 \, A$, zero initial potential and fields, $rho_0^h = f$, and $q_(0 A) = 0$. Then (3.17) holds with equality and fourth-order coefficient 
#[#set math.equation(numbering: n => "(3.18)")
 $ K_(0 A) \( S \) + 1 / 6 integral f \| S_A + nabla_A A \|^2 . $ <fwd:radial-defect>]

]
] <fwd:dual>

#proof[
  #emph[The energy identity.] For a bounded-compression solution $sigma_s$ of the continuity equation with velocity $v_s$, use
  $ p_s = h \( u_B - u_A \) + h^2 q_s . $
  Its strong $W^(1 \, 2)$ dependence on time and the continuity equation give the exact energy identity
  #[#set math.equation(numbering: n => "(3.19)")
   $ 1 / 2 integral_0^1 integral sigma_s \| v_s \|^2 thin upright(d) s =  & [integral p_s sigma_s]_(s = 0)^(s = 1) - integral_0^1 integral sigma_s (partial_s p_s + 1 / 2 \| nabla p_s \|^2) thin upright(d) s\
 & quad + 1 / 2 integral_0^1 integral sigma_s \| v_s - nabla p_s \|^2 thin upright(d) s . $ <fwd:young-identity>]
  One may verify the time differentiation directly by writing $p_s$ as a sum of fixed Sobolev functions with affine time coefficients. The endpoint terms are finite by the bounded densities and bounded support; the remaining terms are finite by the kinetic-energy and $W^(1 \, 2)$ bounds. Thus no boundedness assumption on $q_(A B)$ is needed.
  #emph[The dual expansion.] The term $- s \| D \|^2 \/ 2$ in $q_s$ cancels the quadratic part of the Hamilton–Jacobi residual. Thus the residual begins at order $h^3$, and the first density variation supplies its contribution at order $h^4$. Explicitly,
  #[#set math.equation(numbering: n => "(3.20)")
   $ partial_s p_s + 1 / 2 \| nabla p_s \|^2 = h^3 chevron.l D \, Q_s chevron.r + h^4 / 2 \| Q_s \|^2 . $ <fwd:residual>]
  For the optimal interpolation, Lemma 8 gives
  $ integral_0^1 integral sigma_s^h chevron.l D \, Q_s chevron.r thin upright(d) s =  & integral_0^1 integral f chevron.l D \, Q_s chevron.r thin upright(d) s + h integral_0^1 integral L_(C_s) chevron.l D \, Q_s chevron.r thin upright(d) s + o \( h \) \,\
integral_0^1 integral sigma_s^h \| Q_s \|^2 thin upright(d) s =  & integral_0^1 integral f \| Q_s \|^2 thin upright(d) s + o \( 1 \) . $
  The first limit uses weak $L^2$ convergence against the fixed $L^2$ function $chevron.l D \, Q_s chevron.r$. The second uses convergence in measure and the uniform density bound, by truncation of the fixed integrable function $\| Q_s \|^2$. Outside the common density support both statements are vacuous.
  Apply (3.6) to the two fixed endpoint functions $q_0 \, q_1$. Leave the endpoint contribution involving $u_B - u_A$ unexpanded. The terms of order four are then precisely (3.17). For the cubic term, integration by parts gives
  $ integral \( q_1 L_B - q_0 L_A \) = integral f \( chevron.l Q_1 \, B chevron.r - chevron.l Q_0 \, A chevron.r \) . $
  Using $Q_1 = Q_0 - T_D$ and $integral_0^1 Q_s thin upright(d) s = Q_0 - T_D \/ 2$, its difference from the cubic residual is
  $ - integral f ⟨B - D / 2 \, T_D⟩ = - integral_0^1 integral f chevron.l C_s \, T_D chevron.r thin upright(d) s . $
  Also $q_1 - q_0 = - \| D \|^2 \/ 2$. Dropping the nonnegative last term in (3.19) proves (3.17).
  #emph[The radial defect.] For the radial flow use its actual velocity from (3.3), and use Lemma 6 in place of Lemma 8. Here $D = A$, $C_s = s A$, and $Q_s = - s nabla_A A$. The last term of (3.19), divided by $h^4$, is
  $ 1 / 2 integral_0^1 s^2 integral rho_(s \, A)^h \| S_A + nabla_A A \|^2 thin upright(d) s arrow.r 1 / 6 integral f \| S_A + nabla_A A \|^2 . $
  The integrand in the spatial limit is fixed and integrable, and (3.4) justifies the limit. This proves the radial assertion. ◻
]

We next compute the fourth-order difference. Define

$ F_C := L_C C - f nabla_C C $

and the separately quadratic expression

#[#set math.equation(numbering: n => "(3.21)")
 $ P \( C \, C \; D \, D \) := integral [- chevron.l F_C \, nabla_D D chevron.r + f \| nabla_C D \|^2] . $ <fwd:P-definition>]

The notation $P \( E \, F \; G \, H \)$ means its polarization, symmetric in the first pair and separately symmetric in the second pair. Let $K_(A B)$ denote the expression in (3.17) with $f S_E + L_E E$ replaced by $F_E$ at both endpoints.

#thm([Lemma 3.6.])[
  (Square completion and curvature identity).  #emph[For every ordered pair, 
#[#set math.equation(numbering: n => "(3.22)")
 $ K_(A B) = 1 / 2 integral_0^1 [P \( C_s \, C_s \; D \, D \) - integral f \| Q_s + nabla_(C_s) D \|^2] thin upright(d) s . $ <fwd:square-completion>]

 For the radial coefficients use $q_(0 A) = 0$. Then 
#[#set math.equation(numbering: n => "(3.23)")
 $ 2 bb(E) K_(0 A) - bb(E) K_(A B) =  & 1 / 3 bb(E) \[ P \( A \, B \; A \, B \) - P \( A \, A \; B \, B \) \]\
 & quad + 1 / 2 bb(E) integral f \| nabla q_(A B) + nabla_A \( B - A \) \|^2\
=  & 1 / 6 bb(E) R \( A \, B \, B \, A \) \( f \) + 1 / 2 bb(E) integral f \| nabla q_(A B) + nabla_A \( B - A \) \|^2 . $ <fwd:average-P>]

]
] <fwd:algebra>

#proof[
  #emph[Integration by parts.] We first justify the identity
  #[#set math.equation(numbering: n => "(3.24)")
   $ integral chevron.l L_D C - L_C D \, nabla q chevron.r = integral f chevron.l nabla_D C - nabla_C D \, nabla q chevron.r \, #h(2em) q in W^(1 \, 2) \( M \) . $ <fwd:gradient-ibp>]
  For test $q$, integration by parts in its two terms gives
  $ integral L_D chevron.l C \, nabla q chevron.r & = integral f #scale(x: 120%, y: 120%)[\(] chevron.l nabla_D C \, nabla q chevron.r + "Hess" q \( D \, C \) #scale(x: 120%, y: 120%)[\)] \,\
integral L_C chevron.l D \, nabla q chevron.r & = integral f #scale(x: 120%, y: 120%)[\(] chevron.l nabla_C D \, nabla q chevron.r + "Hess" q \( C \, D \) #scale(x: 120%, y: 120%)[\)] . $
  The Hessian terms cancel. The vector fields paired with $nabla q$ on both sides of (3.24) are in $L^2$ and have bounded support. Density of test functions in $W^(1 \, 2)$ therefore proves the identity for the stated class, without assigning a Hessian to $q$.
  #emph[Square completion.] The maps $s mapsto F_(C_s)$ and $s mapsto Q_s$ are polynomials with values in $L^2$. They have derivatives
  $ F'_(C_s) = L_D C_s + L_(C_s) D - f nabla_D C_s - f nabla_(C_s) D \, #h(2em) Q'_s = - nabla_D D . $
  Express the endpoint difference in $K_(A B)$ as the integral of the derivative of $chevron.l F_(C_s) \, Q_s chevron.r \/ 2$, and subtract the other terms in (3.17). Applying (3.24) gives
  $ K_(A B) = 1 / 2 integral_0^1 integral [- chevron.l F_(C_s) \, nabla_D D chevron.r - 2 f chevron.l nabla_(C_s) D \, Q_s chevron.r - f \| Q_s \|^2] thin upright(d) s . $
  Completion of the square proves (3.22).
  #emph[Averaging.] For the averaging, set
  $ T = bb(E) P \( A \, A \; A \, A \) \, quad S = bb(E) P \( A \, A \; B \, B \) \, quad H = bb(E) P \( A \, B \; A \, B \) . $
  Independence and sign symmetry kill every term with an odd number of occurrences of either random field. Exchangeability identifies the two pure and the two unmixed terms. Expansion in the four slots therefore gives
  $ bb(E) P \( C_s \, C_s \; D \, D \) = \( \( 1 - s \)^2 + s^2 \) \( T + S \) - 4 s \( 1 - s \) H . $
  Both $integral_0^1 \( \( 1 - s \)^2 + s^2 \) thin upright(d) s$ and $integral_0^14 s \( 1 - s \) thin upright(d) s$ equal $2 \/ 3$. The contribution of the $P$ term to $bb(E) K_(A B)$ is consequently $\( T + S - H \) \/ 3$. In the radial case $C_s = s A$, $D = A$, $Q_s = - s nabla_A A$, so the square vanishes and $K_(0 A) = P \( A \, A \; A \, A \) \/ 6$. Finally,
  $ Q_s + nabla_(C_s) D = nabla q_(A B) + nabla_A D . $
  These facts prove (3.23).
  #emph[The curvature contraction.] To identify the curvature convention explicitly, write
  $ a = nabla_A A \, #h(2em) b = nabla_B B \, #h(2em) U = nabla_B A \, #h(2em) V = nabla_A B . $
  Separate symmetric polarization of (3.21) gives
  #[#set math.equation(numbering: n => "(3.25)")
   $ P \( A \, B \; A \, B \) = integral #scale(x: 240%, y: 240%)[\[] & - 1 / 4 chevron.l L_A B + L_B A \, U + V chevron.r\
 & + f (1 / 4 \| U \|^2 + 1 / 4 \| V \|^2 + chevron.l U \, V chevron.r + 1 / 2 chevron.l a \, b chevron.r) #scale(x: 240%, y: 240%)[\]] \, $ <fwd:polarization>]
  whereas
  $ P \( A \, A \; B \, B \) = integral \[ - L_A chevron.l A \, b chevron.r + f chevron.l a \, b chevron.r + f \| V \|^2 \] . $
  Exchangeability gives $bb(E) \| U \|^2 = bb(E) \| V \|^2$ and
  $ 1 / 2 bb(E) integral chevron.l L_A B + L_B A \, U + V chevron.r = bb(E) integral L_B chevron.l A \, U + V chevron.r . $
  Hessian symmetry for the gradient $A$ gives $chevron.l A \, U chevron.r = chevron.l B \, a chevron.r$; swapping the random choices then yields $bb(E) integral L_B chevron.l A \, U chevron.r = bb(E) integral L_A chevron.l A \, b chevron.r$. Thus
  #[#set math.equation(numbering: n => "(3.26)")
   $ 2 bb(E) \[ P \( A \, B \; A \, B \) - P \( A \, A \; B \, B \) \] = bb(E) integral #scale(x: 120%, y: 120%)[\[] & L_A chevron.l A \, b chevron.r - L_B chevron.l A \, V chevron.r\
 & + f \( - chevron.l a \, b chevron.r - \| V \|^2 + 2 chevron.l U \, V chevron.r \) #scale(x: 120%, y: 120%)[\]] . $ <fwd:polarized-curvature>]
  The first two terms of the specified integrated curvature formula, with $\( X \, Y \, Z \, W \) = \( A \, B \, B \, A \)$, combine to
  $ L_A chevron.l A \, b chevron.r - f chevron.l a \, b chevron.r . $
  Its next two terms combine to
  $ - L_B chevron.l A \, V chevron.r + f chevron.l U \, V chevron.r . $
  Finally $\[ A \, B \] = V - U$, and Hessian symmetry for $B$ gives
  $ - f chevron.l nabla_(\[ A \, B \]) B \, A chevron.r = - f chevron.l V - U \, V chevron.r . $
  The sum is exactly the integrand in (3.26). This proves (3.23), including the sign of the bracket term. ◻
]

#thm([Proposition 3.7.])[
  (A localized error estimate).  #emph[For the finite centered law above, every semiconcave compactly supported Lipschitz $f gt.eq 0$, and every family $q_(A B) in W^(1 \, 2) \( M \)$, 
#[#set math.equation(numbering: n => "(3.27)")
 $ kappa / 6 integral f thin bb(E) \| A and B \|^2 lt.eq 1 / 6 bb(E) R \( A \, B \, B \, A \) \( f \) + 1 / 2 bb(E) integral f \| nabla q_(A B) + nabla_A \( B - A \) \|^2 . $ <fwd:defective-curvature>]

]
] <fwd:defect>

#proof[
  First keep all endpoint corrections $S_A$ fixed. In twice the expected radial expansion from Lemma 9, minus the expected pair lower bound, every term displayed before order four cancels. Indeed independence and $bb(E) u_A = 0$ give the exact identity
  $ bb(E) integral \( u_B - u_A \) \( rho_B^h - rho_A^h \) = 2 bb(E) integral u_A \( rho_A^h - f \) . $
  This identity uses no further expansion of the endpoint densities. The quadratic terms cancel by (3.2). The radial cubic term is a constant multiple of $integral f chevron.l A \, nabla_A A chevron.r$, which is odd under sign reversal. The pair cubic term is a constant multiple of
  $ integral f ⟨frac(A + B, 2) \, nabla_(B - A) \( B - A \)⟩ \, $
  which is odd under simultaneous sign reversal of both choices. Their expectations therefore vanish. Together with Lemma 7, this proves
  #[#set math.equation(numbering: n => "(3.28)")
   $ kappa / 6 integral f thin bb(E) \| A and B \|^2 lt.eq 2 bb(E) K_(0 A) \( S \) - bb(E) K_(A B) \( S \) + 1 / 3 bb(E) integral f \| S_A + nabla_A A \|^2 . $ <fwd:fixed-correction-bound>]
  Now approximate $- nabla_A A$ in $L^2$ by admissible fields $S_A^(\( j \))$. Such an approximation can be chosen explicitly: $\| A \|^2 \/ 2$ is bounded, compactly supported, and Sobolev; heat regularize it, multiply by a fixed test cutoff equal to one on a neighborhood of its support, and take the negative gradient. Strong continuity of the heat flow in $W^(1 \, 2)$ gives
  $ S_A^(\( j \)) arrow.r - nabla_A A quad upright("in ") L^2 . $
  Each approximant is a bounded compact test gradient with bounded divergence. Its bounds may depend on $j$. For every fixed $j$, the limit $h arrow.b 0$ leading to (3.28) has already been taken, so no uniform flow bounds in $j$ are required.
  The dependence of $K_(A B) \( S \)$ on an endpoint correction is a pairing with one of the fixed $L^2$ fields $f Q_0 \, f Q_1$. It is therefore continuous under this approximation. The radial defects tend to zero. Taking $j arrow.r oo$ in (3.28) gives
  $ kappa / 6 integral f thin bb(E) \| A and B \|^2 lt.eq 2 bb(E) K_(0 A) - bb(E) K_(A B) . $
  Lemma 10 is exactly (3.27). ◻
]

=== 3.5 Removing the error by localization <removing-the-error-by-localization>

#thm([Lemma 3.8.])[
  (Semiconcave approximation of the weight).  #emph[If $f gt.eq 0$ is compactly supported and Lipschitz, then there are nonnegative compactly supported semiconcave functions $f_j$, with support in $"supp" f$, such that $f_j arrow.r f$ uniformly and weakly in $W^(1 \, 2)$, and $sup_j "Lip" \( f_j \) < oo$. Consequently (3.27) holds for every nonnegative compactly supported Lipschitz weight.]
] <fwd:weight-approximation>

#proof[
  Use the inf-convolutions
  $ f_epsilon \( x \) := inf_y (f \( y \) + frac(d \( x \, y \)^2, 2 epsilon)) \, #h(2em) epsilon arrow.b 0 . $
  Minimizers exist by properness. If $L = "Lip" \( f \)$, then
  $ 0 lt.eq f_epsilon lt.eq f \, #h(2em) parallel f_epsilon - f parallel_oo lt.eq frac(epsilon L^2, 2) . $
  In particular the supports lie in the fixed compact support of $f$. Every minimizer $y$ satisfies $d \( x \, y \) lt.eq epsilon L$: compare it with a point a short distance along a minimizing segment from $y$ to $x$, divide the resulting optimality inequality by that distance, and let the distance tend to zero. The same bound in the difference-quotient estimate for the inf-convolution gives local slope at most $L$; since $M$ is a length space, $"Lip" \( f_epsilon \) lt.eq L$.
  For sufficiently small fixed $epsilon$, all these minimizing distances are below a fixed model-comparison scale. Triangle comparison makes the functions $x mapsto d \( x \, y \)^2$ uniformly semiconcave when these distances remain below that scale, including at $x = y$; compare #cite(label("Petrunin2007")) Section 1.2. For an explicit normalization, choose $a > 0$ with $- a^2 lt.eq kappa$, weaken the curvature bound to $- a^2$, and put $h \( r \) = \( cosh \( a r \) - 1 \) \/ a^2$. Model comparison gives $\( h compose d_y \)'' lt.eq 1 + a^2 h compose d_y$ along unit-speed geodesics. Write $r^2 = Psi \( h \( r \) \)$. The function $Psi$ is increasing and concave, is smooth at zero, and satisfies $0 lt.eq Psi' lt.eq 2$. Thus on $d_y lt.eq R$ the squared distance has semiconcavity constant $2 cosh \( a R \)$, uniformly in the center. Locally near each $x$, the infimum defining $f_epsilon$ may be restricted to a common small neighborhood of $x$, by the minimizer bound. It is thus an infimum of functions with a common semiconcavity constant there. Infima preserve that semiconcavity inequality. The constant depends on $epsilon \, kappa \, L$, but not on the base point. Local semiconcavity with this constant yields the same inequality along each geodesic by subdivision. This proves the required semiconcavity of each $f_epsilon$.
  The common support and Lipschitz bound give boundedness in $W^(1 \, 2)$. Uniform convergence identifies every weak Sobolev subsequential limit with $f$; hence any sequence $epsilon_j arrow.b 0$ has the asserted weak convergence. In (3.27), the two terms without curvature are integrals against fixed locally integrable functions. The curvature term converges by Lemma 4. Passing to the limit proves the last assertion. ◻
]

#thm([Lemma 3.9.])[
  (Approximation by finitely many gradient choices).  #emph[Let $f gt.eq 0$ be compactly supported and Lipschitz, and let $V_1 \, dots.h \, V_N in L^2 \( T M \)$. For every $eta > 0$, there are finitely many nonnegative Lipschitz functions $alpha_1 \, dots.h \, alpha_L$, with $sum_(ell = 1)^L alpha_ell = 1$, and functions $q_(r \, ell) in W^(1 \, 2) \( M \)$, such that 
#[#set math.equation(numbering: n => "(3.29)")
 $ sum_(r = 1)^N sum_(ell = 1)^L integral f alpha_ell \| nabla q_(r \, ell) - V_r \|^2 < eta . $ <fwd:selection-error>]

 The products $f alpha_ell$ are compactly supported Lipschitz functions. No bound for $nabla alpha_ell$ independent of $eta$ is asserted or needed.]
] <fwd:gradient-selection>

#proof[
  The tangent module is generated by gradients of Sobolev functions. Thus finite sums of such gradients with bounded measurable scalar coefficients are dense in $L^2 \( T M \)$. Approximating the coefficients by finite-valued functions and refining the resulting partitions shows that fields of the form
  $ sum_(ell = 1)^L upright(bold(1))_(E_ell) nabla q_ell \, #h(2em) q_ell in W^(1 \, 2) \( M \) \, $
  are dense as well: on each piece a constant linear combination of gradients is the gradient of the corresponding linear combination of potentials. This construction may be made simultaneously for the finite list $V_r$. Since $f$ is bounded, it provides a finite measurable partition and choices $q_(r \, ell)$ for which
  $ sum_(r \, ell) integral_(E_ell) f \| nabla q_(r \, ell) - V_r \|^2 < eta \/ 2 . $
  Put $K_f = "supp" f$. On this compact set the measure with density
  $ f (1 + sum_(r \, ell) \| nabla q_(r \, ell) - V_r \|^2) $
  is finite and regular. Choose disjoint compact subsets $K_ell subset E_ell ∩ K_f$ whose complement has arbitrarily small measure for this density. There are nonnegative Lipschitz functions $alpha_ell$ summing to one, with $alpha_ell = 1$ on $K_ell$. For example, take Lipschitz bumps equal to one on the nonempty $K_ell$, supported in disjoint neighborhoods, and assign their remaining complement to the first function. On $union.big_ell K_ell$, these functions agree with the corresponding partition indicators. On the complement, the change in the error integral is bounded by the sum appearing in the displayed density. Taking the omitted measure sufficiently small proves (3.29). ◻
]

#thm([Proposition 3.10.])[
  (The curvature bound on compact test gradients).  #emph[For every $U \, V in cal(G)$ and every nonnegative compactly supported Lipschitz $f$, 
#[#set math.equation(numbering: n => "(3.30)")
 $ R \( U \, V \, V \, U \) \( f \) gt.eq kappa integral f \| U and V \|^2 . $ <fwd:core-bound>]

]
] <fwd:gradient-bound>

#proof[
  First retain an arbitrary finite sign-symmetric law as above. Apply Lemma 13 to the finite list
  $ V_(A B) := - nabla_A \( B - A \) . $
  For each $ell$, apply (3.27), as extended in Lemma 12, with weight $f alpha_ell$ and potentials $q_(A B \, ell)$. Sum over $ell$. The curvature functional and its model term are linear in the weight, and $sum_ell f alpha_ell = f$. Thus their sums are exactly their evaluations at $f$, including the terms containing derivatives of the weight. The error is at most $eta \/ 2$, after decreasing the tolerance in (3.29) if needed. Letting $eta arrow.b 0$ gives
  #[#set math.equation(numbering: n => "(3.31)")
   $ bb(E) R \( A \, B \, B \, A \) \( f \) gt.eq kappa integral f thin bb(E) \| A and B \|^2 . $ <fwd:averaged-bound>]
  In particular there are no partition-derivative errors and no uniform derivative bound on the partitions is needed.
  Choose the uniform law on the four potentials yielding the fields $U \, - U \, V \, - V$. In (3.31), pairs from the same signed field have zero sectional and wedge expressions. The mixed pairs have total probability $1 \/ 2$. Multilinearity and the curvature symmetries identify all of them with the corresponding expression for $\( U \, V \)$. Both sides of (3.31) are therefore one half of the respective sides of (3.30). This proves the proposition. ◻
]

=== 3.6 The global test classes <the-global-test-classes>

We supply the extension details, including the approximation topology needed in the curvature formula. These details also explain why the compact-gradient argument proves the exact global quantifiers in Theorem 5.

#thm([Lemma 3.11.])[
  (Continuous coefficients on a fixed gradient family).  #emph[Fix $E_1 \, dots.h \, E_N in cal(G)$. Then (3.1) holds for nonnegative compact test weights and fields of the form 
$ X = sum_(i = 1)^N a_i E_i \, #h(2em) Y = sum_(i = 1)^N b_i E_i \, #h(2em) a_i \, b_i in "Test" \( M \) . $

]
] <fwd:coefficients>

#proof[
  For constant coefficient vectors $a \, b in bb(R)^N$, put $E \( a \) = sum_i a_i E_i$. This is again in $cal(G)$. Proposition 14 says that
  $ T_(a \, b) \( f \) := R \( E \( a \) \, E \( b \) \, E \( b \) \, E \( a \) \) \( f \) - kappa integral f \| E \( a \) and E \( b \) \|^2 $
  is nonnegative on nonnegative compact Lipschitz functions. It is therefore a positive Radon measure. Indeed, for weights supported in a fixed compact set, choose a nonnegative Lipschitz cutoff dominating one there. Positivity bounds the functional by its value on that cutoff times the uniform norm of the weight. The functional extends to continuous compactly supported functions and the Radon representation theorem applies.
  Define functionals on compact Lipschitz weights by
  $ D_(i j k l) = R \( E_i \, E_j \, E_k \, E_l \) - kappa Q_(i j k l) m \,\
Q_(i j k l) = chevron.l E_i \, E_l chevron.r chevron.l E_j \, E_k chevron.r - chevron.l E_i \, E_k chevron.r chevron.l E_j \, E_l chevron.r . $
  For $alpha \, beta in bb(N)_0^N$ with $\| alpha \| = \| beta \| = 2$, let
  $ C_(alpha beta) := sum_(e_i + e_l = alpha\
e_j + e_k = beta) D_(i j k l) \, #h(2em) T_(a \, b) = sum_(alpha \, beta) a^alpha b^beta C_(alpha beta) . $
  Here $e_i$ are the coordinate vectors, and the first sum is over ordered quadruples, retaining all monomial multiplicities. Polynomial interpolation at finitely many constant vectors expresses every grouped coefficient $C_(alpha beta)$ as a finite real linear combination of the positive Radon measures $T_(a \, b)$. Thus each $C_(alpha beta)$ is a signed Radon measure; no measure representation of an individual $D_(i j k l)$ is needed.
  On a fixed relatively compact region containing the support of the weight, put
  $ lambda = sum_(alpha \, beta) \| C_(alpha beta) \| \, #h(2em) c_(alpha beta) = frac(d C_(alpha beta), d lambda) \, #h(2em) P_x \( a \, b \) = sum_(alpha \, beta) a^alpha b^beta c_(alpha beta) \( x \) . $
  For every rational pair $a \, b$, positivity of $T_(a \, b)$ gives $P_x \( a \, b \) gt.eq 0$ for $lambda$-almost every $x$. Countability and polynomial continuity give a common conull set on which this holds for every real pair.
  For variable test coefficients, first apply tensoriality of $R$ over the test algebra. All scalar weights in the following identity are compact test functions:
  $ & R \( X \, Y \, Y \, X \) \( f \) - kappa integral f \| X and Y \|^2\
 & #h(2em) = sum_(i \, j \, k \, l) D_(i j k l) \( f a_i a_l b_j b_k \)\
 & #h(2em) = sum_(alpha \, beta) C_(alpha beta) \( f a^alpha b^beta \)\
 & #h(2em) = integral f \( x \) P_x \( a \( x \) \, b \( x \) \) thin upright(d) lambda \( x \) gt.eq 0 . $
  The last line uses only the continuous representatives of scalar test functions on the signed measures. No tangent field is evaluated on a singular measure support. This proves the claim, including when some $C_(alpha beta)$ are singular with respect to $m$. ◻
]

#thm([Lemma 3.12.])[
  (Local approximation with strong second derivatives).  #emph[Let $b in "Test" \( M \)$, and let $E subset M$ be compact. There are compactly supported test functions $b_j$ with bounded Laplacian such that their gradients are uniformly bounded and, on a fixed neighborhood of $E$, 
$ b_j arrow.r b \, quad nabla b_j arrow.r nabla b \, quad Delta b_j arrow.r Delta b \, quad "Hess" b_j arrow.r "Hess" b $

 strongly in $L^2$. The gradients converge almost everywhere after passage to a subsequence. Consequently, for any finite collection of test vector fields, there are fields built with test coefficients and potentials of this compact bounded-Laplacian class which converge locally to the given fields, uniformly bounded in norm, with strong $L^2$ convergence of the fields, their covariant derivatives, and their divergences.]
] <fwd:field-approximation>

#proof[
  Choose a fixed compact neighborhood $E'$ of $E$ and apply Lemma 2(iii) on $E'$. It gives the uniform gradient bound and all the asserted scalar convergences on this fixed neighborhood. Strong $L^2$ convergence of the gradients gives almost-everywhere convergence after passage to a subsequence.
  For $X = sum_i a_i nabla b_i$, keep the original coefficients and approximate its finitely many potentials as just described. The product rules give
  $ nabla X_j = sum_i d a_i ⊗ d b_(i \, j) + a_i "Hess" b_(i \, j) \, #h(2em) "div" X_j = sum_i chevron.l nabla a_i \, nabla b_(i \, j) chevron.r + a_i Delta b_(i \, j) . $
  The coefficients and their gradients are bounded, so both expressions converge strongly in $L^2$ on the neighborhood. The vector bounds and convergence follow from the corresponding properties of the gradients. Use one common subsequence for the finite collection. ◻
]

#proof[
  It remains to extend Proposition 14; the RCD and support conclusions were noted at the beginning of the section. Fix a nonnegative compactly supported test weight $f$ and arbitrary $X \, Y in "TestV" \( M \)$. Lemma 16 gives approximating fields $X_j \, Y_j$ near $"supp" f$. Lemma 15 proves (3.1) for every pair $X_j \, Y_j$.
  The field-continuity assertion of Lemma 4 passes the curvature evaluation to the limit on the fixed compact support of $f$. The wedge term converges by dominated convergence on that support. This proves (3.1) for arbitrary test fields and compact test weights.
  Finally let $f in "Test" \( M \)$ be nonnegative without a support restriction. Choose $0 lt.eq chi_R lt.eq 1$ in the stronger test cutoff class, equal to one on $B_R \( o \)$, with compact support and uniformly bounded gradient. Such an exhaustion exists for every fixed $K \, n$ #cite(label("GigliTamanini2021")) Appendix A, Lemma A.2. The product $f chi_R$ is a compact test function, so the desired inequality holds for this weight.
  All the original tensor integrands are globally integrable. Test fields are bounded and in $L^2$, and their derivatives and divergences are in $L^2$. Terms with two derivatives are thus $L^1$; a typical term with $d f$ is bounded by a constant times $\| W \| \| nabla Z \|$, again in $L^1$. The new terms containing $d chi_R$ obey the same bound, with an additional indicator of $M \\ B_R \( o \)$, and hence their integrals tend to zero. The model term is integrable, since
  $ f \| X and Y \|^2 lt.eq parallel f parallel_oo parallel X parallel_oo^2 \| Y \|^2 . $
  Dominated convergence proves (3.1) for the original global weight. This completes the proof. ◻
]

#prodef([Remark 3.13.])[
  (Order of limits).  The construction uses successive limits, not a single uniform expansion over its approximation parameters. First $h arrow.b 0$ is taken for fixed fields, corrections, semiconcave weight, and Sobolev dual potentials. Next the endpoint corrections approach $- nabla_A A$ in $L^2$. The defective inequality is then extended to Lipschitz weights. Only after that extension are the partitions and their associated dual potentials selected to remove the square. The final field approximation is local on the support of a fixed test weight, and the exhaustion is taken last. Thus neither the divergence bounds of the endpoint corrections nor the gradients of the localization partitions need to be uniform along their approximating sequences.
] <fwd:limit-order>

== 4 From the tensor bound to an index inequality <sec:heat-index>

Throughout this section assume (B), and put $K = \( n - 1 \) kappa$. Fix a bounded globally Lipschitz function $u$ that is constant outside a compact set. We write

$ Phi_t \( x \) = Q_t u \( x \) = inf_y {u \( y \) + frac(d^2 \( x \, y \), 2 t)} \, #h(2em) 0 < t lt.eq 1 . $

Properness implies that the infimum is attained. Our aim is an upper bound for the distributional Hessian of $Phi_1$, with the right-hand side evaluated along the minimizing paths of this inf-convolution.

We use the weak Hessian (2.3) and its weak local Sobolev continuity for potentials in $W_(upright("loc"))^(1 \, 2)$. Local potentials and locally Lipschitz weights are cut off on a neighborhood of the compact trial support when necessary. For a local test potential $z$, $H_z = "Hess" z$ is its ordinary $L_(upright("loc"))^2$ Hessian.

For $0 < delta < 1$, an admissible trial is a field

#[#set math.equation(numbering: n => "(4.1)")
 $ Y_t = sum_(j = 1)^q a_j \( t \) nabla g_j \, #h(2em) a_j in C^oo \( \[ delta \, 1 \] \) \, quad g_j in "Test" \( M \) upright(" compactly supported") . $ <heat:trial-class>]

Here smoothness on a closed interval means restriction of a smooth function on a neighborhood of that interval. In particular $Y_t = nabla g_t$, where $g_t = sum_j a_j \( t \) g_j$.

A geodesic $gamma in "Geo" \( M \)$ is calibrated by $u$ if

#[#set math.equation(numbering: n => "(4.2)")
 $ Phi_1 \( gamma_1 \) = u \( gamma_0 \) + 1 / 2 d^2 \( gamma_0 \, gamma_1 \) . $ <heat:calibration>]

#thm([Theorem 4.1.])[
  (Index inequality along calibrated paths).  #emph[Let $n gt.eq 2$ be an integer and let $\( M \, d \, m \)$, with $m = cal(H)^n$, be a full-support $upright("RCD") \( \( n - 1 \) kappa \, n \)$ space satisfying (1.3) for every global $X \, Y in "TestV" \( M \)$ and every nonnegative $f in "Test" \( M \)$. Let $u$ be bounded globally Lipschitz and constant outside a compact set, and let $Phi_t = Q_t u$. There is a Borel prescription $S : x mapsto S \( x \) in "Geo" \( M \)$, defined outside one $m$-null set, with $S \( x \)_1 = x$ and $S \( x \)$ satisfying (4.2). For every nonnegative compactly supported Lipschitz $f$, write $pi_f = S_(\#) \( f m \)$, with forward velocity $v$. The plan has terminal measure $f m$, uniformly bounded speed, and bounded compression on every $\[ delta \, 1 \]$, $delta > 0$.]
  #emph[Let $Z$ be a compactly supported test gradient. For every $0 < delta < 1$ and every trial (4.1) with the global endpoint identities $Y_delta = 0$ and $Y_1 = Z$, one has 
#[#set math.equation(numbering: n => "(4.3)")
 $ H_(Phi_1) \( Z \, Z \) \( f \) lt.eq integral_("Geo" \( M \)) integral_delta^1 (\| partial_t Y + nabla_v Y \|^2 - kappa \| Y and v \|^2) \( gamma_t \) thin upright(d) t thin upright(d) pi_f \( gamma \) . $ <heat:index-inequality>]

 The left side is the distributional evaluation (2.3); the right side is finite. Neither the path prescription nor its velocity depends on the choice of $Z$, the trial, or the terminal density.]
] <heat:index>

We use a forward heat potential and a backward density factor, in the entropic-interpolation framework of #cite(label("Leonard2017")) #cite(label("GigliTamanini2021")). In particular, the density is prescribed at time one; its equation has a backward diffusion term when expressed using the forward potential. Proposition 26 gives the index estimate at positive viscosity. We then identify its transport limit and prove strong convergence of the velocities before passing the quadratic energy to Theorem 18.

=== 4.1 Heat inputs and positive terminal data <heat-inputs-and-positive-terminal-data>

We record the heat estimates, including the extension needed on an infinite-measure space. Constants in this subsection may depend on $K \, n$ and a fixed upper bound for the heat time.

#thm([Lemma 4.2.])[
  (Heat estimates and bounded data).  #emph[Let $P_s = exp \( s Delta \)$. On $0 < s lt.eq S < oo$ one has 
#[#set math.equation(numbering: n => "(4.4)")
 $ \| nabla P_s h \| & lt.eq e^(- K s) P_s \| nabla h \| \,\
\| nabla P_s h \|^2 & lt.eq C_S s^(- 1) P_s \( h^2 \) \,\
\| Delta P_s h \|^2 & lt.eq C_S s^(- 1) P_s \( \| nabla h \|^2 \) \, $ <heat:bakry-one>]

 with the usual Sobolev hypothesis for the first and third inequalities and $h in L^2$ for the second. In particular, 
#[#set math.equation(numbering: n => "(4.5)")
 $ \| Delta P_s h \|^2 lt.eq C_S s^(- 2) P_s \( h^2 \) . $ <heat:laplacian-from-values>]

 Positive-time heat regularization of an $L^2 ∩ L^oo$ function has bounded Lipschitz representatives for all its generator powers. These assertions extend to bounded data, by local approximation, whenever the right-hand sides are defined by the heat kernel.]
  #emph[For every bounded nonnegative, nonzero datum $h$, and $0 < s lt.eq 1$, the locally defined logarithmic Laplacian satisfies 
#[#set math.equation(numbering: n => "(4.6)")
 $ Delta log P_s h gt.eq - C (s^(- 1) + s \| nabla log P_s h \|^2) . $ <heat:li-yau-consequence>]

 All logarithmic statements are local on regions where the positive-time solution has a positive lower bound.]
] <heat:analytic-inputs>

#proof[
  The first inequality is the $L^1$ gradient estimate #cite(label("Savare2014")) Corollary 3.5; the second is the reverse Poincaré inequality. The Bakry–Ledoux estimate #cite(label("ErbarKuwadaSturm2015")) Proposition 4.9 gives the third: its coefficient of $\| Delta P_s h \|^2$, before rearrangement, is $\( 1 - e^(- 2 K s) \) \/ \( n K \)$, with value $2 s \/ n$ at $K = 0$. Apply (4.4) at time $s \/ 2$ to $P_(s \/ 2) h$, then apply (4.4) inside the remaining heat operator, to obtain (4.5).
  These inequalities give the $L^oo$-to-Lipschitz and $L^oo$-to-$L^oo$ Laplacian bounds at positive time. Semigroup splitting, together with commutation in $L^2$, therefore gives, for each integer $j gt.eq 0$,
  $ parallel Delta^j P_s h parallel_oo + sqrt(s) thin "Lip" \( Delta^j P_s h \) lt.eq C_(j \, S) s^(- j) parallel h parallel_oo . $
  The time dependence is differentiable in the corresponding $L^2$ generator domains on intervals away from zero.
  Here is a local extension argument that does not assume $m \( M \) < oo$. Choose $0 lt.eq chi_R lt.eq 1$, equal to one on $B_R \( o \)$, compactly supported, and set $h_R = chi_R h$. For $R' gt.eq R$, the difference $d_R = h_R - h_(R')$ vanishes on $B_R \( o \)$ and satisfies $\| d_R \|^2 lt.eq parallel h parallel_oo^2 upright(bold(1))_(M \\ B_R \( o \))$. The Gaussian kernel bound shows that $P_s \( d_R^2 \)$ tends to zero uniformly on compact spatial sets and compact subintervals of $s > 0$. Equations (4.4) and (4.5) then make the gradients and Laplacians Cauchy locally in $L^oo$, as well as the functions themselves. Distributional closure identifies their limits with those of $P_s h$. Repeated splitting gives the same local conclusions for generator powers. The kernel bounds used here are valid for all centers, with constants depending only on $K \, n \, S$; see #cite(label("JiangLiZhang2016")) Theorem 1.2.
  For integrable nonnegative data, the general-measure Li–Yau inequality is #cite(label("GigliTamanini2021")) Theorem 3.4:
  $ \| nabla log P_s h \|^2 lt.eq e^(- 2 K s \/ 3) frac(Delta P_s h, P_s h) + frac(n K, 3) frac(e^(- 4 K s \/ 3), 1 - e^(- 2 K s \/ 3)) . $
  Its value at $K = 0$ is understood by continuity. We may weaken the Ricci bound to a strictly negative constant. Rearranging the inequality, using $\| e^(2 K s \/ 3) - 1 \| lt.eq C s$ and the $C \/ s$ bound for the remaining coefficient on $s lt.eq 1$, gives (4.6). Apply this to $h_R$ and pass to the local limit just established. Positive-time positivity and continuity supply a lower bound on each compact region, so division and the logarithmic chain rule pass to the limit. This proves the assertion also for bounded data that are not in any finite $L^p$ space. ◻
]

Fix $o in M$ and choose $D > 0$ sufficiently large that

#[#set math.equation(numbering: n => "(4.7)")
 $ macron(f) \( x \) = e^(- D d \( o \, x \)) \, #h(2em) integral \( 1 + d^2 \( o \, x \) \) macron(f) \( x \) thin upright(d) m \( x \) < oo . $ <heat:reference-density>]

Such a choice follows from Bishop–Gromov volume growth. The initial positive terminal class will be

#[#set math.equation(numbering: n => "(4.8)")
 $ cal(F) = { f_0 + lambda macron(f) : f_0 gt.eq 0 upright(" compactly supported Lipschitz") \, med lambda > 0 } . $ <heat:positive-data>]

Every member is bounded, belongs to $L^1 ∩ W^(1 \, 2)$, has finite second moment, and has a globally Lipschitz logarithm. For the last assertion, on a compact neighborhood of $"supp" f_0$ the denominator $f$ has a positive lower bound, and outside it $log f = log lambda - D d \( o \, dot.op \)$. The resulting uniform local Lipschitz bound is global because the space is a length space. The class is closed under positive rescaling. We normalize $integral f thin upright(d) m = 1$ when using Wasserstein distances; all final inequalities are homogeneous in the terminal mass.

For $f in cal(F)$ and $0 < c lt.eq 1$, define

#[#set math.equation(numbering: n => "(4.9)")
 $ H_t^c & = P_(c t) \( e^(- u \/ \( 2 c \)) \) \, & J_t^c & = P_(c \( 1 - t \)) \( f \/ H_1^c \) \, & rho_t^c & = H_t^c J_t^c \,\
phi.alt^c & = - 2 c log H^c \, & psi^c & = 2 c log J^c \, & b^c & = \( psi^c - phi.alt^c \) \/ 2 = c log rho^c \,\
theta^c & = \( psi^c + phi.alt^c \) \/ 2 \, & v_c & = nabla theta^c \, & w_c & = nabla b^c . $ <heat:two-factors>]

Here $H_t^c$ is a scalar heat factor; the notation $H_z$ continues to denote the Hessian of a potential $z$. The field $v_c$ is the continuity-equation velocity, while $w_c = c nabla log rho^c$ records the density gradient. We suppress the superscript $c$ in calculations at fixed viscosity.

#thm([Lemma 4.3.])[
  (Regularity, equations, and endpoint traces).  #emph[For each fixed $c > 0$, on compact spatial sets and compact time intervals in $\( 0 \, 1 \)$, the factors in (4.9) have bounded Lipschitz generator powers and positive lower bounds. Their logarithms are local test functions, with locally bounded Sobolev Laplacians. The density is a positive local test function. Time differentiation of the potentials is valid locally in the Laplacian graph norm, hence also for their $L^2$ Hessians.]
  #emph[There is a constant $L$, independent of $c$ and $t$, such that 
#[#set math.equation(numbering: n => "(4.10)")
 $ \| nabla phi.alt \| + \| nabla psi \| + \| v_c \| + \| w_c \| lt.eq L . $ <heat:uniform-gradients>]

 The following identities hold on $\( 0 \, 1 \)$: 
#[#set math.equation(numbering: n => "(4.11)")
 $ partial_t rho & = - "div" \( rho v_c \) \, & nabla rho & = rho w_c \/ c \,\
partial_t theta & = - 1 / 2 \( \| v_c \|^2 + \| w_c \|^2 \) - c Delta b \, & partial_t phi.alt & = - 1 / 2 \| nabla phi.alt \|^2 + c Delta phi.alt . $ <heat:continuity>]

 Moreover, $integral rho_t thin upright(d) m = 1$, $phi.alt_t$ is uniformly bounded, and, for fixed $c$, as $t arrow.t 1$, 
#[#set math.equation(numbering: n => "(4.12)")
 $ rho_t arrow.r f \, #h(2em) theta_t arrow.r phi.alt_1 + c log f quad upright("locally uniformly and strongly in ") W_(upright("loc"))^(1 \, 2) . $ <heat:terminal-traces>]

 The local Lipschitz bounds for $rho_t$ near the endpoint may depend on the fixed $c$. The bound for $nabla theta_t$ is uniform for $0 < c lt.eq 1$, and the terminal density is always the fixed function $f$.]
] <heat:regularity>

#proof[
  The first heat datum is a constant plus a compactly supported $W^(1 \, 2) ∩ L^oo$ function. Constants are preserved by the heat flow, so Lemma 19 applies. Since $u$ is bounded, $H_t$ has positive global lower and upper bounds for fixed $c$. Thus $g = f \/ H_1$ belongs to $L^1 ∩ W^(1 \, 2) ∩ L^oo$, and the same lemma applies to $J$. Positivity of the kernel gives $J > 0$; its continuous representative has a positive minimum on each compact space-time region under consideration.
  The logarithmic Laplacian formula
  $ Delta log H = frac(Delta H, H) - frac(\| nabla H \|^2, H^2) $
  and its counterpart for $J$ give local boundedness and $W^(1 \, 2)$ regularity. The squared-gradient term is Sobolev by metric compatibility and the $L^2$ Hessian estimate. Product and chain rules similarly show that $rho$ is a local test function. Generator differentiation before composition, followed by these same rules, gives strong local differentiation in the Laplacian graph norm; the Hessian estimate (2.2) then gives the Hessian statement.
  If $L_u = "Lip" \( u \)$, then $\| nabla e^(- u \/ \( 2 c \)) \| lt.eq \( L_u \/ \( 2 c \) \) e^(- u \/ \( 2 c \))$. Use (4.4), applied to the compact perturbation of the constant, to get $\| nabla phi.alt_t \| lt.eq e^(- K c t) L_u$. Also
  $ "Lip" \( log g \) lt.eq "Lip" \( log f \) + C \/ c . $
  Applying (4.4) to $g$ gives the corresponding bound for $nabla psi$. This proves (4.10) and also bounds the gradients of the terminal expressions. Since $rho = H J$, $nabla rho = rho w_c \/ c$; differentiating the two factors proves (4.11)–(4.11) with the displayed signs.
  Symmetry and the semigroup property, with nonnegative integrands, give
  $ integral H_t P_(c \( 1 - t \)) \( f \/ H_1 \) thin upright(d) m = integral H_1 \( f \/ H_1 \) thin upright(d) m = 1 . $
  The maximum principle bounds $phi.alt_t$ between $inf u$ and $sup u$. Finally $J_t arrow.r g$ strongly in $W^(1 \, 2)$. Heat continuity for bounded Lipschitz data, using the uniform small-time first moment of the kernel, gives uniform convergence of $J_t$ to $g$. Strong local convergence for the products and logarithms follows from their local positive lower bounds. This proves (4.12). ◻
]

=== 4.2 Uniform density and weighted second-order bounds <uniform-density-and-weighted-second-order-bounds>

Two different controls are needed below. Bounded densities allow pairing with fixed Sobolev coefficients and passage to the transport limit. A one-sided bound for $c Delta b$ will instead control its product with a nonnegative Bochner measure in the Riccati calculation. That bound must remain integrable up to the prescribed terminal time.

#thm([Lemma 4.4.])[
  (The terminal-time kernel ratio).  #emph[For each $A < oo$ there is $C_A < oo$ such that, if $0 < s lt.eq 1$, $g > 0$ is bounded and $"Lip" \( log g \) sqrt(s) lt.eq A$, then 
#[#set math.equation(numbering: n => "(4.13)")
 $ frac(\( P_s g^2 \)^(1 \/ 2), P_s g) lt.eq C_A #h(2em) upright("everywhere.") $ <heat:kernel-ratio-estimate>]

 The constant is independent of the base point and of a positive lower bound for $g$.]
] <heat:kernel-ratio>

#proof[
  The two-sided Gaussian estimate and Bishop–Gromov give constants $a \, C \, c_0 > 0$, uniform in the base point, for which
  $ p_s \( x \, y \) lt.eq frac(C, m \( B_(sqrt(s)) \( x \) \)) e^(- d^2 \( x \, y \) \/ \( a s \)) \, #h(2em) p_s \( x \, y \) gt.eq frac(c_0, m \( B_(sqrt(s)) \( x \) \)) quad \( y in B_(sqrt(s)) \( x \) \) . $
  The harmless bounded factors involving $s lt.eq 1$ are absorbed in the constants. In addition, for $j gt.eq 0$,
  $ frac(m \( B_(\( j + 1 \) sqrt(s)) \( x \) \), m \( B_(sqrt(s)) \( x \) \)) lt.eq C \( j + 1 \)^n e^(C \( j + 1 \) sqrt(s)) . $
  The lower bound and the logarithmic Lipschitz condition give $P_s g \( x \) gt.eq c_0 e^(- A) g \( x \)$. On the annulus $j sqrt(s) lt.eq d \( x \, y \) < \( j + 1 \) sqrt(s)$, $g \( y \)^2 lt.eq g \( x \)^2 e^(2 A \( j + 1 \))$. Therefore
  $ P_s g^2 \( x \) lt.eq C g \( x \)^2 sum_(j = 0)^oo \( j + 1 \)^n exp #scale(x: 120%, y: 120%)[\(] - j^2 \/ a + \( C + 2 A \) \( j + 1 \) #scale(x: 120%, y: 120%)[\)] . $
  This convergent series is uniform in $x \, s$. Dividing the two estimates proves the claim. ◻
]

#thm([Lemma 4.5.])[
  (Density and lower Laplacian control).  #emph[For each $0 < delta < 1$ there are $C_delta$ and nonnegative functions $e_c$ on $\( delta \, 1 \)$ such that 
#[#set math.equation(numbering: n => "(4.14)")
 $ sup_(delta lt.eq t lt.eq 1) parallel rho_t^c parallel_oo lt.eq C_delta \, #h(2em) c Delta b^c gt.eq - e_c \( t \) \, #h(2em) parallel e_c parallel_(L^1 \( delta \, 1 \)) arrow.r 0 . $ <heat:density-and-error>]

 The lower bound holds also for quasi-continuous representatives, for almost every time.]
] <heat:density-laplacian>

#proof[
  #emph[Bounded compression.] Apply (4.6) at heat time $c t$, using (4.10). It gives
  $ Delta phi.alt_t lt.eq C \( 1 + t^(- 1) \) \, #h(2em) - Delta psi_t lt.eq C \( 1 + \( 1 - t \)^(- 1) \) . $
  The constants are independent of $c$. Since $v_c = nabla phi.alt + w_c$, the density equation can also be written
  #[#set math.equation(numbering: n => "(4.15)")
   $ partial_t rho = - "div" \( rho nabla phi.alt \) - c Delta rho . $ <heat:backward-fokker-planck>]
  For $p gt.eq 2$, multiplication by $p rho^(p - 1)$ gives
  $ frac(d, d t) integral rho^p thin upright(d) m = - \( p - 1 \) integral rho^p Delta phi.alt thin upright(d) m + c p \( p - 1 \) integral rho^(p - 2) \| nabla rho \|^2 thin upright(d) m gt.eq - \( p - 1 \) C \( 1 + t^(- 1) \) integral rho^p thin upright(d) m . $
  For fixed $c$ the integrations are justified first with exhausting cutoffs: $rho$ is bounded and integrable, $\| nabla rho \| lt.eq C_c rho$, and $Delta phi.alt$ is globally bounded away from the initial time. The cutoff errors vanish by integrability. One may equivalently use the strong interior $L^2$ heat differentiation before removing the cutoffs. Integrate backward from $rho_1 = f$, then let $p arrow.r oo$. This proves the density bound, with the direction of integration fixed by (4.15).
  #emph[The terminal lower bound.] For the endpoint bound let $r = 1 - t$, $g = f \/ H_1$, and $s = c r$. When $r lt.eq c$, the logarithmic Lipschitz bound for $g$ is at most $C \/ c$, and $s lt.eq c^2$. Lemma 21 and (4.4) consequently give
  $ frac(\| Delta P_s g \|, P_s g) lt.eq C s^(- 1 \/ 2) c^(- 1) \, #h(2em) c \| Delta psi_t \| lt.eq C (1 + sqrt(c \/ r)) . $
  For $r gt.eq c$, use the preceding Li–Yau bounds instead. Since $b = \( psi - phi.alt \) \/ 2$, one can thus take, after increasing constants depending on $delta$,
  $ e_c \( t \) lt.eq cases(delim: "{", C_delta c \( 1 + r^(- 1) \) \, & r gt.eq c \,, C_delta \( c + 1 + sqrt(c \/ r) \) \, & 0 < r < c .) $
  For sufficiently small $c$, its integral is at most $C_delta \( c \| log c \| + c \)$. The Sobolev function $Delta b$ has the same lower bound outside a polar set in its quasi-continuous representative, by the capacitary facts in Section 2. ◻
]

The next estimates adapt the weighted Hessian and Laplacian bounds, and the vanishing density-gradient estimates, of #cite(label("GigliTamanini2021")) Lemmas 4.9–4.10. Those estimates are stated away from both endpoints. Here the fixed terminal density and its first-order trace let us integrate all the way to time one; the argument below includes that endpoint step.

#thm([Lemma 4.6.])[
  (Weighted second-order estimates).  #emph[For every bounded set $E$ and $0 < delta < 1$, 
#[#set math.equation(numbering: n => "(4.16)")
 $ integral_delta^1 #h(-0.16667em) integral_E rho^c (\| H_(b^c) \|^2 + \| H_(theta^c) \|^2 + \| Delta b^c \|^2 + \| Delta theta^c \|^2 + frac(\| w_c \|^4, c^2)) thin upright(d) m thin upright(d) t lt.eq C_(delta \, E) . $ <heat:weighted-estimate>]

 Furthermore, for every fixed $T in L^2 \( \( delta \, 1 \) times E \)$, 
#[#set math.equation(numbering: n => "(4.17)")
 $ integral_delta^1 #h(-0.16667em) integral_E rho^c \| w_c \|^2 \| T \|^2 thin upright(d) m thin upright(d) t arrow.r 0 . $ <heat:weighted-small-w>]

]
] <heat:weighted-estimates>

#proof[
  #emph[The integrated Bochner identity.] Choose a nonnegative space-time cutoff $chi$, zero for $t lt.eq delta \/ 2$, equal to one on $\[ delta \, 1 \] times E$, and compactly supported in space, such that
  $ \| partial_t chi \| + \| nabla chi \| + \| Delta chi \| lt.eq C sqrt(chi) . $
  For example take fourth powers of a smooth time cutoff and a good spatial test cutoff. We first work on an interval with terminal time $T < 1$. The equations and the definition of $Gamma_2$ yield
  #[#set math.equation(numbering: n => "(4.18)")
   $ frac(d, d t) integral rho chi Delta theta thin upright(d) m =  & integral rho \( partial_t chi + chevron.l nabla chi \, v_c chevron.r \) Delta theta thin upright(d) m\
 & - #scale(x: 120%, y: 120%)[\(] Gamma_2 \( theta \) + Gamma_2 \( b \) #scale(x: 120%, y: 120%)[\)] \( rho chi \) - integral rho Delta b #scale(x: 120%, y: 120%)[\(] c Delta chi + chevron.l nabla chi \, w_c chevron.r #scale(x: 120%, y: 120%)[\)] thin upright(d) m . $ <heat:weighted-bochner-identity>]
  To check the last term, put $q = Delta b$. Twice integrating by parts, using $nabla rho = rho w_c \/ c$, gives
  $ integral rho chi \( chevron.l w_c \, nabla q chevron.r + c Delta q \) = integral rho q \( chevron.l w_c \, nabla chi chevron.r + c Delta chi \) . $
  This identity is distributional; $q$ is locally Sobolev and bounded, and the required multipliers are admitted by the Bochner measure calculus. Thus (4.18) does not assume a pointwise fourth derivative.
  #emph[Weighted second-order bounds.] Average (2.4) and (2.4). For either $z = b \, theta$,
  $ Gamma_2 \( z \) gt.eq (K \| nabla z \|^2 + 1 / 2 \| H_z \|^2 + frac(1, 2 n) \| Delta z \|^2) m . $
  The two cutoff terms in (4.18) are bounded by $epsilon integral rho chi \( \| Delta b \|^2 + \| Delta theta \|^2 \)$ plus a constant, using (4.10), (4.14), and Young’s inequality. The possibly negative $K$-terms have the same harmless bound. At the initial endpoint the primitive is zero. At the terminal endpoint its limit is
  $ - integral nabla \( f chi_1 \) dot.op #scale(x: 120%, y: 120%)[\(] nabla phi.alt_1 + c nabla log f #scale(x: 120%, y: 120%)[\)] thin upright(d) m \, $
  which is bounded uniformly in $c$. This follows from (4.12); no Hessian of $log f$ is needed. After absorption, let $T arrow.t 1$. Monotone convergence for the squared terms gives the first four bounds in (4.16). In particular these bounds also hold uniformly for all shorter terminal intervals.
  #emph[The fourth-order bound.] Choose a spatial cutoff $eta$ equal to one on $E$, with $\| nabla eta \| lt.eq C sqrt(eta)$. The divergence of $rho eta \| w_c \|^2 w_c$ gives
  $ 1 / c integral rho eta \| w_c \|^4 =  & - integral rho eta #scale(x: 120%, y: 120%)[\(] \| w_c \|^2 Delta b + 2 H_b \( w_c \, w_c \) #scale(x: 120%, y: 120%)[\)]\
 & - integral rho \| w_c \|^2 chevron.l w_c \, nabla eta chevron.r . $
  All terms are integrable on interior intervals by local test calculus. Integrate in time and then exhaust the terminal interval. If $A_c = integral_delta^1 integral rho eta \| w_c \|^4$, Cauchy–Schwarz and the bounds just proved show $A_c \/ c lt.eq C sqrt(A_c)$. For the cutoff term use also the uniform bound on $w_c$ and the mass bound. Hence $A_c lt.eq C^2 c^2$, proving the last estimate.
  #emph[Vanishing weighted products.] It follows that $integral_delta^1 integral_E rho^c \| w_c \|^2 arrow.r 0$. For (4.17), truncate the fixed function $T$: on ${ \| T \| lt.eq A }$ use this convergence, and on its complement use the uniform bounds on $rho^c \, w_c$. The latter contribution is bounded by $C integral_({ \| T \| > A }) \| T \|^2$, which tends to zero as $A arrow.r oo$. ◻
]

=== 4.3 A distributional Riccati calculation <a-distributional-riccati-calculation>

Fix $0 < delta < 1$ and an admissible trial (4.1). The field and its time derivatives are bounded and have a common compact support, while $nabla Y_t \, "div" Y_t \, nabla "div" Y_t$ have the stated $L^2$ regularity, uniformly in time. A bound on $"div" Y_t$ in $L^oo$ is not assumed.

Whenever a local heat potential or the density occurs in a curvature evaluation with $Y$, it is multiplied by test cutoffs unchanged on a neighborhood of the common support of $Y$. Lemma 20 and Remark 3 then make all fields and nonnegative multipliers admissible in (B). Locality and tensoriality make the result independent of the cutoffs.

#thm([Lemma 4.7.])[
  (Weak differentiated-Hessian identity).  #emph[Let $z$ be a local test function, $a = nabla z$, $Y$ a compact test gradient, and $h$ a compact Lipschitz multiplier. Define 
#[#set math.equation(numbering: n => "(4.19)")
 $ \( nabla_a H_z \) \( Y \, Y \) \( h \) = - integral H_z \( Y \, Y \) "div" \( h a \) thin upright(d) m - 2 integral h H_z \( nabla_a Y \, Y \) thin upright(d) m \, $ <heat:covariant-hessian-distribution>]

 whenever these products are integrable. Then 
#[#set math.equation(numbering: n => "(4.20)")
 $ H_(\| a \|^2 \/ 2) \( Y \, Y \) \( h \) = \( nabla_a H_z \) \( Y \, Y \) \( h \) + integral h \| H_z Y \|^2 thin upright(d) m + R \( Y \, a \, a \, Y \) \( h \) . $ <heat:riccati-algebra>]

 For the heat potentials and density of Lemma 20, every admissible trial satisfies on $\( delta \, 1 \)$ 
#[#set math.equation(numbering: n => "(4.21)")
 $ frac(d, d t) integral rho H_theta \( Y \, Y \) thin upright(d) m =  & integral rho [2 H_theta \( partial_t Y + nabla_(v_c) Y \, Y \) - \| H_theta Y \|^2] thin upright(d) m\
 & - R \( Y \, v_c \, v_c \, Y \) \( rho \) - H_(\| w_c \|^2 \/ 2 + c Delta b) \( Y \, Y \) \( rho \) . $ <heat:riccati-evolution>]

]
] <heat:riccati-identity>

#proof[
  All assertions are local, so first insert the cutoffs just described. Since $nabla_a a = H_z a = nabla \( \| a \|^2 \/ 2 \)$, the first two terms of the defining expression for $R \( Y \, a \, a \, Y \) \( h \)$ sum to $H_(\| a \|^2 \/ 2) \( Y \, Y \) \( h \)$. Its other terms sum to
  $ integral "div" \( h a \) H_z \( Y \, Y \) + 2 h H_z \( nabla_a Y \, Y \) - h \| H_z Y \|^2 thin upright(d) m \, $
  because $\[ Y \, a \] = H_z Y - nabla_a Y$. This is exactly (4.20). The calculation uses Hessian symmetry and first-order products only; it does not require a third covariant derivative of $z$.
  For fixed $c$, on a compact interior time interval the pairing on the left of (4.21) is absolutely continuous. This follows from local graph-norm differentiation of $theta$, the Hessian estimate, and local boundedness of $partial_t rho$. Differentiate that pairing, use $partial_t rho = - "div" \( rho v_c \)$, and interpret its contraction against $H_theta$ through (4.19). Thus no continuity equation is being tested against an unproved Sobolev representative of $H_theta \( Y \, Y \)$. Substitute (4.11) and apply (4.20) to $z = theta$. The $nabla_(v_c) H_theta$ terms cancel, leaving (4.21). ◻
]

Completing the square in (4.21) and applying the tensor lower bound give the desired index integrand, except for the last Hessian term. We need a uniform lower bound tending to zero for its time integral. Smallness of $w_c$ alone does not suffice: differentiating $rho$ introduces $1 \/ c$. The next calculation cancels these terms before estimating the remaining Sobolev products; its singular measure term is controlled by the one-sided bound for $c Delta b$.

#thm([Lemma 4.8.])[
  (A uniform lower bound for the acceleration error).  #emph[For every admissible trial $Y$, there are numbers $epsilon_c arrow.r 0$ such that, for every $delta < T < 1$, 
#[#set math.equation(numbering: n => "(4.22)")
 $ integral_delta^T H_(\| w_c \|^2 \/ 2 + c Delta b^c) \( Y_t \, Y_t \) \( rho_t^c \) thin upright(d) t gt.eq - epsilon_c . $ <heat:error-lower-bound>]

 The bound is independent of the terminal exhaustion parameter $T$.]
] <heat:error-cancellation>

#proof[
  #emph[Exact cancellations.] We work first at fixed $c$ and at an interior time, suppressing these parameters. By (4.20) with $z = b$, the error is the sum of
  $ integral rho \| H_b Y \|^2 thin upright(d) m \, #h(2em) R \( Y \, w \, w \, Y \) \( rho \) \, #h(2em) I = \( nabla_w H_b \) \( Y \, Y \) \( rho \) + c H_(Delta b) \( Y \, Y \) \( rho \) . $
  The first term is nonnegative. The curvature bound gives $R \( Y \, w \, w \, Y \) \( rho \) gt.eq kappa integral rho \| Y and w \|^2 thin upright(d) m$, whose possible negative contribution tends to zero after time integration by (4.17).
  We examine $I$. Formula (4.19) and $nabla rho = rho w \/ c$ give
  #[#set math.equation(numbering: n => "(4.23)")
   $ \( nabla_w H_b \) \( Y \, Y \) \( rho \) = - integral rho [2 H_b \( nabla_w Y \, Y \) + H_b \( Y \, Y \) (Delta b + frac(\| w \|^2, c))] thin upright(d) m . $ <heat:error-transport>]
  Put $D = "div" Y$, $A = nabla_Y Y$, and $alpha = Y b = chevron.l Y \, w chevron.r$. Twice using the definition of the distributional Hessian gives
  #[#set math.equation(numbering: n => "(4.24)")
   $ c H_(Delta b) \( Y \, Y \) \( rho \) =  & integral c Delta b thin ["div" #scale(x: 120%, y: 120%)[\(] Y "div" \( rho Y \) #scale(x: 120%, y: 120%)[\)] + "div" \( rho A \)]\
=  & integral rho Delta b [H_b \( Y \, Y \) + alpha^2 / c + 2 chevron.l w \, A chevron.r + 2 alpha D + c #scale(x: 120%, y: 120%)[\(] D^2 + Y D + "div" A #scale(x: 120%, y: 120%)[\)]] . $ <heat:error-double-divergence>]
  The last divergence is a measure, not necessarily a function. Its product with $rho c Delta b$ is understood using quasi-continuous representatives.
  To justify (4.24) for the actual test class, observe that the function $"div" \( rho Y \) = rho D + rho alpha \/ c$ belongs locally to $W^(1 \, 2)$. The product rule for its product with the bounded field $Y$, proved first after truncation, gives an $L^1$ divergence. The multiplier $Delta b$ is locally bounded Sobolev, so the truncations pass by $L^2$ pairing for the gradient term and dominated convergence for the divergence term. Also $A = nabla \( \| Y \|^2 \/ 2 \)$, whose divergence is the Bochner Laplacian measure; multiplication by the Lipschitz function $rho$ obeys its usual weak product rule. Expanding $Y alpha = H_b \( Y \, Y \) + chevron.l w \, A chevron.r$ gives the second line of (4.24).
  The terms $rho Delta b H_b \( Y \, Y \)$ in (4.23) and (4.24) cancel. There is a second exact cancellation:
  #[#set math.equation(numbering: n => "(4.25)")
   $ integral rho #scale(x: 120%, y: 120%)[\(] alpha^2 Delta b - \| w \|^2 H_b \( Y \, Y \) #scale(x: 120%, y: 120%)[\)] thin upright(d) m = integral rho #scale(x: 120%, y: 120%)[\[] - 2 alpha chevron.l w \, nabla_w Y chevron.r + \| w \|^2 alpha D + \| w \|^2 chevron.l w \, A chevron.r #scale(x: 120%, y: 120%)[\]] thin upright(d) m . $ <heat:inverse-c-cancellation>]
  Indeed integration by parts in the first term on the left produces $- rho alpha^2 \| w \|^2 \/ c - 2 rho alpha H_b \( w \, Y \) - 2 rho alpha chevron.l w \, nabla_w Y chevron.r$. Writing $H_b \( Y \, Y \) = Y alpha - chevron.l w \, A chevron.r$ and integrating the negative Hessian term gives the opposites of the first two expressions, which cancel them, with the remaining terms displayed on the right of (4.25).
  #emph[The remaining Sobolev terms.] After division by $c$, each term on that right side is bounded in absolute value, on the whole time interval, by a constant times
  $ (integral_delta^1 #h(-0.16667em) integral_E rho frac(\| w \|^4, c^2))^(1 \/ 2) (integral_delta^1 #h(-0.16667em) integral_E rho \| w \|^2 \| T_0 \|^2)^(1 \/ 2) \, $
  where $E$ contains the common support and $T_0$ is a fixed $L^2$ coefficient formed from $nabla Y \, D$ and bounded trial fields. This tends to zero by Lemma 23. The remaining terms involving $H_b$ or $Delta b$, one factor $w$, and derivatives of $Y$ are bounded the same way, using their weighted $L^2$ bound in place of the first factor.
  #emph[The Bochner measure term.] It remains to control the final parenthesis in (4.24). Here $D$ is only $L^2$, so $D^2$ need not be an $L^2$ coefficient. We retain it in a nonnegative measure, to which the lower bound for $c Delta b$ applies, and leave an $L^2$ remainder. Since $Y = nabla g_t$, the required decomposition is
  #[#set math.equation(numbering: n => "(4.26)")
   $ D^2 + Y D + "div" A = cal(M)_t + ell_t m \, quad {cal(M)_t = \( Delta g_t \)^2 m + Gamma_2 \( g_t \) - K \| Y_t \|^2 m gt.eq 0 \,\
ell_t = 2 chevron.l Y_t \, nabla Delta g_t chevron.r + K \| Y_t \|^2 . $ <heat:positive-measure-split>]
  Here $ell_t$ has a uniformly bounded local $L^2$ norm. The measures $cal(M)_t$ have uniformly bounded mass on $E$: polarize $Gamma_2$ on the fixed finite list of test potentials and use boundedness of the smooth temporal coefficients. Equivalently, test their defining formula with a fixed outer cutoff. Thus no $L^4$ bound on $D$ is used.
  #emph[Time measurability and terminal uniformity.] To justify time integration of the singular part, fix a compact neighborhood $E_(*)$ of the trial support and define the finite signed coefficient measures and their common dominating measure by
  $ cal(M)_(i j) = \( Delta g_i \) \( Delta g_j \) m + Gamma_2 \( g_i \, g_j \) - K chevron.l nabla g_i \, nabla g_j chevron.r m \, #h(2em) Lambda = sum_(i \, j) \| cal(M)_(i j) \| \|_(E_(*)) . $
  Every coefficient measure neglects polar sets. The identity $cal(M)_t = sum_(i \, j) a_i \( t \) a_j \( t \) cal(M)_(i j)$ shows that $cal(M)_t \|_(E_(*))$ has a jointly measurable, uniformly bounded $Lambda$-density.
  Choose a compact test cutoff $chi = 1$ near $E_(*)$. At fixed $c$, on each compact interior time interval, $chi rho_t c Delta b_t$ is strongly continuous in $W^(1 \, 2)$ and has a common $L^oo$ bound. Indeed, for either positive heat factor $U$, the spatial formula
  $ nabla Delta log U = frac(nabla Delta U, U) - frac(Delta U nabla U, U^2) - frac(2 H_U nabla U, U^2) + frac(2 \| nabla U \|^2 nabla U, U^3) $
  expresses the derivative using bounded Lipschitz heat powers, local positive lower bounds, and the strongly locally $L^2$-continuous Hessian $H_U$. The latter continuity follows from the Laplacian graph estimate; continuity of the other factors follows by integrating the next generator powers. The fixed cutoff and $rho_t$ preserve these Sobolev continuity and boundedness properties.
  Strong Sobolev convergence with a common bound has quasi-everywhere convergent subsequences. Since $Lambda$ is finite and neglects polar sets, dominated convergence and the subsequence criterion give continuity of these quasi-continuous multipliers in $L^1 \( Lambda \)$. Choose a jointly measurable representative of this curve. At almost every time it agrees $Lambda$-almost everywhere with the quasi-continuous multiplier. The lower bound for $c Delta b_t$ therefore holds $Lambda$-almost everywhere at each admissible time, and Fubini applies without an uncountable union of polar exceptional sets. All the bounds in this paragraph are only fixed-$c$, interior-time bounds.
  The quasi-continuous lower bound in (4.14), and the density bound there, give
  $ integral rho_t c Delta b_t thin upright(d) cal(M)_t gt.eq - C_delta e_c \( t \) cal(M)_t \( E \) . $
  Bochner measures neglect polar sets, so an almost-everywhere bound on the Sobolev multiplier has been used here only after passing to its quasi-continuous representative. In particular, for every $T < 1$,
  $ integral_delta^T #h(-0.16667em) integral rho_t c Delta b_t thin upright(d) cal(M)_t thin upright(d) t gt.eq - C_delta sup_t cal(M)_t \( E \) parallel e_c parallel_(L^1 \( delta \, 1 \)) . $
  This lower error bound tends to zero uniformly in $T$. The absolutely continuous remainder is bounded by
  $ c (integral_delta^1 #h(-0.16667em) integral_E rho \| Delta b \|^2)^(1 \/ 2) (integral_delta^1 #h(-0.16667em) integral_E rho \| ell_t \|^2)^(1 \/ 2) arrow.r 0 . $
  The Sobolev remainders were estimated in absolute value on $\( delta \, 1 \)$, and the remaining measure contribution was bounded below using $parallel e_c parallel_(L^1 \( delta \, 1 \))$. After discarding the nonnegative terms, these bounds hold with the same error for every $T < 1$, proving (4.22). ◻
]

#thm([Proposition 4.9.])[
  (The viscous index estimate).  #emph[If the trial (4.1) satisfies $Y_delta = 0$, then 
#[#set math.equation(numbering: n => "(4.27)")
 $ H_(phi.alt_1^c + c log f) \( Y_1 \, Y_1 \) \( f \) lt.eq integral_delta^1 #h(-0.16667em) integral rho_t^c (\| partial_t Y + nabla_(v_c) Y \|^2 - kappa \| Y and v_c \|^2) thin upright(d) m thin upright(d) t + epsilon_c \, $ <heat:viscous-index-estimate>]

 where $epsilon_c arrow.r 0$.]
] <heat:viscous-index>

#proof[
  Integrate (4.21) from $delta$ to $T < 1$. The initial pairing vanishes. Apply (B) to its curvature term and use
  $ 2 H_theta \( D_c Y \, Y \) - \| H_theta Y \|^2 lt.eq \| D_c Y \|^2 \, #h(2em) D_c Y = partial_t Y + nabla_(v_c) Y . $
  Lemma 25 bounds the last term uniformly in $T$. The resulting right-hand side is integrable up to one, by boundedness of $rho \, v_c$ and the fixed $L^2$ derivatives of $Y$.
  For the terminal left-hand side, use the first-order expression (2.3). The convergences (4.12) imply strong local $L^2$ convergence of $"div" \( rho_t Y_t \)$ to $"div" \( f Y_1 \)$, and of the gradients of $theta_t$ to that of $phi.alt_1^c + c log f$. The bounded density and field factors converge uniformly on the compact support. Both products in (2.3) therefore converge in $L^1$. Let $T arrow.t 1$, with $c$ still fixed. This proves (4.27). The remaining limits will be taken successively: first $c arrow.b 0$, and then removal of the positive terminal perturbation $lambda macron(f)$ by $lambda arrow.b 0$. ◻
]

=== 4.4 The zero-viscosity transport limit <the-zero-viscosity-transport-limit>

The viscous index estimate is now proved. It remains to identify the limiting calibrated paths and to pass their index energy to the limit. Because that energy is quadratic in the velocity, weak convergence alone is insufficient. The action identity below will give the required strong convergence in the density-weighted norm.

#thm([Lemma 4.10.])[
  (The logarithmic heat limit).  #emph[As $c arrow.b 0$, 
#[#set math.equation(numbering: n => "(4.28)")
 $ phi.alt_t^c arrow.r Phi_t = Q_t u quad upright("locally uniformly on ") \( 0 \, 1 \] times M . $ <heat:potential-limit>]

 At each fixed positive time the convergence is also weak in $W_(upright("loc"))^(1 \, 2)$.]
] <heat:laplace-principle>

#proof[
  Use the two-sided Gaussian bounds with exponents $4 - eta$ and $4 + eta$, for any fixed $0 < eta < 1$, and heat time $c t$. The kernel is symmetric, so the volume factor can be taken to be $m \( B_(sqrt(c t)) \( x \) \)$ at the evaluation point. These are the bounds of #cite(label("JiangLiZhang2016")) Theorem 1.2, after weakening the Ricci bound to a negative one if needed.
  Here are the two Laplace estimates with their uniformity specified. Fix $t in \[ alpha \, 1 \]$ and $x$ in a compact set. In the upper kernel bound reserve a small fixed fraction $tau > 0$ of its Gaussian exponent. Taking the infimum of the other part of the exponent gives
  $ H_t^c \( x \) lt.eq C_(eta \, tau) exp [- frac(1, 2 c) Q_(\( 4 + eta \) t \/ \( 4 \( 1 - tau \) \)) u \( x \)] . $
  Indeed the integral of the reserved Gaussian, divided by $m \( B_(sqrt(c t)) \( x \) \)$, is uniformly bounded by the annular volume-comparison estimate used in Lemma 21. For the lower kernel bound, choose a minimizer for the corresponding modified quadratic cost and integrate over a small ball of fixed radius $r > 0$ around it. Boundedness of $u$ keeps all these minimizers in a common compact set. The Lipschitz bound for $u$, and the bounded distance of the minimizers from $x$, change the exponent by at most $C_alpha r$. The logarithm of the volume prefactor, multiplied by $c$, tends to zero uniformly: on the compact region, Bishop–Gromov and full support bound small-ball volumes below by a fixed multiple of the $n$-th power of the radius, and above by a fixed finite constant. Thus
  $ limsup_(c arrow.b 0) phi.alt_t^c \( x \) lt.eq Q_(\( 4 - eta \) t \/ 4) u \( x \) + C_alpha r \, $
  uniformly on the compact parameter set. Send first $c arrow.b 0$, then $r \, eta \, tau arrow.b 0$. The quadratic infima vary uniformly with their time parameter on compact positive-time intervals, since their minimizers have uniformly bounded distance. The two estimates give (4.28). Finally the uniform spatial Lipschitz bound gives weak local Sobolev compactness; closure of the differential identifies its limit with $nabla Phi_t$. ◻
]

We next justify compactness of the density curves, including the second-moment issue. The relevant continuity-equation criterion is #cite(label("GigliHan2015")) Theorem 3.5: for a $W_2$-continuous curve with bounded compression, its Sobolev continuity functional controls its metric derivative. We establish the required $W_2$ continuity before applying that criterion.

#thm([Lemma 4.11.])[
  (Compactness with uniform moment tails).  #emph[For each $0 < delta < 1$, the probability curves $mu_t^c = rho_t^c m$ are uniformly Lipschitz in $W_2$ on $\[ delta \, 1 \]$, with a constant independent of $c$. Their second moments are uniformly integrable. Consequently, from any sequence $c arrow.b 0$ one can extract a subsequence such that $mu_t^c$ converges uniformly in $W_2$ on every compact positive-time interval, including time one, to a curve $mu_t = nu_t m$. Moreover, $0 lt.eq nu_t lt.eq C_delta$ on $\[ delta \, 1 \]$.]
] <heat:curve-compactness>

#proof[
  Let $L$ be the velocity bound in (4.10) and $r \( x \) = d \( o \, x \)$. For a bounded nondecreasing Lipschitz function $chi$ that is constant at large arguments, the continuity equation, first with compact spatial tests and then after subtracting that constant, gives for $s lt.eq t lt.eq 1$
  $ frac(d, d t) integral chi \( r + L \( t - s \) \) thin upright(d) mu_t^c = integral chi' \( r + L \( t - s \) \) #scale(x: 120%, y: 120%)[\(] L + chevron.l nabla r \, v_c chevron.r #scale(x: 120%, y: 120%)[\)] thin upright(d) mu_t^c gt.eq 0 . $
  Compact Lipschitz tests are admitted by their strong Sobolev test approximations. At time one, local convergence of the density and preservation of its total mass justify the limit for these tests. Hence
  #[#set math.equation(numbering: n => "(4.29)")
   $ integral chi \( r \) thin upright(d) mu_s^c lt.eq integral chi \( r + L \( 1 - s \) \) f thin upright(d) m . $ <heat:radial-domination>]
  Approximate $r^2$ and then $r^2 upright(bold(1))_({ r > R })$ monotonically by such functions. The first choice proves finiteness of the moments, and the second gives
  #[#set math.equation(numbering: n => "(4.30)")
   $ sup_(c \, thin s in \[ delta \, 1 \]) integral_({ r > R }) r^2 thin upright(d) mu_s^c lt.eq integral_({ r > R - L }) \( r + L \)^2 f thin upright(d) m arrow.r 0 . $ <heat:uniform-moment-tails>]
  The same bound also gives tightness.
  The explicit heat factors give continuity against compact tests on the interior and at the terminal endpoint. Tightness gives narrow continuity, and (4.30) upgrades it to $W_2$ continuity. The weak continuity equation extends to every $h in W^(1 \, 2)$, with functional
  $ cal(L)_t^c \( h \) = integral chevron.l nabla h \, v_c chevron.r rho_t^c thin upright(d) m \, #h(2em) \| cal(L)_t^c \( h \) \| lt.eq (integral rho_t^c \| v_c \|^2 thin upright(d) m)^(1 \/ 2) (integral rho_t^c \| nabla h \|^2 thin upright(d) m)^(1 \/ 2) . $
  To see this extension, approximate $h$ in $W^(1 \, 2)$ by compact tests; the density bound makes the errors uniform in time on $\[ delta \, 1 \]$.
  For the exact domain in the cited continuity-equation criterion, write $S^2 \( M \)$ for the Sobolev class with square-integrable weak gradient, without requiring the function itself to belong to $L^2$. The same formula defines $cal(L)_t^c$ on all of $S^2 \( M \)$, with the displayed dual-seminorm bound. The integrated continuity equation holds for every $h in L^1 \( m \) ∩ S^2 \( M \)$: set $h_M = max { - M \, min { h \, M } }$. Then $\| h_M \|^2 lt.eq M \| h \|$, so $h_M in W^(1 \, 2)$, and
  $ nabla h_M = upright(bold(1))_({ \| h \| < M }) nabla h \, #h(2em) h_M arrow.r h upright(" in ") L^1 \, #h(2em) nabla h_M arrow.r nabla h upright(" in ") L^2 . $
  Locality makes the choice on the threshold level sets irrelevant. Bounded compression gives
  $ sup_(t in \[ delta \, 1 \]) lr(|integral \( h_M - h \) thin upright(d) mu_t^c|) lt.eq C_delta parallel h_M - h parallel_1 arrow.r 0 \, $
  while, on any fixed positive-time interval $I$,
  $ integral_I \| cal(L)_t^c \( h_M - h \) \| thin upright(d) t lt.eq L sqrt(C_delta) \| I \| parallel nabla h_M - nabla h parallel_2 arrow.r 0 . $
  Thus the integrated identity passes for every pair of times, with finite scalar integrals and an absolutely continuous representative. The identical argument applies to the limiting gradient functional with $nu \, V$ below, since it has the same density and velocity bounds. The continuity-equation criterion now gives $\| dot(mu)_t^c \| lt.eq L$ almost everywhere. Finally properness, the uniform moment tails, and Arzelà–Ascoli in $cal(P)_2 \( M \)$ give the claimed subsequence. The bound on the limiting densities follows by testing their narrow limit against compact continuous nonnegative functions. A diagonal choice handles intervals with arbitrarily small positive left endpoint. ◻
]

#thm([Lemma 4.12.])[
  (The action identity and its limiting equality).  #emph[Along a subsequence as in Lemma 28, there is a measurable vector field $V_t$, with $\| V_t \| lt.eq L$ $nu_t thin upright(d) t thin upright(d) m$-almost everywhere, such that $partial_t nu + "div" \( nu V \) = 0$. For every $0 < alpha < beta lt.eq 1$, 
#[#set math.equation(numbering: n => "(4.31)")
 $ [integral phi.alt_t^c rho_t^c thin upright(d) m]_alpha^beta & = 1 / 2 integral_alpha^beta #h(-0.16667em) integral rho_t^c \| nabla phi.alt_t^c \|^2 thin upright(d) m thin upright(d) t\
 & = 1 / 2 integral_alpha^beta #h(-0.16667em) integral rho_t^c \| v_c \|^2 thin upright(d) m thin upright(d) t + o \( 1 \) . $ <heat:exact-action-identity>]

 The limiting curves are constant-speed Wasserstein geodesics on these intervals, and 
#[#set math.equation(numbering: n => "(4.32)")
 $ integral_alpha^beta #h(-0.16667em) integral rho_t^c \| v_c - V_t \|^2 thin upright(d) m thin upright(d) t arrow.r 0 . $ <heat:strong-weighted-velocity>]

 For every fixed $L^2$ tensor coefficient $T$, compactly supported in space-time in $\[ alpha \, beta \] times M$, 
#[#set math.equation(numbering: n => "(4.33)")
 $ integral_alpha^beta #h(-0.16667em) integral rho_t^c \| T \( v_c - V_t \) \|^2 thin upright(d) m thin upright(d) t arrow.r 0 . $ <heat:strong-coefficient-velocity>]

]
] <heat:action-limit>

#proof[
  On $\[ alpha \, beta \]$ the fluxes $j_c = rho^c v_c$ are bounded in the fixed Hilbert space $L^2 \( thin upright(d) t thin upright(d) m \; T M \)$, since $integral \| j_c \|^2 lt.eq C_alpha integral rho^c \| v_c \|^2$. Extract a weak flux limit $j$, and a weak-\* density limit $rho^c harpoon.rt^(*) nu$ in $L^oo \( thin upright(d) t thin upright(d) m \)$. The latter agrees with the curve limit. Testing the convex inequality $\| j_c \| lt.eq L rho^c$ against bounded fields of bounded support gives $\| j \| lt.eq L nu$. Define $V = j \/ nu$ on ${ nu > 0 }$ and zero elsewhere. The continuity equation passes to the limit. Its kinetic lower semicontinuity follows, for example, from
  $ integral nu \| V \|^2 = sup_Z integral #scale(x: 120%, y: 120%)[\(] 2 chevron.l j \, Z chevron.r - nu \| Z \|^2 #scale(x: 120%, y: 120%)[\)] \, $
  where the supremum is over bounded $L^2$ fields with bounded support.
  For the first equality in (4.31), write $a = nabla phi.alt$ and use $v_c = a + w_c$. The equations give
  $ frac(d, d t) integral phi.alt rho thin upright(d) m = integral rho [- 1 / 2 \| a \|^2 + c Delta phi.alt + chevron.l a \, a + w_c chevron.r] thin upright(d) m = 1 / 2 integral rho \| a \|^2 thin upright(d) m \, $
  because $c integral rho Delta phi.alt = - integral rho chevron.l w_c \, a chevron.r$. One first uses spatial cutoffs. For fixed $c$, their errors vanish by mass integrability, boundedness of $phi.alt \, a$, and $\| nabla rho \| lt.eq C_c rho$. The identity extends to $beta = 1$ using the terminal traces and bounded gradients; no Laplacian bound at exactly time one is needed. The difference between the actions of $a$ and $v_c$ tends to zero on bounded spatial regions by Lemma 23. On their complement it is bounded by a constant times the density mass, uniformly small by (4.30). This proves the second equality.
  Put $h = beta - alpha$ and
  $ A = integral Phi_beta thin upright(d) mu_beta - integral Phi_alpha thin upright(d) mu_alpha . $
  The bounded potentials, local uniform convergence, and tightness identify this with the limit of the left side of (4.31). The Hopf–Lax semigroup property says $Phi_beta \( y \) - Phi_alpha \( x \) lt.eq d^2 \( x \, y \) \/ \( 2 h \)$. The continuity-equation criterion and action lower semicontinuity therefore give the sandwich
  #[#set math.equation(numbering: n => "(4.34)")
   $ frac(W_2^2 \( mu_alpha \, mu_beta \), h) & lt.eq integral_alpha^beta \| dot(mu)_t \|^2 thin upright(d) t lt.eq integral_alpha^beta #h(-0.16667em) integral nu \| V \|^2 thin upright(d) m thin upright(d) t\
 & lt.eq liminf_(c arrow.b 0) integral_alpha^beta #h(-0.16667em) integral rho^c \| v_c \|^2 thin upright(d) m thin upright(d) t = 2 A lt.eq frac(W_2^2 \( mu_alpha \, mu_beta \), h) . $ <heat:action-sandwich>]
  Thus all inequalities are equalities. Equality in the metric action bound proves the geodesic assertion and equality of the velocity norms.
  To turn norm convergence into (4.32), expand the square. For its cross term, test the weak flux convergence against $V upright(bold(1))_(B_R \( o \))$; for its last term, test the density convergence against $\| V \|^2 upright(bold(1))_(B_R \( o \))$. These are fixed admissible tests in the appropriate spaces. Boundedness of the velocities and tightness let $R arrow.r oo$. The resulting limit is zero by equality of actions in (4.34).
  Finally, for any $A_0 > 0$,
  $ integral rho^c \| T \( v_c - V \) \|^2 lt.eq A_0^2 integral rho^c \| v_c - V \|^2 + 4 L^2 C_alpha integral_({ \| T \| > A_0 }) \| T \|^2 . $
  First let $c arrow.b 0$, then $A_0 arrow.r oo$. This proves (4.33). ◻
]

#thm([Lemma 4.13.])[
  (Common calibrated paths and their velocities).  #emph[There is a Borel prescription $S : x mapsto S \( x \) in "Geo" \( M \)$, defined outside one $m$-null set and with $S \( x \)_1 = x$, such that $S \( x \)$ satisfies (4.2). For every $f in cal(F)$, the limiting density curves are the marginals of $pi_f = S_(\#) \( f m \)$. These plans have speed bounded by $sqrt(2 "osc" \( u \))$ and bounded compression on each $\[ delta \, 1 \]$. Their forward path velocities agree with the pullback of the vector field $V$ in Lemma 29; in particular there is no conditional averaging loss. The same prescription defines $pi_f$ for every nonnegative compactly supported Lipschitz datum, with the same speed and positive-time compression properties.]
] <heat:common-paths>

#proof[
  Initially normalize $f in cal(F)$ to mass one. Equality (4.34) on every positive-time interval makes $mu_t$ a consistent constant-speed Wasserstein geodesic. Its speed is bounded, so completeness of $cal(P)_2 \( M \)$ extends it to time zero. A dynamical optimal plan represents this geodesic; one may use metric superposition #cite(label("GigliHan2015")) Proposition 2.1 and equality of endpoint cost and path action. Since $parallel Q_t u - u parallel_oo lt.eq t "Lip" \( u \)^2 \/ 2$, the dual equalities in (4.34) pass to time zero and give
  $ integral Phi_1 f thin upright(d) m - integral u thin upright(d) mu_0 = 1 / 2 W_2^2 \( mu_0 \, f m \) . $
  The nonnegative pointwise duality gap therefore vanishes on almost every path, proving (4.2) for this plan. Its individual path lengths are bounded by $sqrt(2 "osc" \( u \))$. The positive-time compression is the limiting bound $nu_t lt.eq C_delta$.
  We specify the identification with $V$. On a positive-time interval the plan is a test plan. Its pullback velocity, defined by differentiation of Sobolev functions, has norm equal to the metric path speed #cite(label("GigliDifferentialStructure")) Theorem/Definition 2.33. Let $W$ be its conditional average given $\( t \, gamma_t \)$. It solves the same continuity equation and its action is at most the path action, by conditional Cauchy–Schwarz. The kinetic lower bound makes this an equality. Both $V$ and $W$ solve the same equation; apply the same lower bound to $\( V + W \) \/ 2$ and use the parallelogram identity. Equality of their actions with the minimum forces $V = W$. Equality in conditional Cauchy–Schwarz then identifies the pullback velocity itself with $V_t \( gamma_t \)$ almost everywhere. Separability of the tangent module, available on this RCD space, permits the conditional-average construction by a countable family of module generators.
  The prescription is independent of the positive datum. Take two normalized calibrated plans, reverse their time orientation, and form their equally weighted mixture. The mixture is still calibrated, and hence is optimal from its absolutely continuous initial measure, which is the mixture of the two terminal densities, to its other endpoint measure. The latter has finite second moment and may be singular. Uniqueness of dynamical optimal transport from an absolutely continuous measure #cite(label("GigliRajalaSturm2016")) Theorem 1.1 forces this reversed mixture to be induced by a map into whole geodesics. Disintegration consequently forces both component plans to choose the same path wherever their terminal densities overlap. Positive members of $cal(F)$ are equivalent to $m$, so this agreement holds $m$-almost everywhere.
  Fix the reference datum proportional to $macron(f)$ and choose its resulting Borel map $S$. The argument just given shows that every heat limit for every positive datum is $S_(\#) \( f m \)$, after restoring mass. The prescribed-potential uniqueness theorem #cite(label("GigliRajalaSturm2016")) Theorem 1.3 applied to the $c$-concave potential $Q_1 u$, $c = d^2 \/ 2$, also gives uniqueness of the calibrated path for almost every terminal point.
  For a compact datum $f_0 gt.eq 0$, the ratio $f_0 \/ macron(f)$ is bounded. Thus $S_(\#) \( f_0 m \)$ is boundedly dominated by the reference plan. This proves its compression assertion and transfers its path-velocity representative. In particular one can choose this representative using the reference plan once and for all. Restriction to a bounded set of terminal points preserves all these statements and, by the speed bound, gives bounded spatial support on positive-time intervals. ◻
]

#proof[
  First take $f in cal(F)$. On the common compact support of the trial, Lemma 27 and the uniform gradient bounds imply
  $ H_(phi.alt_1^c + c log f) \( Z \, Z \) \( f \) arrow.r H_(Phi_1) \( Z \, Z \) \( f \) . $
  Indeed (2.3) pairs the gradient of its potential with fixed $L^2$ coefficients; weak local Sobolev convergence suffices. The additional gradient $c nabla log f$ converges uniformly to zero.
  For the right side of (4.27), use (4.33) with the fixed coefficient $nabla Y$. It replaces $nabla_(v_c) Y$ by $nabla_V Y$ strongly in the weighted $L^2$ norm. The remaining fixed squared expression is in $L^1 \( thin upright(d) t thin upright(d) m \)$ and has compact support, so weak-\* convergence of the densities passes its integral to the limit. The curvature term passes in the same way using boundedness of $Y$ and the velocities. Lemma 30 identifies the limiting expression with the path integral in (4.3). Let $c arrow.b 0$ in Proposition 26.
  Finally, for the desired compact datum $f_0$, use $f_lambda = f_0 + lambda macron(f)$. The common prescription gives $pi_(f_lambda) = pi_(f_0) + lambda pi_(macron(f))$. Both sides of the already established inequality are linear in the terminal data. All terms involving $macron(f)$ are finite, by compact support of the trial, bounded speed, and positive-time compression. Let $lambda arrow.b 0$. This proves (4.3), including the zero datum. ◻
]

== 5 Frames along geodesics and Hessian comparison <sec:frames>

Let $\( M \, d \, m \)$ be a full-support noncollapsed $upright("RCD") \( K \, n \)$ space, where $m = cal(H)^n$ and $n gt.eq 2$ is an integer. Subsections 5.1–5.2 use only these ambient assumptions. Their path calculus and trial approximation apply to optimal geodesic plans with bounded positions, bounded speed, and uniformly bounded compression throughout the interval in question. The sectional tensor lower bound enters the radial application in Subsection 5.3 through Theorem 18.

Theorem 18 bounds the distributional Hessian by the energies of global trials. To insert Jacobi trials, we need frames at every time on each positive-time interval along almost every calibrated geodesic. We construct a countable family of test gradients whose rank defect is avoided by almost every entire path, recover parallel transport by finite-dimensional ODEs, and obtain one countable catalog of global trials that is dense separately along almost every path. The common terminal-point prescription then lets us take the infimum of their energy functions at each terminal point, yielding the measure bound in Theorem 40.

Write $cal(R)_n$ for the set of points all of whose measured tangents are the normalized Euclidean $n$-space. Noncollapse implies $m \( M \\ cal(R)_n \) = 0$ and that the tangent module has dimension $n$ almost everywhere. We use the local volume estimate (2.5) and the local Poincaré inequality, with constants uniform on bounded regions.

A compact test function means an element of $"Test" \( M \)$ with compact support. A compact test gradient is the gradient of such a function. For locally Lipschitz $h$, we write $H_h = "Hess" h$ for the distributional functional (2.3). For a local potential, weights are compactly supported in its domain; locality makes the evaluation independent of an extension of $h$.

=== 5.1 A countable family of frames outside small exceptional sets <frames:sub-countable>

A frame defined almost everywhere may still fail at a time visited by a path. We therefore control the size of the set of regular points where every selected frame fails. The following proposition separates a polar set, needed to choose common Sobolev representatives, from a rank defect of vanishing $\( n - 1 \)$-dimensional Hausdorff measure. Lemma 34 will show that almost every entire bounded-speed, bounded-compression path avoids both sets.

#thm([Proposition 5.1.])[
  (Countable harmonic frames).  #emph[There is a countable family ${ g_j }_(j gt.eq 1)$ of compact test functions, a set $N$ of $2$-capacity zero, and a Borel set $S subset cal(R)_n \\ N$ with $cal(H)^(n - 1) \( S \) = 0$ such that the following holds. At every $x in cal(R)_n \\ \( N union S \)$, some $n$ members of ${ nabla g_j }$ have positive definite Gram matrix, evaluated in common precise Sobolev representatives. All finite Gram matrices are positive semidefinite and have rank at most $n$ outside $N$. Any prescribed countable family of compact test functions may be included among the $g_j$.]
] <frames:countable-frames>

The proof uses two content estimates. The first turns small local content into a Hausdorff-null set; the second bounds the content of a Gram-matrix rank defect by its Sobolev energy. Hausdorff content is defined using sums of powers of diameters; changes between radii and diameters will be absorbed in constants.

#thm([Lemma 5.2.])[
  (Small local content).  #emph[Let $E$ be a subset of a separable metric space and let $s > 0$. If 
#[#set math.equation(numbering: n => "(5.1)")
 $ cal(H)_oo^s \( E ∩ B \( x \, r \) \) = o \( r^s \) quad upright("as ") r arrow.b 0 quad upright("for every ") x in E \, $ <frames:vanishing-content>]

 then $cal(H)^s \( E \) = 0$. It suffices to assume (5.1) along all sufficiently small dyadic radii.]
] <frames:content-null>

#proof[
  Bounds along dyadic radii imply bounds at every radius by enlarging to a dyadic radius at most twice as large. Fix $epsilon > 0$, to be chosen sufficiently small in terms of $s$, and put
  $ E_j = { x in E : cal(H)_oo^s \( E ∩ B \( x \, r \) \) lt.eq epsilon r^s upright(" for every ") 0 < r < 1 \/ j } . $
  The sets $E_j$ cover $E$. Fix $x in E_j$ and $R < 1 \/ j$. A content cover of $E_j ∩ B \( x \, R \)$ can be recentered in $E_j$: discard covering sets not meeting this set and replace a covering set of positive diameter $d_i$ by a ball of radius $2 d_i$ centered at a point of its intersection with $E_j$. Replace singleton covering sets by balls with arbitrarily small positive total $s$-cost. Choosing the original cover within an arbitrarily small error of the content gives child balls $B \( x_i \, r_i \)$ with
  $ x_i in E_j \, #h(2em) sum_i r_i^s lt.eq theta R^s \, #h(2em) 0 < theta < 1 \, $
  provided $epsilon$ was chosen small enough. In particular $r_i lt.eq theta^(1 \/ s) R < 1 \/ j$.
  Repeat this procedure on $E_j ∩ B \( x_i \, r_i \)$, which may enlarge the part of the parent set being covered but still covers it. At generation $k$ the total diameter cost is at most $2^s theta^k R^s$, and every diameter is at most $2 theta^(k \/ s) R$. Both bounds tend to zero. Thus $cal(H)^s \( E_j ∩ B \( x \, R \) \) = 0$. Separability supplies countably many such root balls covering $E_j$. Taking the countable union over $j$ proves the claim. No finiteness assumption on $cal(H)^s \( E \)$ is used. ◻
]

#thm([Lemma 5.3.])[
  (Energy controls the content of a rank defect).  #emph[Work in a bounded region where (2.5) and the Poincaré inequality hold with fixed constants. There are an enlargement factor $L$ and $epsilon_0 > 0$ with the following property. Let $P$ be a bounded Sobolev matrix on $B \( x \, L r \)$ and suppose 
$ integral_(B \( x \, L r \)) \| P - I \| thin upright(d) m lt.eq epsilon_0 r^n . $

 For $n - 2 < s$ let $E subset B \( x \, r \)$ consist of precise-representative points of $P$ at which $\| P - I \| gt.eq 1$. Then 
#[#set math.equation(numbering: n => "(5.2)")
 $ cal(H)_oo^s \( E \) lt.eq C_s r^(s + 2 - n) integral_(B \( x \, L r \)) \| nabla P \|^2 thin upright(d) m . $ <frames:energy-content-bound>]

 The constants depend only on $s \, n$ and the local volume and Poincaré constants.]
] <frames:energy-content>

#proof[
  The volume lower bound makes the average of $P$ on $B \( y \, r \)$ within $1 \/ 4$ of $I$, simultaneously for all $y in B \( x \, r \)$, if $epsilon_0$ is small enough. Let $lambda$ be the enlargement factor in the Poincaré inequality, and choose $L > 2 + 5 lambda$. For $t_j = 2^(- j) r$, the difference between the averages on $B \( y \, t_j \)$ and $B \( y \, t_(j + 1) \)$ is at most
  $ C t_j^(1 - n \/ 2) (integral_(B \( y \, lambda t_j \)) \| nabla P \|^2 thin upright(d) m)^(1 \/ 2) . $
  If, for every $j gt.eq 0$,
  $ integral_(B \( y \, lambda t_j \)) \| nabla P \|^2 thin upright(d) m < c_0 t_j^s r^(n - 2 - s) \, $
  the sum of these differences is bounded by
  $ C sqrt(c_0) sum_(j gt.eq 0) 2^(- j \( s - n + 2 \) \/ 2) . $
  Because $s > n - 2$, this is less than $1 \/ 2$ for an appropriate $c_0 > 0$. The averages converge to the precise value at $y$, so this contradicts $\| P \( y \) - I \| gt.eq 1$. Consequently, each $y in E$ has a radius $t_y lt.eq r$ for which
  #[#set math.equation(numbering: n => "(5.3)")
   $ integral_(B \( y \, lambda t_y \)) \| nabla P \|^2 thin upright(d) m gt.eq c_0 t_y^s r^(n - 2 - s) . $ <frames:energy-threshold>]
  The $5 r$ covering lemma selects countably many disjoint balls $B \( y_i \, lambda t_i \)$ whose fivefold enlargements cover $E$. They lie in $B \( x \, L r \)$. Summing (5.3) over these disjoint balls bounds $sum_i t_i^s$ by the right-hand side of (5.2), up to a fixed factor. Their fivefold enlargements give the required content cover. ◻
]

#proof[
  #strong[Selection at all dyadic scales.] Put $r_k = 2^(- k)$, and choose a countable $r_k$-net $N_k$ in $M$. For each integer $A gt.eq 4$, each $y in N_k$, and each integer $q gt.eq 1$, select one harmonic $n$-tuple on $B \( y \, 2 A r_k \)$ with splitting error at most $1 \/ \( n^2 q \)$, whenever such a tuple exists. The splitting-map estimates give a dimensional gradient bound and
  $ frac(1, m \( B \( y \, 2 A r_k \) \)) integral_(B \( y \, 2 A r_k \)) \| P - I \| thin upright(d) m & lt.eq q^(- 1) \,\
frac(\( 2 A r_k \)^2, m \( B \( y \, 2 A r_k \) \)) integral_(B \( y \, 2 A r_k \)) \| "Hess" u^a \|^2 thin upright(d) m & lt.eq q^(- 1) \, $
  for its components $u^a$ and their Gram matrix $P$. The existence input is the harmonic splitting-map theorem near a Euclidean rescaling; see #cite(label("BPS2021")) Proposition 1.4. To match that theorem’s product formulation, use the auxiliary synthetic dimension $N = n + 1$, Euclidean factor dimension $n$, and a point as the $upright("RCD") \( 0 \, 1 \)$ residual factor. Its radius is $2 A r_k \/ 5$, so its output ball is $B \( y \, 2 A r_k \)$. The rescaled curvature bound tends to zero. This auxiliary parameter does not change the actual dimension $n$, the measure $cal(H)^n$, or the volume estimates used here.
  Subtract the values $u^a \( y \)$ and multiply by a good test cutoff supported in $B \( y \, 2 A r_k \)$ and equal to one on $B \( y \, A r_k \)$. These are compact test functions. Indeed, on the support of the cutoff $eta$, the functions and their gradients are bounded and their Hessians are locally in $L^2$, and
  $ Delta \( eta u^a \) = u^a Delta eta + 2 chevron.l nabla eta \, nabla u^a chevron.r . $
  The right-hand side is in $W^(1 \, 2)$ by the product rule and the local Hessian bounds. The construction therefore changes none of the Gram entries on the inner ball. The collection of all selected components is countable. Adjoin the prescribed countable family.
  Fix a regular point $x$, a bounded region containing it, and an integer $A > L + 1$, with $L$ as in Lemma 33. Choose $y_k in N_k$ with $d \( x \, y_k \) lt.eq r_k$. The rescalings at $y_k$ converge to Euclidean space at each fixed enlargement of $r_k$. To check this, take any subsequence of rescalings at $x$. Their limit is Euclidean by regularity. The moving basepoints are at bounded rescaled distance and hence have a further convergent subsequence; the resulting Euclidean pointed space is isometric to the one pointed at the origin. This proves the assertion for the original sequence as well. The same reasoning applies to normalized measures.
  It follows that, for each fixed $q$, the selected harmonic tuple with threshold $q$ is available at $\( y_k \, 2 A r_k \)$ for every sufficiently large $k$. Choose $q_k lt.eq k$ maximal among the available thresholds, ignoring the finitely many initial scales where there is no choice. Then $q_k arrow.r oo$. On $B \( x \, L r_k \)$, the resulting Gram matrix $P_k$ agrees with that of the harmonic tuple. Metric compatibility, bounded gradients, and (2.5) imply
  #[#set math.equation(numbering: n => "(5.4)")
   $ integral_(B \( x \, L r_k \)) #scale(x: 120%, y: 120%)[\(] \| P_k - I \| + r_k^2 \| nabla P_k \|^2 #scale(x: 120%, y: 120%)[\)] thin upright(d) m lt.eq C_A q_k^(- 1) r_k^n = o \( r_k^n \) . $ <frames:all-dyadic-smallness>]
  Thus the conclusion holds at every sufficiently small dyadic scale, rather than only along a sparse subsequence.
  #strong[Common precise representatives.] Every pairwise inner product of the countably many gradients is a bounded Sobolev function. On the present complete, locally doubling Poincaré space, such functions have $L^2$-Lebesgue representatives, given by limits of ball averages outside a set of $2$-capacity zero, and these are their quasi-continuous representatives; see #cite(label("BB2018")) Propositions 4.8–4.9. The equal-norm identification of Newtonian and RCD weak-gradient Sobolev spaces follows from #cite(label("AGSWeakGradients2013")) Theorem 7.4 and Section 8.2; see also #cite(label("Gigli2018")). Completeness makes $M$ its own completion, so the path-openness hypothesis of Proposition 4.9 and the measurable-inclusion qualification in the appended correction are automatic here. To identify the polar sets, let $C_W$ be the outer Sobolev capacity and $C_N$ the Newtonian capacity, using the same norm normalization. On an open set $U$, a Newtonian competitor is a Sobolev competitor of the same norm. Conversely, truncate a Sobolev competitor to $\[ 0 \, 1 \]$ and take its equal-norm Newtonian representative. This representative equals one at every one of its $L^2$-Lebesgue points in $U$. The exception is $C_N$-polar, so resetting it to one there preserves its Newtonian class and norm. Thus the two capacities agree on open sets. Their outer regularity identifies their polar sets, and uniqueness identifies the resulting quasi-continuous representatives. Remove one common polar set for this countable collection. The rational quadratic forms of the Gram matrices are nonnegative almost everywhere, and all their $\( n + 1 \)$-minors vanish almost everywhere. On the bounded range of any finite list of Gram entries, each such polynomial is Lipschitz. Their $L^2$-mean convergence at a common Lebesgue point therefore implies that the polynomial averages converge to the polynomial of the precise values. This passes the almost-everywhere positivity and minor identities to these values. The polynomials are themselves bounded Sobolev functions. Removing a further countable union of polar sets makes these identities hold simultaneously in the precise representatives. This proves the positivity and rank assertions outside a single polar set $N$, which may be taken Borel.
  #strong[Size of the rank defect.] Let $S$ be the set of regular points outside $N$ where no $n$-tuple is positive definite. The representatives and $cal(R)_n$ may be taken Borel, so $S$ is Borel. Each chosen $n$-tuple is singular at every point of $S$, and hence $\| P_k - I \| gt.eq 1$ there. Apply Lemma 33 and (5.4). For every regular $x$ and every $s > n - 2$ this gives
  $ cal(H)_oo^s \( S ∩ B \( x \, r_k \) \) = o \( r_k^s \) . $
  The constants are uniform on each bounded region. Lemma 32, followed by a bounded exhaustion, gives $cal(H)^s \( S \) = 0$. In particular we take $s = n - 1$. When $n = 2$ this is $s = 1$; the telescoping series in Lemma 33 has ratio $2^(- 1 \/ 2)$, so no borderline exponent is used. ◻
]

=== 5.2 Representatives and frames on entire paths <frames:sub-paths>

For a finite measure $pi$ on paths, write $e_t \( gamma \) = gamma_t$. All statements about test plans below also apply to finite plans by normalization. Bounded positions mean that the union of the images of paths in the support lies in a bounded subset of $M$.

#thm([Lemma 5.4.])[
  (Entire-path avoidance and representatives).  #emph[Let $a < b$ and let $pi$ be a finite plan concentrated on $L$-Lipschitz paths with bounded positions. Suppose $\( e_t \)_(\#) pi lt.eq C m$ for every $t in \[ a \, b \]$. For each fixed polar set $N$ and each fixed $cal(H)^(n - 1)$-null set $S$, almost every path satisfies $gamma \( \[ a \, b \] \) ∩ \( N union S \) = diameter$. For any countable family of Sobolev functions, their quasi-continuous representatives agree, along almost every entire path, with the absolutely continuous representatives furnished by Sobolev differentiation along plans.]
] <frames:path-avoidance>

#proof[
  Put $T = b - a$ and $M_pi = pi \( C \( \[ a \, b \] \, M \) \)$. Sobolev differentiation along bounded-compression plans and the elementary one-dimensional bound on the supremum of an absolutely continuous function give
  #[#set math.equation(numbering: n => "(5.5)")
   $ integral sup_(t in \[ a \, b \]) \| u \( gamma_t \) \| thin upright(d) pi lt.eq sqrt(C M_pi) #scale(x: 120%, y: 120%)[\(] parallel u parallel_(L^2 \( m \)) + L T parallel nabla u parallel_(L^2 \( m \)) #scale(x: 120%, y: 120%)[\)] \, $ <frames:path-sup>]
  where on the left we initially use the continuous path representative. The chain rule and its representative formulation are part of the RCD Sobolev calculus; see #cite(label("Gigli2018")) #cite(label("Savare2014")).
  If $N$ is polar, choose open neighborhoods $U_j supset N$ and $u_j in W^(1 \, 2) \( M \)$ with $u_j gt.eq 1$ almost everywhere on $U_j$ and $parallel u_j parallel_(W^(1 \, 2)) arrow.r 0$. For almost every path, membership in the exceptional null subset of $U_j$ occupies zero time, by bounded compression and Fubini. A path hitting $U_j$ has a nontrivial one-sided time interval in $U_j$. Its continuous representative of $u_j$ therefore has supremum at least one. Estimate (5.5) shows that the measure of paths hitting $N$ is zero.
  For the Hausdorff assertion set $L_(*) = max { 1 \, L }$. A path hitting $B \( z \, r \)$ spends at least $r \/ L_(*)$ units of time in $B \( z \, 2 r \)$ whenever $r < L_(*) T$. This remains true for a hit at an endpoint, using a one-sided interval. Consequently
  $ pi { gamma : gamma \( \[ a \, b \] \) ∩ B \( z \, r \) eq.not diameter } lt.eq frac(C L_(*) T, r) m \( B \( z \, 2 r \) \) lt.eq C' r^(n - 1) . $
  The last constant is uniform on the bounded region under consideration. Covering an $cal(H)^(n - 1)$-null set by balls with arbitrarily small total $\( n - 1 \)$-cost proves its avoidance.
  Finally, approximate each of the specified Sobolev functions sufficiently rapidly in $W^(1 \, 2)$ by Lipschitz functions. A subsequence converges to its quasi-continuous representative outside a polar set. Estimate (5.5), applied to successive differences, makes the approximations converge uniformly along almost every path. Those paths avoid the polar set just obtained; their uniform limit is therefore the quasi-continuous representative at every time. It also equals the Sobolev path representative, since they agree for almost every time. Take the countable intersection of the resulting conull sets. ◻
]

#thm([Lemma 5.5.])[
  (Regularity at every time).  #emph[Let $pi$ be a bounded-position geodesic plan on $\[ a \, b \]$ whose marginals have uniformly bounded densities. Then almost every path lies in $cal(R)_n$ for every $t in \[ a \, b \]$.]
] <frames:regular-paths>

#proof[
  Almost every path is regular at the endpoints and at every time in a fixed countable dense subset of $\( a \, b \)$. Consider one such nonconstant path and fix an interior time $t$. Take any sequence of rescalings converging to a tangent $Y$ at $gamma_t$. At a nearby regular time $t_j$, the same rescalings converge to Euclidean $n$-space. Deng’s estimate, valid along every geodesic, implies for each fixed radius $R$ that
  $ d_(upright("pGH")) #scale(x: 120%, y: 120%)[\(] \( B_R \( Y \) \, o_Y \) \, \( B_R \( bb(R)^n \) \, 0 \) #scale(x: 120%, y: 120%)[\)] lt.eq C R \| t - t_j \|^alpha . $
  The constants can be kept fixed while $t_j$ stays in a compact interior interval containing $t$; see #cite(label("Deng2020")) Theorems 1.1–1.2. Letting regular $t_j$ tend to $t$ proves that every pointed ball in $Y$ is Euclidean. The tangent sequence was arbitrary, so $gamma_t in cal(R)_n$. In the noncollapsed setting the normalized tangent measures are the corresponding Euclidean measures. Constant paths are already covered by regularity at one fixed time. Endpoint regularity came directly from bounded compression, not from the interior estimate. ◻
]

Together, the preceding lemmas give a full-rank Gram matrix at every time along almost every relevant path. We next use its continuous entries to define fibers and a connection, and then identify the geodesic velocity and its endpoint traces.

#thm([Proposition 5.6.])[
  (Finite-dimensional calculus along a path).  #emph[Fix a countable family as in Proposition 31. Let $pi$ be an optimal geodesic plan on $\[ a \, b \]$ with bounded positions, bounded speed, and uniformly bounded-compression marginals. Along almost every path there are $n$-dimensional fibers at every time and local frames formed from the specified test gradients, with the following properties.]
  + #emph[Gram entries belong to $W^(1 \, 2) \( \[ a \, b \] \)$, are continuous, and differentiate by metric compatibility with $nabla_v$.]
  + #emph[In a local frame, fields with $W^(1 \, 2)$ scalar coefficients have a well-defined metric-compatible derivative 
#[#set math.equation(numbering: n => "(5.6)")
 $ cal(D) (sum_i a_i e_i) = sum_i #scale(x: 120%, y: 120%)[\(] a'_i e_i + a_i nabla_v e_i #scale(x: 120%, y: 120%)[\)] . $ <frames:curve-derivative>]

 Its connection coefficients belong to $L^2$. There are orthonormal parallel frames on the entire interval.]
  + #emph[The geodesic velocity has a continuous representative in these fibers, satisfies $cal(D) v = 0$, and has norm equal to the constant metric speed. At $a$ and $b$ the fibers and all specified test gradients agree with their tangent-module counterparts almost surely.]
] <frames:path-calculus>

#proof[
  #strong[Fibers and connection.] Lemmas 34 and 35 ensure that, along almost every entire path, the common Gram representatives have rank $n$ at every time. Sobolev differentiation of their entries gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ frac(d, d t) chevron.l e_i \, e_j chevron.r = chevron.l nabla_v e_i \, e_j chevron.r + chevron.l e_i \, nabla_v e_j chevron.r . $ <frames:gram-derivative>]
  All terms are in $L^2$ in time along almost every path, since the fields are bounded, their covariant derivatives are in $L^2 \( m \)$, and speed and compression are bounded. Countability permits these assertions simultaneously for every pair of specified fields.
  One concrete definition of a fiber is the linear span of the symbols $e_j$ modulo the kernel of their Gram form. All finite Gram matrices have rank at most $n$, and some $n$-tuple is positive definite, so this fiber has dimension $n$. Continuity of Gram entries makes a positive-definite $n$-tuple a frame on an open time interval. Compactness of $\[ a \, b \]$ gives a finite subdivision such that each closed piece lies in a frame interval and its inverse Gram matrix is bounded. Frame changes have $W^(1 \, 2)$ coefficients, as follows by multiplying cross-Gram entries by the inverse Gram matrix.
  At almost every time these fibers are the original tangent fibers and the frame spans the tangent space. Thus $nabla_v e_i$ has $L^2$ coefficients in a frame, and (5.6) is meaningful. To verify that it is independent of a representation, suppose $W = sum_i a_i e_i$ is zero. Its pairing with each frame vector is identically zero. Differentiate that pairing using (5.7); the term pairing $W$ with the derivative of the frame vector is zero almost everywhere. It follows that the right-hand side of (5.6) pairs to zero against a basis almost everywhere and hence vanishes. The same calculation proves metric compatibility. In each frame the parallel equation is a linear ODE with $L^2$, hence $L^1$, coefficients. Its absolutely continuous solutions exist uniquely. Metric compatibility preserves their pairings, and gluing at the subdivision endpoints constructs an orthonormal parallel frame on $\[ a \, b \]$.
  #strong[Parallel velocity.] Put $T = b - a$. Apply #cite(label("GigliTamanini2021")) Theorem 5.13(i) to the bounded-support optimal geodesic test plan after the affine reparameterization $tilde(gamma)_tau = gamma_(a + T tau)$. The functions $g_i$ are in $H^(2 \, 2)$, as required there. If $nabla tilde(phi)_tau$ is its Kantorovich velocity, the first differentiation identity identifies the actual velocity in the original parameter as $v_t = T^(- 1) nabla tilde(phi)_(\( t - a \) \/ T)$ along the plan almost everywhere. The second differentiation identity has a factor $T^2$ on both sides, giving, for $e_i = nabla g_i$,
  #[#set math.equation(numbering: n => "(5.8)")
   $ frac(d, d t) chevron.l e_i \, v chevron.r = "Hess" g_i \( v \, v \) = chevron.l nabla_v e_i \, v chevron.r . $ <frames:velocity-pairing>]
  Its identity in $L^2 \( pi \)$ yields the pathwise distributional identity by Fubini; its right-hand side is in $L^2 \( d t thin d pi \)$ by bounded speed and compression. Equivalently one may apply the theorem to boundedly weighted restrictions of the plan, which remain optimal. Choose jointly measurable representatives $u_i \( t \, gamma \) = chevron.l e_i \, v chevron.r \( gamma_t \)$ and $f_i \( t \, gamma \) = "Hess" g_i \( v \, v \) \( gamma_t \)$ in $L^2 \( d t thin d pi \)$. Their continuous scalar representatives can be specified by
  #[#set math.equation(numbering: n => "(5.9)")
   $ u_i^(*) \( t \, gamma \) = 1 / T integral_a^b u_i \( s \, gamma \) thin upright(d) s + integral_a^t f_i \( r \, gamma \) thin upright(d) r - 1 / T integral_a^b \( b - r \) f_i \( r \, gamma \) thin upright(d) r . $ <frames:measurable-scalar-trace>]
  This formula is jointly measurable. Along almost every path it belongs to $W^(1 \, 2)$, has derivative $f_i$, and has the same average as $u_i$. It therefore represents the original scalar Sobolev class. Countability gives these assertions on one conull path set.
  In a positive-Gram frame put $c = P^(- 1) u^(*)$, where $u^(*)$ is the vector of the corresponding scalar representatives. The coefficients $c$ are $W^(1 \, 2)$. Write $nabla_v e_i = sum_j C_(j i) e_j$. Metric compatibility and (5.8) give
  $ P' = C^(sans(T)) P + P C \, #h(2em) u^(*) = P c \, #h(2em) \( u^(*) \)' = C^(sans(T)) P c . $
  Differentiation yields $c' + C c = 0$, proving $cal(D) v = 0$ from the scalar Sobolev identities. Its almost-everywhere norm is the constant metric speed, so continuity gives the same norm at every time.
  #strong[Measurable endpoint traces.] The Gram identities defining the endpoint fibers agree with the actual tangent-module identities outside an $m$-null set. Endpoint compression excludes this set. Countability of the family makes the identification simultaneous for all specified fields. The endpoint vector can also be chosen measurably: enumerate the countable $n$-tuples and, at $b$, select the first tuple $I = \( i_1 \, dots.h \, i_n \)$ with positive Gram determinant. This defines a measurable countable partition of the good paths. In a measurable realization of the tangent module, set
  #[#set math.equation(numbering: n => "(5.10)")
   $ v_b = sum_(alpha = 1)^n #scale(x: 120%, y: 120%)[\(] P_I \( b \, gamma \)^(- 1) u_I^(*) \( b \, gamma \) #scale(x: 120%, y: 120%)[\)]_alpha e_(i_alpha) \( gamma_b \) . $ <frames:measurable-endpoint-velocity>]
  This is measurable. The chosen minor remains positive on a neighborhood of $b$ along that path, so the construction agrees with the continuous pathwise velocity just obtained. All its other specified gradient pairings equal $u_j^(*) \( b \)$ by continuity, and its norm equals the path speed. The same construction applies at $a$. Thus the later endpoint $L^2 \( pi \)$ pairings use a measurable bounded vector defined by scalar traces, independently of any choice of values for the original time-equivalence class. ◻
]

#thm([Lemma 5.7.])[
  (Countable trials with prescribed global endpoints).  #emph[Fix $0 < delta < 1$, a compact test gradient $Z$, and a countable family in Proposition 31 whose gradients include $Z$. There is a countable collection $cal(Y)_(delta \, Z)$ of fields that are smooth temporal linear combinations of these gradients and satisfy 
$ Y_delta = 0 \, #h(2em) Y_1 = Z $

 as identities of fields on $M$, with the following property. For every optimal geodesic plan with the bounds of Proposition 36 on $\[ delta \, 1 \]$, along almost every path every $W^(1 \, 2)$ field $W$ satisfying $W \( delta \) = 0$ and $W \( 1 \) = Z \( gamma_1 \)$ is a limit of members of $cal(Y)_(delta \, Z)$ in the norm 
$ (integral_delta^1 \( \| Y - W \|^2 + \| cal(D) Y - cal(D) W \|^2 \) thin upright(d) t)^(1 \/ 2) . $

 The approximating sequence may depend on the path and on $W$.]
] <frames:trial-density>

#proof[
  Choose a smooth scalar $eta$ with $eta \( delta \) = 0$ and $eta \( 1 \) = 1$. For every interval with rational endpoints compactly contained in $\( delta \, 1 \)$, choose a countable subset of $C_c^oo$ dense in its $W_0^(1 \, 2)$ space. Let $cal(A)$ be their union and its rational linear span. Define $cal(Y)_(delta \, Z)$ to consist of
  $ eta \( t \) Z + sum_(ell = 1)^k a_ell \( t \) e_(j_ell) \, #h(2em) a_ell in cal(A) \, $
  with arbitrary finite lists of indices. This is countable and has the required global endpoint identities.
  Work on a path satisfying Proposition 36. Subtract $eta Z$ from $W$. In a global parallel frame the resulting field has $W_0^(1 \, 2)$ coefficients. Cutting it off near $delta$ and $1$ converges in $W^(1 \, 2)$; this is the usual zero-trace approximation on an interval. A smooth temporal partition of unity then expresses the remaining compactly supported field in finitely many of the local test-gradient frames. Refine to intervals with rational endpoints whose closures remain in these frame intervals. The coefficient functions belong to $W_0^(1 \, 2)$ on the corresponding intervals. Approximate them by elements of the chosen countable dense subsets. Such approximation converges uniformly as well as in $W^(1 \, 2)$ on an interval. Uniform convergence controls multiplication by the $L^2$ connection coefficients in (5.6). The fields therefore converge in the stated norm. ◻
]

#prodef([Remark 5.8.])[
  Lemma 37 is a pathwise approximation statement with one countable list of global trials. Below it is used by taking their infimum separately at each terminal point. No simultaneous approximation in an integrated space of fields along the plan is asserted. For related notions of parallel transport along test plans and the distinction between the associated Sobolev spaces, see #cite(label("CGP2022")).
] <frames:pathwise-scope>

=== 5.3 The terminal velocity of radial calibrated paths <frames:sub-radial>

From now on assume $K = \( n - 1 \) kappa$ and the sectional tensor lower bound, so that Theorem 18 applies.

Fix $R_kappa > 0$ such that $R_kappa sqrt(kappa) < pi \/ 2$ when $kappa > 0$; for $kappa lt.eq 0$ fix any positive $R_kappa$. For $p in M$ write $r = d \( p \, dot.op \)$ and $q = r^2 \/ 2$. The bounded Lipschitz function

#[#set math.equation(numbering: n => "(5.11)")
 $ u \( x \) = min { 2 R_kappa r \( x \) \, thin 2 R_kappa^2 } $ <frames:radial-data>]

is constant off a compact set and satisfies $Q_1 u = q$ on $B \( p \, R_kappa \)$, with $p$ the unique minimizer. Indeed, if $s = d \( p \, y \) < R_kappa$ and $r \( x \) < R_kappa$, then

$ u \( y \) + 1 / 2 d \( x \, y \)^2 - 1 / 2 r \( x \)^2 gt.eq s \( 2 R_kappa - r \( x \) \) + 1 / 2 s^2 > 0 quad upright("when ") s > 0 . $

For $s gt.eq R_kappa$ the value of $u$ alone is larger than $q \( x \)$. Thus every calibrated path ending in this ball starts at $p$, has speed $r \( gamma_1 \)$, and satisfies $r \( gamma_t \) = t r \( gamma_1 \)$.

Choose a compact Lipschitz cutoff $chi$ equal to one on $overline(B \( p \, R_kappa \))$. The common terminal-point prescription in Theorem 18 yields a finite plan $pi_chi$ with terminal measure $chi m$. Its restriction to $\[ delta \, 1 \]$ has bounded positions, speed, and compression, and is optimal for every $delta > 0$. Optimality also follows directly from calibration and the Hopf–Lax semigroup identity on subintervals. Restricting this plan by the condition $gamma_1 in B \( p \, R_kappa \)$ gives a plan with terminal measure $m \|_(B \( p \, R_kappa \))$ and the same positive-time bounds. This restriction will be used for representative arguments; the weights in the index inequality itself remain Lipschitz.

#thm([Lemma 5.9.])[
  (Terminal gradient trace).  #emph[For the radial calibrated paths just described, the terminal representative supplied by Proposition 36 satisfies 
#[#set math.equation(numbering: n => "(5.12)")
 $ v \( 1 \) = nabla q \( gamma_1 \) $ <frames:terminal-identity>]

 almost surely. In particular $\| nabla q \| = r$ almost everywhere on $B \( p \, R_kappa \)$.]
] <frames:terminal-trace>

#proof[
  Choose a compactly supported Lipschitz function $tilde(q)$ equal to $q$ on a neighborhood of $overline(B \( p \, R_kappa \))$, and compact test functions $h_j arrow.r tilde(q)$ in $W^(1 \, 2)$. Include this deterministic countable sequence in the family of Proposition 31 before applying the pathwise statements. Test-function density here follows from heat regularization and good cutoffs; see #cite(label("Gigli2018")).
  Let $pi$ denote the radial restriction above, and fix one $delta < 1$. If $\( e_t \)_(\#) pi lt.eq C m$ on $\[ delta \, 1 \]$, then for any Lipschitz $e in W^(1 \, 2)$ and $0 < h < 1 - delta$, Sobolev differentiation and Jensen’s inequality give
  #[#set math.equation(numbering: n => "(5.13)")
   $ ∥frac(e \( gamma_1 \) - e \( gamma_(1 - h) \), h)∥_(L^2 \( pi \))^2 lt.eq R_kappa^2 / h integral_(1 - h)^1 integral \| nabla e \|^2 \( gamma_t \) thin upright(d) pi thin upright(d) t lt.eq C R_kappa^2 parallel nabla e parallel_(L^2 \( m \))^2 . $ <frames:quotient-bound>]
  For each fixed $j$, the continuous representative of $chevron.l nabla h_j \, v chevron.r$ gives
  $ frac(h_j \( gamma_1 \) - h_j \( gamma_(1 - h) \), h) arrow.r chevron.l nabla h_j \( gamma_1 \) \, v \( 1 \) chevron.r quad upright("in ") L^2 \( pi \) . $
  Dominated convergence applies with bound $R_kappa "Lip" \( h_j \)$; no uniform bound in $j$ is required. Terminal compression and $\| v \( 1 \) \| lt.eq R_kappa$ also imply
  $ parallel chevron.l nabla \( tilde(q) - h_j \) \( gamma_1 \) \, v \( 1 \) chevron.r parallel_(L^2 \( pi \)) lt.eq R_kappa sqrt(C) thin parallel nabla \( tilde(q) - h_j \) parallel_(L^2 \( m \)) . $
  On the radial paths the quotient for $tilde(q)$ is exactly $\( 1 - h \/ 2 \) r \( gamma_1 \)^2$. Apply (5.13) to $e = tilde(q) - h_j$, let $h arrow.b 0$ first, and then let $j arrow.r oo$. This proves
  $ chevron.l nabla q \( gamma_1 \) \, v \( 1 \) chevron.r = r \( gamma_1 \)^2 . $
  Locality justifies replacing $tilde(q)$ by $q$ at the terminal points. Since $\| nabla q \| lt.eq r$ and $\| v \( 1 \) \| = r \( gamma_1 \)$, equality in Cauchy–Schwarz proves (5.12), including the zero-speed case. The terminal measure is $m$ on the ball, giving the last assertion. ◻
]

=== 5.4 The countable infimum and the Jacobi trial <the-countable-infimum-and-the-jacobi-trial>

Let $frak(s)_kappa$ be the solution of

$ frak(s)''_kappa + kappa frak(s)_kappa = 0 \, #h(2em) frak(s)_kappa \( 0 \) = 0 \, #h(2em) frak(s)'_kappa \( 0 \) = 1 . $

#thm([Theorem 5.10.])[
  (Distributional Hessian comparison).  #emph[Let $n gt.eq 2$ be an integer, let $kappa in bb(R)$, and let $\( M \, d \, m \)$, with $m = cal(H)^n$, be a full-support $upright("RCD") \( \( n - 1 \) kappa \, n \)$ space satisfying (1.3) for every global $X \, Y in "TestV" \( M \)$ and every nonnegative $f in "Test" \( M \)$. Fix $R_kappa > 0$, with $R_kappa sqrt(kappa) < pi \/ 2$ if $kappa > 0$. For every $p in M$, put $r = d \( p \, dot.op \)$ and $q = r^2 \/ 2$. Then for every compact test gradient $Z$, $"Hess" q \( Z \, Z \)$ on $B \( p \, R_kappa \)$ is a signed Radon measure whose singular part with respect to $m$ is nonpositive. It satisfies 
#[#set math.equation(numbering: n => "(5.14)")
 $ "Hess" q \( Z \, Z \) lt.eq (\| Z_parallel \|^2 + r frac(frak(s)'_kappa \( r \), frak(s)_kappa \( r \)) \| Z_perp \|^2) m . $ <frames:hessian-bound>]

 Here $\| nabla q \| = r$ almost everywhere, and on ${ r > 0 }$ 
$ Z_parallel = frac(chevron.l Z \, nabla q chevron.r, r^2) nabla q \, #h(2em) Z_perp = Z - Z_parallel . $

 At $r = 0$ the coefficient on the right-hand side of (5.14) is interpreted as $\| Z \|^2$. The measure inequality holds, in particular, against every nonnegative compactly supported Lipschitz weight on the ball. The radius $R_kappa$ is independent of $p$.]
] <frames:hessian>

#proof[
  Use the radial data (5.11). For the fixed $Z$, adjoin its potential and the approximations in Lemma 39 to the countable family. Fix $0 < delta < 1$. For every trial (4.1) satisfying the global endpoint identities $Y_delta = 0$ and $Y_1 = Z$, Theorem 18 gives
  #[#set math.equation(numbering: n => "(5.15)")
   $ "Hess" q \( Z \, Z \) \( f \) lt.eq integral_(B \( p \, R_kappa \)) f \( x \) E_Y \( x \) thin upright(d) m \( x \) \, $ <frames:index-terminal>]
  where $f gt.eq 0$ is compactly supported and Lipschitz in the ball, the common calibrated path ending at $x$ is denoted by $gamma^x$, and
  #[#set math.equation(numbering: n => "(5.16)")
   $ E_Y \( x \) = integral_delta^1 #scale(x: 120%, y: 120%)[\(] \| partial_t Y + nabla_v Y \|^2 - kappa \( \| Y \|^2 \| v \|^2 - chevron.l Y \, v chevron.r^2 \) #scale(x: 120%, y: 120%)[\)] \( gamma_t^x \) thin upright(d) t . $ <frames:trial-energy>]
  The common terminal prescription is essential here: the right-hand side is integration against a function of $x$, without averaging over several paths ending at $x$. The velocities agree under reweighting of these paths, since their pairings with test gradients are the derivatives of the same test functions along the paths. Bounded compression of $pi_chi$, bounded speed, and the $L^2$ covariant derivatives of each fixed trial show that $E_Y in L_(upright("loc"))^1 \( B \( p \, R_kappa \) \, m \)$.
  We first extract a measure using one fixed trial, for example $Y_t = \( t - delta \) Z \/ \( 1 - delta \)$, and denote its energy by $E_0$. The functional
  $ f mapsto integral E_0 f thin upright(d) m - "Hess" q \( Z \, Z \) \( f \) $
  is nonnegative on nonnegative compact Lipschitz functions. On a fixed compact subset, comparison with a Lipschitz cutoff equal to one there bounds its absolute value by a constant times $parallel f parallel_oo$. Density in $C_c$ and the Riesz representation theorem therefore give a positive Radon measure $nu$ representing it. Thus
  $ mu := "Hess" q \( Z \, Z \) = E_0 m - nu $
  is a signed Radon measure, with nonpositive singular part. Its representation of the fixed functional is unique, so the measure does not depend on the initially chosen trial or on $delta$. Write $mu = h_Z m + mu^(upright(s))$ for its Lebesgue decomposition.
  Apply (5.15) to each member of the countable collection $cal(Y)_(delta \, Z)$ from Lemma 37. Each inequality says that $E_Y m - mu$ is a positive Radon measure. Consequently
  #[#set math.equation(numbering: n => "(5.17)")
   $ h_Z \( x \) lt.eq inf_(Y in cal(Y)_(delta \, Z)) E_Y \( x \) quad upright("for ") m upright("-a.e. ") x . $ <frames:countable-infimum>]
  The null set can be chosen simultaneously because the list is countable. The same is true for the pathwise calculus under $pi_chi$ and its radial restriction.
  On such a path, $v$ is parallel and has norm $r = r \( x \)$. Lemma 39 identifies its terminal direction with $nabla q \( x \)$. Parallel translate the two components $Z_parallel \( x \)$ and $Z_perp \( x \)$ to obtain parallel fields $P_parallel$ and $P_perp$ on $\[ delta \, 1 \]$. For $r > 0$ take the pathwise field
  $ W_t = frac(t - delta, 1 - delta) P_parallel \( t \) + frac(frak(s)_kappa \( \( t - delta \) r \), frak(s)_kappa \( \( 1 - delta \) r \)) P_perp \( t \) . $
  Its initial value is zero and its terminal value is $Z \( x \)$. The denominator is positive by the choice of $R_kappa$. At $r = 0$ use the linear coefficient on the whole field. Lemma 37 approximates $W$ in the pathwise norm by members of $cal(Y)_(delta \, Z)$. The energy (5.16) is continuous in this norm because $v$ is bounded. Hence the infimum in (5.17) is bounded above by the energy of $W$. Only this pathwise upper bound on a countable infimum is needed; no measurable selection of the fields $W$ or their approximating sequences is required.
  The parallel component contributes $\| Z_parallel \|^2 \/ \( 1 - delta \)$. If $j \( t \) = frak(s)_kappa \( \( t - delta \) r \) \/ frak(s)_kappa \( \( 1 - delta \) r \)$, then $j'' + kappa r^2 j = 0$, $j \( delta \) = 0$, and $j \( 1 \) = 1$. Thus the transverse contribution is
  $ \| Z_perp \|^2 integral_delta^1 \( j' ""^2 - kappa r^2 j^2 \) thin upright(d) t = \| Z_perp \|^2 \[ j j' \]_delta^1 = r frac(frak(s)'_kappa \( \( 1 - delta \) r \), frak(s)_kappa \( \( 1 - delta \) r \)) \| Z_perp \|^2 . $
  We have proved
  $ h_Z lt.eq frac(\| Z_parallel \|^2, 1 - delta) + r frac(frak(s)'_kappa \( \( 1 - delta \) r \), frak(s)_kappa \( \( 1 - delta \) r \)) \| Z_perp \|^2 $
  almost everywhere, with the continuous zero-speed value $\| Z \|^2 \/ \( 1 - delta \)$. Choose a countable sequence $delta arrow.b 0$. The same density $h_Z$ occurs for every $delta$, so outside their common null set we may pass to the limit pointwise. Together with $mu^(upright(s)) lt.eq 0$, this gives (5.14) as a measure inequality and therefore against every indicated Lipschitz weight. ◻
]

== 6 From Hessian bounds to triangle comparison <sec:weighted-comparison>

The preceding section bounds the distributional Hessian of squared distance using the sectional-curvature assumption. We now turn that bound into a differential inequality along every geodesic and then into triangle comparison. The only new analytic input is the general weak-Hessian theorem proved in the companion article #cite(label("WeakHessianCompanion")) Theorem 1.1. We record its exact interface before constructing the distance functions to which it applies.

=== 6.1 The general weak-Hessian input <the-general-weak-hessian-input>

#thm([Theorem 6.1.])[
  (Weak Hessian bounds along every geodesic).  #emph[Let $\( M \, d \, m \)$ be a full-support $upright("RCD") \( K \, N \)$ space, where $K in bb(R)$ and $1 < N < oo$. Let $F$ be bounded and globally Lipschitz, and let $G$ be bounded and continuous. Suppose that for every compactly supported $g in "Test" \( M \)$ and every nonnegative $h in "Lip"_c \( M \)$, 
#[#set math.equation(numbering: n => "(6.1)")
 $ H_F \( nabla g \, nabla g \) \( h \) lt.eq integral h G \| nabla g \|^2 thin upright(d) m \, $ <weight:hessian-assumption>]

 where the weak Hessian is defined by (2.3). Then every constant-speed minimizing geodesic $sigma : \[ 0 \, 1 \] arrow.r M$, of length $ell$, satisfies 
#[#set math.equation(numbering: n => "(6.2)")
 $ \( F compose sigma \)'' lt.eq ell^2 G compose sigma quad upright("in distributions on ") \( 0 \, 1 \) . $ <weight:curve-hessian>]

]
] <weight:every-geodesic>

This is #cite(label("WeakHessianCompanion")) Theorem 1.1. Neither an $L^2$ condition on $F$ nor an $L^2$ Hessian of $F$ is required. The companion uses the same nonpositive Laplacian and original test class as (1.1); its proof is independent of the noncollapsed hypotheses and sectional-curvature assumption used here. In the application below, the reference measure remains $cal(H)^n$.

=== 6.2 Modified distance and the model equation <modified-distance-and-the-model-equation>

Define the modified model distance by

$ frak(m)_kappa \( r \) = integral_0^r frak(s)_kappa \( s \) thin upright(d) s = cases(delim: "{", \( 1 - cos \( sqrt(kappa) r \) \) \/ kappa \, & kappa > 0 \,, r^2 \/ 2 \, & kappa = 0 \,, \( cosh \( sqrt(- kappa) r \) - 1 \) \/ \( - kappa \) \, & kappa < 0 .) $

It obeys $frak(m)'_kappa = frak(s)_kappa$ and $frak(s)'_kappa = 1 - kappa frak(m)_kappa$.

#thm([Lemma 6.2.])[
  (A global bounded modification).  #emph[Assume the conclusion of Theorem 40, and write $R_(*) = R_kappa > 0$ for its radius. There are numbers $0 < a < b < R_(*)$, depending only on $kappa$ and the chosen $R_(*)$, such that for every $p in M$ there are bounded globally Lipschitz $F_p$ and bounded continuous $G_p$ satisfying (6.1) and 
#[#set math.equation(numbering: n => "(6.3)")
 $ F_p = frak(m)_kappa \( d \( p \, dot.op \) \) \, #h(2em) G_p = 1 - kappa F_p quad upright("on ") B_a \( p \) . $ <weight:local-modification>]

 For $kappa > 0$, we may require $b < pi \/ \( 2 sqrt(kappa) \)$.]
] <weight:distance-modification>

#proof[
  Write $r = d \( p \, dot.op \)$ and $q = r^2 \/ 2$, and fix $0 < a < b < R_(*)$. Choose a smooth nonincreasing function $theta : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$, equal to one on $\[ 0 \, a^2 \/ 2 \]$ and zero on $\[ b^2 \/ 2 \, oo \)$, and set
  $ chi \( 0 \) = 0 \, #h(2em) chi' \( q \) = theta \( q \) frac(frak(s)_kappa \( sqrt(2 q) \), sqrt(2 q)) \, #h(2em) F_p = chi \( q \) . $
  The quotient has a smooth extension at zero by its power series. Consequently $F_p$ is bounded and globally Lipschitz, is constant outside $B_b \( p \)$, and has the first value in (6.3). It need not lie in $L^2 \( m \)$; boundedness and a bounded gradient are the hypotheses needed for the weight.
  For a compact test gradient $Z = nabla g$, the definition (2.3) and the chain rule give
  #[#set math.equation(numbering: n => "(6.4)")
   $ H_(F_p) \( Z \, Z \) \( h \) = H_q \( Z \, Z \) \( h chi' \( q \) \) + integral h chi'' \( q \) chevron.l nabla q \, Z chevron.r^2 thin upright(d) m . $ <weight:weak-chain>]
  This identity involves only first derivatives of $q$, so it holds for the distributional Hessian. Local cutoffs keep its first term inside $B_(R_(*)) \( p \)$. For $r > 0$, put $Z_r = chevron.l nabla q \, Z chevron.r \/ r$; then $\| Z_r \| lt.eq \| Z \|$, since the Lipschitz bound for $r$ gives $\| nabla q \| lt.eq r$ almost everywhere. The Hessian comparison of Theorem 40 and $chi' gt.eq 0$ bound (6.4) above by
  $ integral h [A \( r \) \| Z_r \|^2 + B \( r \) \( \| Z \|^2 - \| Z_r \|^2 \)] thin upright(d) m \, $
  where, after cancellation of the model-distance factors,
  $ A \( r \) & = chi' \( r^2 \/ 2 \) + r^2 chi'' \( r^2 \/ 2 \) = theta \( r^2 \/ 2 \) frak(s)'_kappa \( r \) + r theta' \( r^2 \/ 2 \) frak(s)_kappa \( r \) \,\
B \( r \) & = theta \( r^2 \/ 2 \) frak(s)'_kappa \( r \) . $
  The nonpositive singular part of $H_q \( Z \, Z \)$ remains nonpositive on multiplication by $chi'$. Both coefficients extend continuously with $A \( 0 \) = B \( 0 \) = 1$, and vanish for $r gt.eq b$. Since $theta' lt.eq 0$ and $frak(s)_kappa gt.eq 0$ on $\[ 0 \, b \]$, we have $A lt.eq B$: flattening the distance adds a nonpositive radial term. Hence the bounded continuous function
  $ G_p \( x \) = theta #scale(x: 120%, y: 120%)[\(] r \( x \)^2 \/ 2 #scale(x: 120%, y: 120%)[\)] frak(s)'_kappa #scale(x: 120%, y: 120%)[\(] r \( x \) #scale(x: 120%, y: 120%)[\)] $
  gives (6.1) globally. On $r < a$, it equals $frak(s)'_kappa \( r \) = 1 - kappa F_p$, as required. ◻
]

#thm([Theorem 6.3.])[
  (Alexandrov comparison).  #emph[Under hypothesis (B) of Theorem 1, $\( M \, d \)$ is an $n$-dimensional Alexandrov space of curvature at least $kappa$.]
] <weight:alexandrov>

#proof[
  Theorems 18 and 40 supply the hypothesis of Lemma 42. Apply Theorem 41 to $F_p \, G_p$. For every geodesic $sigma : \[ 0 \, 1 \] arrow.r B_a \( p \)$ of length $ell$, (6.3) yields
  #[#set math.equation(numbering: n => "(6.5)")
   $ y'' + kappa ell^2 y lt.eq ell^2 \, #h(2em) y \( t \) = frak(m)_kappa \( d \( p \, sigma_t \) \) . $ <weight:model-inequality>]
  Consider a geodesic triangle $\[ p x y \]$ of perimeter less than $a$, and let $sigma$ be its chosen side from $x$ to $y$. The triangle inequality along the two routes through the vertices gives $d \( p \, sigma_t \) < a$, so (6.5) holds on this entire side. The comparison triangle $\[ macron(p) macron(x) macron(y) \]$ in the two-dimensional model of curvature $kappa$ exists at this scale. For its corresponding side $macron(sigma)$, the model cosine law gives
  $ macron(y) \( t \) = frak(m)_kappa \( d \( macron(p) \, macron(sigma)_t \) \) \, #h(2em) macron(y)'' + kappa ell^2 macron(y) = ell^2 \, quad macron(y) \( 0 \) = y \( 0 \) \, quad macron(y) \( 1 \) = y \( 1 \) . $
  This also holds for degenerate triangles by continuity. Let $h = y - macron(y)$. It belongs to $H_0^1 \( 0 \, 1 \)$, and $- h'' - kappa ell^2 h gt.eq 0$ in distributions. Testing with the negative part $h_(-)$, by nonnegative $H_0^1$ approximation, gives
  $ parallel \( h_(-) \)' parallel_2^2 lt.eq kappa ell^2 parallel h_(-) parallel_2^2 . $
  If $kappa lt.eq 0$, this forces $h_(-) = 0$. If $kappa > 0$, our scale choice gives $kappa ell^2 < pi^2$, and the Dirichlet Poincaré inequality gives the same conclusion. Since $frak(m)_kappa$ is strictly increasing on the distances under consideration,
  #[#set math.equation(numbering: n => "(6.6)")
   $ d \( p \, sigma_t \) gt.eq d \( macron(p) \, macron(sigma)_t \) #h(2em) \( 0 lt.eq t lt.eq 1 \) . $ <weight:point-side>]
  Thus every sufficiently short triangle, with any chosen sides, satisfies point-on-side comparison.
  We spell out the localization for the final geometric step. Fix $o in M$ and choose $r > 0$ with $20 r < a$. The local converse to point-on-side comparison gives the four-point $upright("CBB") \( kappa \)$ inequality on $B_r \( o \)$, as follows. Point-on-side comparison makes the comparison angle of a short hinge nonincreasing in either radial parameter. Its limit defines the angle, which is at least the comparison angle. The adjacent-angle inequality follows from the model gluing lemma. For a quadruple $p \, x \, y \, z in B_r \( o \)$, take $w in \( p \, z \)$ with $d \( p \, w \) < r$. The radial legs from $w$ to these points have length at most $3 r$, so every triangle used to compare points on these legs has perimeter at most $12 r < a$. Write $tilde(angle)_kappa \( w \; x \, y \)$ for the comparison angle at $w$ in the triangle $w x y$. For the actual angles at $w$, insert the direction $w p$ between $w x$ and $w y$ in the angle triangle inequality. The resulting terms pair with $w z$ into two adjacent-angle sums, each at most $pi$. Each comparison angle is at most its actual angle, so
  $ tilde(angle)_kappa \( w \; x \, y \) + tilde(angle)_kappa \( w \; y \, z \) + tilde(angle)_kappa \( w \; z \, x \) lt.eq 2 pi . $
  Letting $w arrow.r p$, continuity of the comparison angles gives the same inequality with $w$ replaced by $p$. This is the local four-point inequality, obtained by localizing the converse proof in #cite(label("AKP2024")) Theorem 8.14. All segments here are ambient minimizing segments; no convexity of a metric ball is needed. Hence $M$ is locally $upright("CBB") \( kappa \)$ by the local four-point criterion in #cite(label("AKP2024")) Theorem 8.30, condition (1). Completeness and the length-space property allow the globalization theorem #cite(label("AKP2024")) Theorem 8.31, so $M$ is $upright("CBB") \( kappa \)$.
  Finally, $m = cal(H)^n$ is finite on bounded sets and has full support. Every nonempty bounded ball therefore has positive finite $n$-dimensional Hausdorff measure, and hence Hausdorff dimension $n$. A countable exhaustion by such balls shows $dim_H M = n$. This is the dimension of the resulting Alexandrov space. ◻
]

== 7 Conclusion of the proof <sec:conclusion>

#proof[
  If (A) holds, the Alexandrov-to-$upright("RCD")$ theorem gives $upright("RCD") \( \( n - 1 \) kappa \, n \)$ with reference measure $cal(H)^n$ and full support. Theorem 5 gives the stated distributional sectional-curvature inequality, so (B) holds. Conversely, under (B), Theorem 18 gives the index inequality. Theorem 40 turns it into distributional Hessian comparison, and Theorem 43 yields the Alexandrov lower bound $kappa$ and dimension $n$. Thus (A) holds. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
