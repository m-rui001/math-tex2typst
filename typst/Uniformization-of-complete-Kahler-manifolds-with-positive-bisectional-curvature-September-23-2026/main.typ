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

#align(center)[#text(size: 16pt, weight: "bold")[Uniformization of complete Kähler manifolds \
with positive bisectional curvature]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

In his 1982 problem survey, Yau asked whether a complete noncompact Kähler manifold with positive holomorphic bisectional curvature must be biholomorphic to complex Euclidean space [57] §9(b), p. 45. We prove the conjecture under its pointwise positivity hypothesis.

#thm([Theorem 1.1.])[
  #emph[Let $M$ be a connected noncompact complex manifold of complex dimension $n gt.eq 1$. If $M$ admits a smooth complete Kähler metric with strictly positive holomorphic bisectional curvature, then $M$ is biholomorphic to $bb(C)^n$.]
] <thm:uniformization>

Strict positivity in Theorem 1 is pointwise. In particular, the theorem assumes neither a uniform positive lower bound nor a finite upper bound for the curvature. No volume-growth, noncollapsing, Ricci-pinching, or topological hypothesis is added. Its conclusion identifies the entire complex manifold with $bb(C)^n$; it does not assert that the given metric is Euclidean. In particular, $M$ is Stein and contractible. It resolves Yau’s uniformization conjecture for strictly positive holomorphic bisectional curvature in every complex dimension.

=== 1.1 Antecedents and the remaining analytic difficulties <antecedents-and-the-remaining-analytic-difficulties>

The one-dimensional case belongs to the classical relation between curvature and conformal type. A complete noncompact Riemann surface of positive Gaussian curvature is conformally the plane, by Cohn-Vossen’s topology theorem and the parabolicity theorem of Blanc–Fiala–Huber [13] Satz 8[29] Theorem 15. In the compact setting, the Frankel conjecture was resolved by Mori and by Siu–Yau: positive holomorphic bisectional curvature characterizes complex projective space [41,51]. Yau’s noncompact question asks for an analogous characterization of complex Euclidean space while allowing unrestricted geometry at infinity [57] §9(b), p. 45.

One route to this problem studies holomorphic functions and algebraic embeddings. Greene–Wu showed that positive real sectional curvature yields a smooth strictly convex exhaustion and hence Steinness [25] Theorem 10. Mok obtained an affine-algebraic embedding under positive bisectional curvature, maximal volume growth, and quadratic scalar-curvature decay [40]. These results connect curvature to global function theory while retaining hypotheses or conclusions different from unrestricted uniformization. Chen–Zhu proved intrinsic growth and average-curvature estimates under pointwise positive bisectional curvature [10]. In particular, their linear average-scalar-curvature bound requires no upper curvature bound, but its constant may depend on the center. They also pursued algebraic compactification under bounded positive sectional curvature and a finite top Ricci integral [11]. Ni–Tam developed heat deformation of plurisubharmonic functions under nonnegative bisectional curvature, without a global upper curvature bound [44]. Their smoothing theorem keeps an explicit growth condition on the initial function.

A second route uses geometric flow to construct shrinking holomorphic charts and then assembles those charts by complex dynamics. Cao’s differential Harnack estimates for Kähler–Ricci flow [6] are an analytic antecedent of this approach. Chau–Tam established uniformization under bounded nonnegative bisectional curvature and maximal volume growth [7]. Their later work developed locally biholomorphic charts, covering and pseudoconvex-domain conclusions, and soliton-limit methods under additional curvature-decay or pinching conditions [9,8]. The distinction between a covering, a map onto a domain, and a biholomorphism onto all of $bb(C)^n$ is essential here. Liu proved uniformization under nonnegative bisectional curvature and maximal volume growth, without an upper curvature bound, using a Gromov–Hausdorff approach and retracting holomorphic vector fields [38]. Lee–Tam subsequently obtained the same conclusion under these hypotheses by smoothing the metric and applying the bounded-curvature theorem [34]. Both results retain maximal volume growth.

Recent work has removed assumptions at infinity in important special cases.#footnote[The cited versions also record AI assistance. Datar, Pingali, and Seshadri credit ChatGPT pro 5.2 with the normalization observation used in Lemma 5.13, as well as feedback and discussions [17] Section 1.1 and Acknowledgments. Their later paper credits ChatGPT 5.5 Pro with the auxiliary function and induction for the Bézout estimates, and ChatGPT 5.0 in thinking mode with the heat-comparison estimate recalled as Lemma 2.2 [18] Sections 1–3. Wu reports ChatGPT-6 assistance in developing the proofs and the author’s verification of the arguments [56] Acknowledgments.] Datar, Pingali, and Seshadri [17] Theorem 1 prove that every complete noncompact Kähler surface with positive real sectional curvature is biholomorphic to $bb(C)^2$. Their method uses Lipschitz plurisubharmonic weights of finite Monge–Ampère mass and weighted holomorphic functions. For positive bisectional curvature, their Theorem 2 gives the same conclusion under strong Steinness, contractibility, and simple connectivity at infinity. Here strong Steinness means the existence of a smooth plurisubharmonic exhaustion with bounded gradient. Wu [56] Corollaries 1.5–1.6 removes contractibility from this criterion: strong Steinness and simple connectivity at infinity suffice. Wu also obtains the conclusion under positive bisectional curvature when the latter topological condition holds and the real sectional curvatures are nonnegative outside a compact set. These are surface results; positive real sectional curvature is a stronger hypothesis than positive holomorphic bisectional curvature.

The finite-mass approach also leads to higher-dimensional results. Datar, Pingali, and Seshadri [18] Theorem 1.1 prove finiteness of the integral of the top power of the Ricci form on complete noncompact Kähler manifolds with positive real sectional curvature. Their theorem also applies under positive bisectional curvature when a smooth strictly plurisubharmonic exhaustion with uniformly bounded gradient is available; with positive bounded sectional curvature, they obtain quasiprojectivity [18] Theorem 1.2. Dat [16] develops an $m$-Hessian capacity approach to finite-Monge–Ampère weights in complex dimensions at least three; its proposed uniformization route retains proper-map and multiplicity assumptions.

A complementary direction relates holomorphic growth to the asymptotic geometry of the Kähler–Ricci flow. Shi [50] Theorem 1.6 proves an identity between the minimal growth degree of holomorphic volume forms and the refined minimal degrees of holomorphic functions for complete noncompact Kähler manifolds with nonnegative bisectional curvature and nonsplitting universal cover. Under maximal volume growth, the flow results and coordinates in [50] Theorem 1.7 and Corollary 1.12 connect these holomorphic degrees with Lyapunov exponents. This gives a quantitative connection between the function-theoretic and flow approaches to uniformization in that growth regime.

Two issues must be addressed in the unrestricted problem. First, the initial metric can have unbounded curvature and arbitrarily collapsed regions. A complete bounded-curvature flow theorem or a global tensor maximum principle cannot therefore be used without first establishing its hypotheses. Second, shrinking charts alone can identify the manifold with a proper domain in $bb(C)^n$. To obtain surjectivity, one needs quantitative control of their coordinate changes even when contraction rates vary substantially.

=== 1.2 Structure of the proof <structure-of-the-proof>

Write $g$ for the initial metric and fix $o in M$. We construct a global Kähler–Ricci flow $h_t$ by complete Hermitian approximations on exhausting domains. Estimates for the metric and its logarithmic volume loss $rho \( x \, t \) = log \( det g \( x \) \/ det h_t \( x \) \)$ pass to the limit without global curvature control. A spatial weight adapted to the nonnegative form $g - h_t$ then proves scalar comparison before completeness of $h_t$ is known. This order is important: completeness is a later consequence of the Harnack inequality.

The curvature argument takes place on the holomorphic cotangent bundle. We minimize the boundary squared dual norm over holomorphic discs, with compact boundary walls and a vanishing area penalty. The canonical symplectic bivector relates the complex Hessian of the norm to its time derivative. A quantitative deformation lemma gives a viscosity inequality for the disc infimum; optimizing a Hermitian ellipsoid in each fiber converts that inequality into the scalar comparison already proved. The infimum therefore equals the evolving squared dual norm. This gives joint positivity in space and logarithmic time, hence the matrix and scalar Harnack inequalities.

The proof uses three time parameters, each for a different estimate:

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Clock
], table.cell(rowspan: 1, colspan: 1)[Definition
], table.cell(rowspan: 1, colspan: 1)[Role
]),
  table.cell(rowspan: 1, colspan: 1)[Physical time
], table.cell(rowspan: 1, colspan: 1)[$t$
], table.cell(rowspan: 1, colspan: 1)[Kähler–Ricci flow
],
  table.cell(rowspan: 1, colspan: 1)[Logarithmic time
], table.cell(rowspan: 1, colspan: 1)[$tau = log t$
], table.cell(rowspan: 1, colspan: 1)[Joint positivity and Harnack estimates
],
  table.cell(rowspan: 1, colspan: 1)[Volume clock
], table.cell(rowspan: 1, colspan: 1)[$s = rho \( o \, t \)$
], table.cell(rowspan: 1, colspan: 1)[Chart contraction and polynomial degrees
],
)
]

The volume clock becomes strictly increasing by the Ricci positivity proved in Section 7. Sections 4–5 use $s$ temporarily for the physical time at a disc center; from Section 7 onward it always denotes the volume clock.

The volume clock measures contraction directly. For the transition $F_(s \, u)$ from a centered unitary chart at clock $s$ to one at $u gt.eq s$,

$ \| det F'_(s \, u) \( 0 \) \| = e^(- \( u - s \) \/ 2) . $

Writing $R \( x \, t \)$ for the scalar curvature of $h_t$, the speed of the volume clock in logarithmic time is $q \( s \) = d s \/ d tau = t R \( o \, t \)$. A static logarithmic-norm estimate bounds the greatest singular length of an $h_t$-unitary local chart, measured in the initial metric $g$, by a fixed power of its least singular length. Together with the determinant loss, this controls contraction in every direction. Selected time intervals with Ricci pinching then give a contraction argument for loops. Simple connectivity allows the local inverse charts to continue coherently over exhausting compact sets, and a plurisubharmonic Liouville argument gives one contraction exponent valid on every fixed compact set.

Finally, we normalize the volume jets of the transition maps and construct polynomial automorphisms with constant Jacobian. The nonlinear shears used to realize normalized jets have determinant one; the full models retain their contracting linear determinant. Intervals of nonuniform contraction are allowed: their degree cost is charged to growth of $q$ in the volume clock. Inverse iteration of these models makes the corrected inverse charts converge to an injective holomorphic map $M arrow.r bb(C)^n$. A subsequential bound for the degree of the forward compositions, together with smallness on compact subsets of the image and an inverse-ball inclusion, rules out a finite maximal radius for centered balls in the image. This proves that the limiting coordinate map is onto all of $bb(C)^n$.

These mechanisms are proved in the order in which they are used. Sections 2–3 establish the initial analytic data and scalar comparison. Sections 4–6 prove joint positivity by discs and ellipsoids. Section 7 obtains completeness, simple connectivity, and quantitative shrinking charts. Sections 8–9 construct the biholomorphism. In particular, the disc-deformation estimate and the forward-degree estimate are stated with the uniformities needed at their later applications.

=== 1.3 Conventions <conventions>

We use the real curvature convention in which $"Rm" \( a \, b \, b \, a \)$ is the sectional-curvature numerator of the plane spanned by $a \, b$. The hypothesis is

$ "Rm" \( u \, v \, v \, u \) + "Rm" \( u \, J v \, J v \, u \) > 0 $

for every pair of real unit tangent vectors $u \, v$ at every point. By the Kähler symmetries, this is equivalent to Griffiths strict positivity of $T^(1 \, 0) M$ in complex notation. In complex dimension one the displayed sum equals Gaussian curvature.

We identify a Hermitian tensor $\( a_(i macron(j)) \)$ with its real $\( 1 \, 1 \)$-form, suppressing the factor $sqrt(- 1)$ when no confusion can result. Thus $partial accent(partial f, ‾)$ denotes the complex Hessian of $f$, $Delta_h f = "tr"_h partial accent(partial f, ‾)$, and

$ partial_t h_t = - "Ric" \( h_t \) \, #h(2em) "Ric" \( h \) = - partial macron(partial) log det h . $

All Laplacian, curvature, and volume conventions in the proof use this normalization. The dual of a Hermitian metric includes the transpose dictated by the holomorphic cotangent pairing; matrix contractions below retain it explicitly when necessary.

The initial complete metric is $g$, a fixed base point is $o$, and $r \( x \) = d_g \( o \, x \)$. Constants may change between estimates. Subscripts indicate dependencies when those dependencies matter. For Hermitian forms, $A = O \( b \) h$ means $- C b h lt.eq A lt.eq C b h$. The abbreviation psh means plurisubharmonic. A positive constant extracted from curvature on a specified compact set is never understood to be uniform over all of $M$.

== 2 Functions, sections, and smoothing on the initial manifold <sec:preliminaries>

Throughout this Section, distances, balls, norms, and volume are those of the complete initial metric $g$. Fix $o in M$ and put $r \( x \) = "dist"_g \( o \, x \)$. Constants may depend on $g$ and $o$. In particular, the estimates below are not estimates uniform over all choices of center.

We prepare the functions and estimates used in the flow and disc arguments. Holomorphic interpolation supplies global functions and tangent fields for controlling analytic discs, and canonical sections with growth bounds for the flow’s potential barriers. Heat smoothing produces a smooth exhaustion with controlled complex Hessian; combined with the canonical sections, its cutoffs yield averaged curvature estimates.

#thm([Proposition 2.1.])[
  (Initial analytic data).  #emph[The following objects and estimates are available.]
  + #emph[There is a smooth strictly plurisubharmonic function $psi$ with $psi lt.eq C \( 1 + r \)$.]
  + #emph[Holomorphic functions and holomorphic tangent fields interpolate arbitrary finite jets at a finite set of points. There are finitely many holomorphic functions defining an injective immersion $F : M arrow.r bb(C)^N$, and finitely many global holomorphic tangent fields spanning $T^(1 \, 0) M$ at every point.]
  + #emph[At every point $x$ there is a global holomorphic canonical section $S$ with $S \( x \) eq.not 0$ and $log \| S \|_g^2 lt.eq C_S \( 1 + r \)$. There is also a smooth function $Xi$ such that 
#[#set math.equation(numbering: n => "(2.1)")
 $ partial macron(partial) Xi gt.eq "Ric" \( g \) \, #h(2em) Xi lt.eq C \( 1 + r^(3 \/ 2) \) . $ <prelim:xi>]

]
  + #emph[There is a smooth exhaustion $u gt.eq 1$ such that 
#[#set math.equation(numbering: n => "(2.2)")
 $ C^(- 1) \( 1 + r \) lt.eq u lt.eq C \( 1 + r \) \, #h(2em) \| partial u \|_g lt.eq C \, #h(2em) \| partial accent(partial u, ‾) \|_g lt.eq C \/ u . $ <prelim:exhaustion>]

]
  + #emph[If $S \( o \) eq.not 0$ is chosen as in (iii), then, for $L gt.eq 1$, 
#[#set math.equation(numbering: n => "(2.3)")
 $ frac(1, "Vol" B \( o \, L \)) integral_(B \( o \, L \)) \| log \| S \|_g^2 #scale(x: 120%, y: 120%)[\|] thin d V_g lt.eq C L \, #h(2em) frac(1, "Vol" B \( o \, L \)) integral_(B \( o \, L \)) R_g thin d V_g lt.eq C \/ L . $ <prelim:averages>]

]
  #emph[Neither $F$ nor $psi$ is asserted to be proper. The exhaustion in (iv) has a two-sided complex Hessian bound.]
] <prop:initial-data>

=== 2.1 The weight and holomorphic interpolation <the-weight-and-holomorphic-interpolation>

Let $gamma$ be a unit-speed ray starting at $o$ and let

$ b \( x \) = lim_(j arrow.r oo) { d_g \( o \, gamma \( j \) \) - d_g \( x \, gamma \( j \) \) } . $

The triangle inequality gives monotonicity of the expressions in braces, their boundedness on compact sets, and $\| b \( x \) - b \( y \) \| lt.eq d_g \( x \, y \)$. We recall the complex Hessian comparison that makes $b$ strictly plurisubharmonic; this is the Busemann input in the argument of Chen–Zhu [10] Section 2.

Take $x$ in a fixed compact set and a minimizing segment of length $l$ from $x$ to $gamma \( j \)$. For an initial vector $X$, use its parallel translate multiplied by $1 - sigma \/ l$ as a comparison variation field, and use the same field construction for $J X$. The second variation of length is computed on their perpendicular components. Its curvature contribution is the negative of

$ integral_0^l \( 1 - sigma \/ l \)^2 { "Rm" \( dot(gamma) \, X_parallel \, X_parallel \, dot(gamma) \) + "Rm" \( dot(gamma) \, J X_parallel \, J X_parallel \, dot(gamma) \) } thin d sigma . $

Removing radial components does not change this expression. It is a positive multiple of the bisectional curvature before the minus sign. On a fixed short initial subsegment, positivity is bounded below for all unit initial vectors and all unit initial directions based in the chosen compact. The derivative term in the index form is $O \( l^(- 1) \)$. Consequently the sum of the two second derivatives of the distance is at most $- c_K \| X \|^2 + O \( l^(- 1) \) \| X \|^2$, with $c_K > 0$.

This comparison does not require a smooth distance function. Vary the initial endpoint along a holomorphic germ and use the comparison paths to obtain smooth upper supports for distance. The sum of the endpoint acceleration terms vanishes for the two real directions of that germ. Their negatives give lower supports for the signed distance, with the same strict Levi lower bound. An upper test for the signed distance also lies above its lower support and therefore has this Levi lower bound. Local uniform passage to $b$ gives the same viscosity inequality. Equivalently, testing on complex lines gives the subharmonic inequality. Thus $b$ is strictly plurisubharmonic, with a positive Levi lower bound on each compact. Richberg approximation, with pointwise error less than one, gives a smooth strictly plurisubharmonic $psi$ with $psi lt.eq 1 + r$ after adding a constant [46][24] Section 4, Corollary 2.

Here are the bundle choices for the interpolation step. Write $K = and.big^n T^(* \( 1 \, 0 \)) M$. A function, a canonical section, and a tangent field can be regarded respectively as a holomorphic top form with coefficients in

#[#set math.equation(numbering: n => "(2.4)")
 $ K^(- 1) \, #h(2em) upright(bold(1)) \, #h(2em) T^(1 \, 0) M ⊗ K^(- 1) . $ <prelim:coefficient-bundles>]

The first has nonnegative curvature, the second is flat, and the last has nonnegative Nakano curvature: it is $E ⊗ det E$ for the Griffiths-positive bundle $E = T^(1 \, 0) M$, so the Demailly–Skoda tensor-with-determinant theorem applies [19] Theorem 2.6. These statements refer to the coefficient bundles in (2.4); no Nakano positivity of $E$ itself is being assumed.

For completeness, prescribe jets of order $m$ at a finite set $A$. Choose disjoint coordinate balls and local holomorphic sections with those jets, multiply them by cutoffs equal to one on smaller balls, and call the resulting smooth section $s_0$. Its $macron(partial)$ is supported in a compact set disjoint from $A$. Use the weight

$ k psi + sum_(a in A) c_m theta.alt_a log \| z_a \|^2 \, #h(2em) c_m > n + m \, $

where each $theta.alt_a$ is one near $a$ and supported in the chosen coordinate ball. The negative Hessian terms of the cutoff logarithms are supported in a fixed compact. A sufficiently large $k$ makes the total weight strictly plurisubharmonic and dominates those terms. The inverse-curvature norm of $accent(partial s, ‾)_0$ is integrable, since its support avoids the poles. The complete Kähler $L^2$ estimate for bundle-valued top forms gives $v$ with $accent(partial v, ‾) = accent(partial s, ‾)_0$ and finite weighted norm [28][19] Theorem 5.1. The singular-weight statement follows by regularizing the logarithms, using uniform estimates, and taking a weak limit. Near a point of $A$, $v$ is holomorphic; integrability against $\| z_a \|^(- 2 c_m)$ forces its Taylor coefficients through order $m$ to vanish. Hence $s_0 - v$ has the prescribed jets. This also proves point separation by including two points in $A$.

For a canonical section, the same construction gives

$ integral_M \| S \|_g^2 e^(- k psi) thin d V_g < oo . $

The cutoff pole weights can be dropped in this estimate at the price of a constant. The function $\| S \|_g^2$ is subharmonic: away from its zeros, $partial macron(partial) log \| S \|_g^2 = "Ric" \( g \)$, and its squared norm has the same nonnegative distributional Laplacian across the zeros. The local mean-value inequality on a radius-one ball [35] Theorem 2.1, together with the upper bound for $psi$, yields

$ \| S \( x \) \|_g^2 lt.eq frac(C_S, "Vol" B \( x \, 1 \)) exp #scale(x: 120%, y: 120%)[\(] C_S \( 1 + r \( x \) \) #scale(x: 120%, y: 120%)[\)] . $

Nonnegative Ricci curvature gives $"Vol" B \( x \, 1 \) gt.eq c \( 1 + r \( x \) \)^(- 2 n)$ by Bishop–Gromov relative volume comparison with a fixed ball at $o$ [26] §2.1. Its polynomial loss is absorbed by the exponential. This proves the growth assertion in Proposition 2; compare the canonical-section construction in [10] Section 3.

We explain why finite tuples suffice, using the dimension-count argument underlying parametric transversality. The compact-open spaces of holomorphic functions and sections are Fréchet and hence Baire spaces. Fix a compact family of points, or of distinct pairs of points. Surjectivity of finite-jet evaluation, openness of matrix rank, and a finite cover give a finite-dimensional space of perturbations whose evaluation derivative is onto on a neighborhood of that compact family. This derivative is independent of the perturbation parameter, since the evaluations are affine linear. Thus the universal evaluation is a submersion there.

For each smooth stratum of the forbidden locus, its inverse image has real codimension equal to that of the stratum. If this codimension exceeds the real dimension of the point or pair space, the inverse image has dimension less than the perturbation space. Its projection to that space has measure zero: cover it by countably many compact coordinate patches; on each patch the projection is Lipschitz, and covering a $d$-dimensional cube by $O \( delta^(- d) \)$ cubes shows that its image in $bb(R)^p$, $p > d$, has volume at most $C delta^(p - d)$. Consequently arbitrarily small perturbations avoid the forbidden strata on the prescribed compact family.

For $N$ functions, the rank-$r$ stratum of $N times n$ derivative matrices has complex codimension $\( N - r \) \( n - r \) gt.eq N - n + 1$ when $r < n$. For $N gt.eq 2 n + 1$ this exceeds $n$. The equal-values condition on distinct pairs has complex codimension $N > 2 n$. Avoidance on a compact is open in the compact-open topology, using Cauchy estimates for derivatives. A countable exhaustion of $M$ and of $M times M \\ "diag"$, followed by Baire intersection, therefore gives one finite injective immersion. For $m$ tangent sections the least deficient-rank codimension is $m - n + 1 > n$ when $m gt.eq 2 n$. The same zeroth-jet argument gives a finite spanning family. Neither conclusion asserts properness.

Choose countably many canonical sections $S_i$ with no common zero. Write $a_i = \| S_i \|_g^2$. The bound $a_i lt.eq exp \( C_i \( 1 + r \) \)$ implies

$ a_i lt.eq e^(B_i) exp \( 1 + r^(3 \/ 2) \) $

for a finite $B_i$, because a linear function of $r$ is bounded above by $r^(3 \/ 2)$ plus a constant. Choose $c_i > 0$ so small that $c_i e^(B_i) lt.eq 2^(- i)$ and that every derivative of $c_i a_i$ of order at most $i$ has norm at most $2^(- i)$ on the first $i$ exhaustion compacts. The sum $sum c_i a_i$ converges smoothly locally, is positive, and is bounded above by $exp \( 1 + r^(3 \/ 2) \)$. In a local canonical frame it is $det \( g \)^(- 1)$ times a sum of squares of holomorphic functions. Thus $Xi = log sum c_i \| S_i \|_g^2$ satisfies (2.1).

=== 2.2 Hodge heat without a curvature upper bound <hodge-heat-without-a-curvature-upper-bound>

To smooth the distance truncations used below, we need to preserve an upper bound for their complex Hessians. Scalar heat estimates will then control the trace and give the missing lower Hessian bound. We also record how heat evolution of a bounded closed $\( 1 \, 1 \)$-form produces a scalar potential for its change; this identity will be used again when constructing the flow comparison cutoff.

Let $H_a$ denote scalar heat for $Delta_g$. Normalize the Hodge heat operator $cal(H)_a$ on real $\( 1 \, 1 \)$-forms so that it agrees with $H_a$ after taking the trace. The normalization is also chosen so that its generator on closed real $\( 1 \, 1 \)$-forms is $A mapsto partial macron(partial) "tr"_g A$.

The scalar heat kernel has total mass one. Indeed, fix its pole $y$ and let $chi_R$ be a Lipschitz distance cutoff equal to one on $B_g \( y \, R \)$, supported in $B_g \( y \, 2 R \)$, and satisfying $\| nabla chi_R \| lt.eq C \/ R$. The Gaussian estimate of Li–Yau [36] and the kernel gradient estimate of Souplet–Zhang [52] Theorem 1.3, together with Bishop–Gromov comparison [26] §2.1, give

$ integral_(R lt.eq d_g \( x \, y \) lt.eq 2 R) \| nabla_x H_s \( x \, y \) \| thin d V_g \( x \) lt.eq C s^(- 1 \/ 2) \( 1 + R \/ sqrt(s) \)^N e^(- c R^2 \/ s) $

for a fixed dimensional exponent $N$. Integrating the heat equation against $chi_R$ from $epsilon$ to $t lt.eq T$ and then letting $epsilon arrow.b 0$ therefore yields

$ lr(|integral_M chi_R \( x \) H_t \( x \, y \) thin d V_g \( x \) - 1|) lt.eq C / R integral_0^T s^(- 1 \/ 2) \( 1 + R \/ sqrt(s) \)^N e^(- c R^2 \/ s) thin d s . $

The right side tends to zero as $R arrow.r oo$. Positivity and the sub-Markov property of the minimal kernel allow passage to the total mass, proving $H_t 1 = 1$. The cutoffs here require only completeness and the first derivative of distance; they precede the smooth exhaustion constructed below.

#thm([Lemma 2.2.])[
  (Heat order and commutation).  #emph[For bounded real $\( 1 \, 1 \)$-forms, Hodge heat is well defined by cutoff limits of the complete $L^2$ semigroup. It preserves order and obeys 
$ - C g lt.eq A lt.eq C g quad arrow.r.double quad - C g lt.eq cal(H)_a A lt.eq C g \, #h(2em) "tr"_g cal(H)_a A = H_a "tr"_g A . $

 If $A$ is also smooth and closed, then 
#[#set math.equation(numbering: n => "(2.5)")
 $ cal(H)_a A = A + partial macron(partial) integral_0^a H_b "tr"_g A thin d b . $ <prelim:hodge-identity>]

 If a Lipschitz function $f$ is constant off a compact set and $partial accent(partial f, ‾) lt.eq C g$ as currents, then 
#[#set math.equation(numbering: n => "(2.6)")
 $ partial accent(partial H, ‾)_a f lt.eq C g #h(2em) \( a > 0 \) . $ <prelim:hessian-preservation>]

]
] <lem:hodge-heat>

#proof[
  First take smooth compactly supported data. On a relatively compact smooth domain use the componentwise zero-Dirichlet realization of the Hodge heat equation. Its Weitzenböck formula is a connection Laplacian plus a zeroth-order curvature reaction. At a null vector $X$ of a nonnegative Hermitian form $A$, diagonalize $A$ in a unitary frame. The reaction on $\( X \, macron(X) \)$ is a positive fixed multiple of
  $ sum_j R_g \( X \, macron(X) \, e_j \, macron(e)_j \) A_(j macron(j)) gt.eq 0 \; $
  the Ricci-times-$A$ terms vanish there. The tensor maximum principle therefore preserves the nonnegative cone. Applying the same argument to $C g - A$, with nonnegative boundary data, proves the upper bound by $C g$. The trace satisfies the scalar heat equation, including the zero boundary condition. This is the null-eigenvector mechanism in [44] Section 2.
  We specify the complete realization and the exhaustion step. On compactly supported smooth forms put $D = d + d^(*)$. Completeness gives essential self-adjointness of $D^2$ and hence of $D$: a deficiency vector for $D$ would lie in the kernel of $\( D^2 \)^(*) + 1$, which is zero [5] Corollary 2.10 and Remark 2.12. The closed quadratic form of the resulting Hodge Laplacian is
  $ q \( A \) = parallel d A parallel_2^2 + parallel d^(*) A parallel_2^2 \, #h(2em) V = overline(C_c^oo)^(thin \( parallel dot.op parallel_2^2 + q \)^(1 \/ 2)) . $
  For a nested smooth exhaustion $Omega_j$, let $V_j$ be the same closure of forms supported in $Omega_j$, extended by zero. On a fixed domain, local ellipticity identifies this with the full zero boundary-value section domain. It is not an absolute or relative Hodge boundary condition. The spaces $V_j$ are nested and their union is dense in $V$. For $lambda > 0$, the domain resolvent applied to an $L^2$ form, and extended by zero, is the orthogonal projection of the complete resolvent onto $V_j$ for the inner product $q + lambda chevron.l dot.op \, dot.op chevron.r$: both satisfy the same variational identity against $V_j$. The projections therefore converge in that norm. Strong resolvent convergence and the common lower bound zero imply strong heat convergence [54] Section 6.6, Theorem 6.31 and Corollary 6.33. Here $Delta_j$ denotes the nonnegative domain Hodge Laplacian. Zero extension of its heat means $e^(- a Delta_j) P_j$, where $P_j$ is restriction followed by zero extension; it does not mean extending its generator by zero. The cone and trace assertions pass to this limit and then to bounded data by cutoff and local regularity. More explicitly, the complete Hodge semigroup has the off-diagonal estimate
  #[#set math.equation(numbering: n => "(2.7)")
   $ parallel upright(bold(1))_E cal(H)_a upright(bold(1))_F parallel_(2 arrow.r 2) lt.eq C exp #scale(x: 120%, y: 120%)[\(] - c "dist" \( E \, F \)^2 \/ a #scale(x: 120%, y: 120%)[\)] . $ <prelim:off-diagonal>]
  To see that this estimate needs no curvature upper bound, use the self-adjoint first-order operator $d + d^(*)$. Its principal symbol has norm equal to the covector norm, so the wave evolution has finite propagation speed [39] Theorem 1.1 and Section 4. The Gaussian Fourier representation of $exp \( - a \( d + d^(*) \)^2 \)$ then gives (2.7), with the inessential change of constants required by our normalization [14] Theorem 3.4. Since $"Vol" B \( o \, R \) lt.eq C R^(2 n)$, dyadic annular decomposition shows that the cutoff evolutions of a bounded form are Cauchy in $L^2$ on each compact, uniformly for bounded positive times. Interior parabolic estimates, whose coefficients are bounded on the compact under consideration, give smooth convergence away from $a = 0$.
  Closedness is proved using the complete semigroup, not the Dirichlet operators on domains. Let $zeta_R$ be a compactly supported Lipschitz cutoff equal to one on $B \( o \, R \)$, supported on $B \( o \, 2 R \)$, and satisfying $\| d zeta_R \| lt.eq C \/ R$. The complete Hodge semigroup commutes with $d$ on the $L^2$ domains, by the self-adjoint de Rham complex. The fixed time normalization does not affect the spectral identity $D e^(- a D^2) = e^(- a D^2) D$, and projection to degree one higher gives the $d$ identity. The data $zeta_R A$ used here belong to the full $D$ graph domain by compactly supported $H^1$ approximation. For bounded closed $A$,
  $ d cal(H)_a \( zeta_R A \) = cal(H)_a^(\( 3 \)) \( d zeta_R and A \) . $
  The data on the right have $L^2$ norm at most $C R^(n - 1)$ and support outside $B \( o \, R \)$. Estimate (2.7) in degree three shows that they tend to zero on each fixed compact, uniformly for $0 < a lt.eq a_0$. Distributional passage to the limit proves $d cal(H)_a A = 0$. Local regularity also gives the initial value $A$ on each compact. Kähler commutation on closed forms now gives
  $ partial_a cal(H)_a A = partial macron(partial) "tr"_g cal(H)_a A = partial accent(partial H, ‾)_a "tr"_g A . $
  Integration proves (2.5), first in distributions and then as an identity of smooth forms for $a > 0$.
  The passage from closed form heat to a scalar potential by integrating its trace is also the mechanism in [43] Lemma 2.1 and proof of Theorem 2.1.
  Finally put $f_0 = f - c$, where $c$ is the constant value at infinity. This is a compactly supported Lipschitz function. Complete $L^2$ Kähler commutation, smooth approximation, and duality give, for a compactly supported nonnegative Hermitian test form $B$,
  $ chevron.l partial accent(partial H, ‾)_a f_0 \, B chevron.r = chevron.l partial accent(partial f, ‾)_0 \, cal(H)_a B chevron.r . $
  The metric pairing here identifies the cone of nonnegative Hermitian forms with its dual; equivalently one pairs the current with the Hodge star of $B$. Choose $0 lt.eq zeta lt.eq 1$ compactly supported and equal to one near $"supp" f_0$. Since $partial accent(partial f, ‾)_0$ is supported there,
  $ chevron.l partial accent(partial f, ‾)_0 \, cal(H)_a B chevron.r = chevron.l partial accent(partial f, ‾)_0 \, zeta cal(H)_a B chevron.r lt.eq C integral zeta "tr"_g cal(H)_a B thin d V_g lt.eq C integral "tr"_g B thin d V_g . $
  Positivity and scalar trace commutation justify the last two steps. Finally $H_a 1 = 1$ under nonnegative Ricci curvature, so $partial accent(partial H, ‾)_a f = partial accent(partial H, ‾)_a f_0$. This proves (2.6). ◻
]

=== 2.3 Dyadic smoothing and averaged curvature <dyadic-smoothing-and-averaged-curvature>

For $L = 2^j$, $j gt.eq 0$, choose a fixed smooth nondecreasing scalar truncation of $r^2 \/ L^2$ which is zero on $r lt.eq L$ and one on $r gt.eq 2 L$, and denote it by $f_L$. It is Lipschitz, with constant $C \/ L$. The paired index-form comparison with linear parallel fields gives $partial accent(partial r, ‾)^2 lt.eq C g$ away from the cut locus and in the upper-support sense at the cut locus. The derivative-square term introduced by the truncation is bounded on its annulus. Hence

$ partial accent(partial f, ‾)_L lt.eq C L^(- 2) g $

as currents. The word “smooth” here describes the scalar truncation; $f_L$ itself need not be smooth at the cut locus.

Let $w_L = H_(epsilon.alt L^2) f_L$, with a fixed sufficiently small $epsilon.alt > 0$. Gaussian heat bounds and the Lipschitz estimate give

$ parallel w_L - f_L parallel_oo lt.eq \( C \/ L \) sup_x integral d_g \( x \, y \) H_(epsilon.alt L^2) \( x \, y \) thin d V_g \( y \) lt.eq C sqrt(epsilon.alt) . $

Nonnegative Ricci curvature is sufficient for these scalar heat estimates. Applying the Li–Yau gradient inequality to the positive heat solutions $1 + H_a f_L$ and $2 - H_a f_L$ gives, at $a = epsilon.alt L^2$,

$ \| Delta_g w_L \| lt.eq C_epsilon.alt L^(- 2) \, #h(2em) \| partial w_L \|_g lt.eq C_epsilon.alt L^(- 1) . $

Indeed the first translate bounds $partial_a H_a f_L$ from below, the second bounds it from above, and substituting both time bounds in the same inequalities bounds the gradient; see [36] Theorem 1.3(i). Lemma 3 gives the upper bound for each complex Hessian eigenvalue, and the lower trace bound then gives the lower bound for each eigenvalue. Thus $\| partial accent(partial w, ‾)_L \|_g lt.eq C_epsilon.alt L^(- 2)$.

Choose a fixed smooth nondecreasing step $theta$ which is zero near zero and one near one, with the constant regions wide enough to contain the above heat error. Then $v_L = theta \( w_L \)$ is identically zero on $r lt.eq L$ and one on $r gt.eq 2 L$, and

$ \| partial v_L \|_g lt.eq C \/ L \, #h(2em) \| partial accent(partial v, ‾)_L \|_g lt.eq C \/ L^2 . $

The locally finite sum

$ u = 1 + sum_(j gt.eq 0) 2^j v_(2^j) $

is comparable to $1 + r$. At any point, only a bounded number of summands have nonzero derivatives; their scales are comparable to $1 + r$. This proves (2.2). In particular, scalar cutoffs $p \( u \/ L \)$ have gradient $O \( L^(- 1) \)$ and absolute complex Hessian $O \( L^(- 2) \)$, with support and transition region in fixed multiples of $B \( o \, L \)$.

Put $w = log \| S \|_g^2$ for a canonical section with $S \( o \) eq.not 0$. The Poincaré–Lelong formula gives

#[#set math.equation(numbering: n => "(2.8)")
 $ partial accent(partial w, ‾) gt.eq "Ric" \( g \) $ <prelim:canonical-current>]

as currents. The truncations $w_m = max \( w \, - m \)$ are subharmonic. The heat submean inequality and the linear upper growth give

$ w_m \( o \) lt.eq H_(L^2) w_m \( o \) \, #h(2em) H_(L^2) \( w_m \)^(+) \( o \) lt.eq C L . $

One can justify the submean inequality first on exhaustion domains and then by Gaussian decay; the positive part has at most linear growth. For $m$ large, $w_m \( o \) = w \( o \)$, so $H_(L^2) \( w_m \)^(-) \( o \) lt.eq C L + \| w \( o \) \|$. The heat-kernel lower bound on $B \( o \, L \)$ is $c \/ "Vol" B \( o \, L \)$. Monotone convergence as $m arrow.r oo$ therefore proves the first estimate in (2.3).

Take a nonnegative cutoff equal to one on $B \( o \, L \)$ and supported in $B \( o \, C L \)$ with absolute Laplacian at most $C \/ L^2$, as just constructed. Integrating the trace of (2.8) against it and moving $Delta_g$ onto the cutoff gives

$ integral_(B \( o \, L \)) R_g thin d V_g lt.eq C / L^2 integral_(B \( o \, C L \)) \| w \| thin d V_g lt.eq C / L "Vol" B \( o \, L \) . $

The last step uses volume doubling. This proves the second estimate and completes Proposition 2. The average scalar-curvature conclusion is the estimate of [10] Theorem 2; the details above record the particular cutoffs and absolute logarithmic estimate needed below.

== 3 A global flow and scalar comparison by localization <sec:flow>

We first construct the flow with estimates on fixed initial compact sets. Completeness of its positive-time slices will be proved in Proposition 20.

#thm([Theorem 3.1.])[
  (Localized flow).  #emph[There is a smooth Kähler–Ricci flow $h_t$ on $M$, for $0 lt.eq t < oo$, with $h_0 = g$. There are smooth real functions $U \, P$ and $rho$ such that 
#[#set math.equation(numbering: n => "(3.1)")
 $ 0 < h_t lt.eq g \, #h(2em) h_t = g - t "Ric" \( g \) + partial accent(partial U, ‾) \, #h(2em) U \( dot.op \, 0 \) = 0 \,\
P = U_t = log frac(det h_t, det g) \, #h(2em) rho = - P gt.eq 0 \, #h(2em) R_(h_t) = - P_t gt.eq 0 . $ <flow:identities>]

 For each finite $T$, there is $C_T$ such that 
#[#set math.equation(numbering: n => "(3.2)")
 $ sup_(0 lt.eq t lt.eq T) frac(1, "Vol"_g B_g \( o \, L \)) integral_(B_g \( o \, L \)) rho \( x \, t \) thin d V_g \( x \) lt.eq C_T L #h(2em) \( L gt.eq 1 \) . $ <flow:rho-average>]

 At every fixed $x$, $rho \( x \, t \) lt.eq C_x \( 1 + t \)$ for all $t gt.eq 0$. Furthermore, on each finite time interval there is a smooth positive function $Q$ and a constant $c > 0$ with 
#[#set math.equation(numbering: n => "(3.3)")
 $ Q gt.eq c \( 1 + r^2 \) \, #h(2em) \( partial_t - Delta_(h_t) \) Q gt.eq c "tr"_(h_t) g . $ <flow:proper-supercaloric>]

 Smoothness at $t = 0$ means smoothness with all one-sided time derivatives.]
] <thm:localized-flow>

=== 3.1 Complete Hermitian approximations <complete-hermitian-approximations>

Take regular values $L arrow.r oo$ of the exhaustion $u$ in Proposition 2, and put $Omega_L = { u < L }$. Choose a fixed smooth nonnegative function $F$ on $\[ 0 \, 1 \)$, zero on $\[ 0 \, 1 \/ 2 \]$, which equals $- 2 log \( 1 - v \)$ near $v = 1$. On $Omega_L$ set

$ f = F \( u \/ L \) \, #h(2em) alpha = e^f g . $

The estimates for $u$ imply

#[#set math.equation(numbering: n => "(3.4)")
 $ \| partial f \|_alpha lt.eq C \/ L \, #h(2em) \| partial accent(partial f, ‾) \|_alpha lt.eq C \/ L^2 . $ <flow:conformal-bounds>]

For example, near the boundary $e^f = \( 1 - u \/ L \)^(- 2)$, so the factors $\( 1 - u \/ L \)^(- 1)$ and $\( 1 - u \/ L \)^(- 2)$ in the first and second derivatives are canceled by the conformal norm. On the transition region $u asymp L$, the bound $\| partial accent(partial u, ‾) \|_g lt.eq C \/ u$ gives the same estimates.

The metric $alpha$ is complete on $Omega_L$: approaching the regular boundary has infinite length for the factor $\( 1 - u \/ L \)^(- 1)$, and the closure of $Omega_L$ is compact. For each fixed $L$ it has bounded geometry of every order in holomorphic charts. Indeed choose finitely many ordinary charts on the compact closure and, near a point of boundary distance comparable to $1 - u \/ L$, rescale their coordinate radii by a sufficiently small fixed multiple of $1 - u \/ L$. In the rescaled charts $alpha$ and its inverse are uniformly bounded, and every derivative of its coefficients is bounded. The constants here are allowed to depend on $L$ and on each derivative order.

Run Chern–Ricci flow on this complete Hermitian background:

#[#set math.equation(numbering: n => "(3.5)")
 $ K = alpha - t "Ric" \( alpha \) + partial accent(partial U, ‾) \, #h(2em) U_t = P = log frac(det K, det alpha) \, #h(2em) U \( dot.op \, 0 \) = 0 . $ <flow:approximation>]

Until the passage to the local limit below, $U \, P$ refer to the approximating solution. Bounded-geometry short-time existence is [34] Definition 2.1 and Lemma 2.1. We establish estimates on every closed bounded-geometry interval of this solution; the resulting continuation intervals increase to infinity as $L$ increases.

Write $cal(L)_K = partial_t - Delta_K$. Differentiation of (3.5) gives

#[#set math.equation(numbering: n => "(3.6)")
 $ cal(L)_K P = - "tr"_K "Ric" \( alpha \) \, #h(2em) cal(L)_K P_t = - \| "Ric" \( K \) \|_K^2 \, #h(2em) P_t \( dot.op \, 0 \) lt.eq C \/ L^2 . $ <flow:scalar-evolutions>]

The last inequality follows from $"Ric" \( alpha \) = "Ric" \( g \) - n partial accent(partial f, ‾)$, initial Ricci positivity, and (3.4). In particular,

#[#set math.equation(numbering: n => "(3.7)")
 $ P_t lt.eq C \/ L^2 \, #h(2em) P lt.eq C t \/ L^2 \, #h(2em) U lt.eq C t^2 \/ \( 2 L^2 \) . $ <flow:upper-potentials>]

These are bounded maximum-principle estimates on an already existing bounded-geometry interval.

Fix a horizon $D > 0$. Suppose that $phi.alt lt.eq 0$ is smooth and

#[#set math.equation(numbering: n => "(3.8)")
 $ alpha - D "Ric" \( alpha \) + D partial macron(partial) phi.alt gt.eq c alpha quad \( c > 0 \) . $ <flow:phi-condition>]

Define

#[#set math.equation(numbering: n => "(3.9)")
 $ Q = \( D - t \) P + U - D phi.alt + n t . $ <flow:Q-definition>]

Using $cal(L)_K U = P - n + "tr"_K \( alpha - t "Ric" \( alpha \) \)$ gives the exact identity

#[#set math.equation(numbering: n => "(3.10)")
 $ cal(L)_K Q = "tr"_K { alpha - D "Ric" \( alpha \) + D partial macron(partial) phi.alt } gt.eq c "tr"_K alpha \, #h(2em) Q gt.eq 0 . $ <flow:Q-comparison>]

The initial value is $- D phi.alt gt.eq 0$. For bounded $phi.alt$, the maximum principle proves the last assertion directly; adding a vanishing positive multiple of the proper function $f$ is an equivalent localization. The same proof applies to functions with downward logarithmic poles, since $Q arrow.r + oo$ at those poles.

For a fixed $L$, choose finitely many canonical sections with no common zero on $overline(Omega_L)$. A constant shift of $log sum_i \| S_i \|_g^2$ is bounded, nonpositive, and has complex Hessian at least $"Ric" \( g \)$. It satisfies

$ alpha - D "Ric" \( alpha \) + D partial macron(partial) phi.alt gt.eq alpha + n D partial accent(partial f, ‾) gt.eq \( 1 - C D \/ L^2 \) alpha . $

Thus for fixed $D$ and sufficiently large $L$ we may take $c = 1 \/ 2$. Equations (3.7) and (3.10) give both bounds for $P$ on $0 lt.eq t lt.eq D \/ 2$: indeed $\( D - t \) P gt.eq D phi.alt - U - n t$. Integrating also gives both bounds for $U$. These bounds may depend on $L$.

=== 3.2 The largest metric eigenvalue <the-largest-metric-eigenvalue>

We next bound the largest eigenvalue of $K$ relative to $alpha$. The bound will tend to one as $L arrow.r oo$ wherever $Q$ stays bounded independently of $L$. The local potential estimates below will supply this control on each fixed compact set, yielding $h_t lt.eq g$ in the limit. At a point use $g$-normal holomorphic coordinates diagonalizing $K$, write $K_(i macron(i)) = lambda_i$, and suppose that $lambda_1$ is largest. Put $q = K_(1 macron(1))$ and

$ W = frac(K_(1 macron(1)), e^f g_(1 macron(1))) . $

The Rayleigh quotient in this fixed coordinate direction is a smooth lower support for the largest relative eigenvalue and agrees with it at the point. It therefore suffices for a maximum-principle test of that eigenvalue. Wherever $W gt.eq 1$, direct differentiation gives

#[#set math.equation(numbering: n => "(3.11)")
 $ cal(L)_K log W lt.eq - 1 / q sum_(i \, j) frac(\| partial_1 K_(i macron(j)) \|^2, lambda_i lambda_j) + \| partial log q \|_K^2 + C L^(- 2) "tr"_K alpha . $ <flow:eigenvalue-raw>]

Here are the derivative exchanges in this formula. Since $K - alpha$ is closed,

$ partial_1 partial_(macron(1)) K_(i macron(i)) - partial_i partial_(macron(i)) K_(1 macron(1)) = partial_1 partial_(macron(1)) alpha_(i macron(i)) - partial_i partial_(macron(i)) alpha_(1 macron(1)) . $

In the chosen coordinates the right side is $\( e^f \)_(1 macron(1)) - \( e^f \)_(i macron(i))$; the second derivatives of $g$ cancel by its Kähler symmetries. Dividing their contraction by $q gt.eq e^f$ bounds the error by $C L^(- 2) "tr"_K alpha$. Differentiating the denominator $g_(1 macron(1))$ contributes $- sum_i lambda_i^(- 1) R_g \( i \, macron(i) \, 1 \, macron(1) \) lt.eq 0$. The remaining conformal derivatives have the same controlled size. These facts give (3.11).

For $i eq.not 1$, the first-derivative exchange is

$ partial_1 K_(i macron(1)) = partial_i q - e^f f_i . $

The terms with $j = 1$ in the negative square in (3.11) therefore dominate

$ lr(|partial log q - W^(- 1) sum_(i eq.not 1) f_i thin d z_i|)_K^2 . $

Expanding this square and using $partial log q = partial log W + partial f$ at the point yields

#[#set math.equation(numbering: n => "(3.12)")
 $ cal(L)_K log W lt.eq C L^(- 2) "tr"_K alpha + 2 W^(- 1) \| partial f \|_K \| partial log W \|_K . $ <flow:eigenvalue-gradient>]

Set $a = L^(- 1)$ and

$ J \( v \) = a v + log \( 1 + a v \) #h(2em) \( v gt.eq 0 \) . $

At a positive maximum of $log W - J \( Q \)$, one has

$ W gt.eq e^(a Q) \( 1 + a Q \) \, #h(2em) partial log W = J' \( Q \) partial Q \, quad J' gt.eq a \, quad J' lt.eq 2 a \, quad - J'' = frac(a^2, \( 1 + a Q \)^2) . $

The chain rule, (3.10), and (3.12) give

$ cal(L)_K \( log W - J \( Q \) \) lt.eq \( C L^(- 2) - c a \) "tr"_K alpha + 2 W^(- 1) J' \| partial f \|_K \| partial Q \|_K + J'' \| partial Q \|_K^2 . $

Young’s inequality absorbs the middle term into half of $- J'' \| partial Q \|_K^2$: its remaining coefficient is bounded by

$ C frac(W^(- 2) \( J' \)^2, - J'') \| partial f \|_K^2 lt.eq C \| partial f \|_K^2 lt.eq C L^(- 2) "tr"_K alpha . $

For sufficiently large $L$, this contradicts the maximum principle. To attain the maximum on $Omega_L$, test first with the additional penalty $- delta f$. Its Hessian term is controlled by $C delta L^(- 2) "tr"_K alpha$, and its gradient terms have the same bound after Young’s inequality. Send $delta arrow.b 0$ afterwards. At $t = 0$, $W = 1$ and $Q gt.eq 0$. We conclude

#[#set math.equation(numbering: n => "(3.13)")
 $ K lt.eq e^(J \( Q \)) alpha . $ <flow:eigenvalue-bound>]

With the bounded choice of $phi.alt$, $Q$ is bounded above by (3.7). Thus (3.13) gives an upper metric bound. The lower bound for $P$, hence for $det K \/ det alpha$, then bounds the least eigenvalue below.

We spell out the continuation implication in the uniform holomorphic charts. Let $iota$ be the real symmetric representation of a Hermitian matrix and write

$ F \( B \) = 1 / 2 log det_(bb(R)) B \, #h(2em) S \( x \, t \) = iota \( alpha - t "Ric" \( alpha \) \) \, #h(2em) T \( D^2 U \) = iota \( partial accent(partial U, ‾) \) . $

Then $U_t - F \( S + T \( D^2 U \) \) = - log det_(bb(C)) alpha$. Two-sided metric equivalence puts the transformed Hessian $S + T \( D^2 U \)$ in a fixed compact convex positive matrix range. The function $F$ is smooth, concave and uniformly elliptic near this range. The map $T$ is linear, preserves nonnegativity, and has norm comparable to the original norm on nonnegative real symmetric matrices. The smooth background coefficients have uniform local Hölder bounds. These are the hypotheses of the transformed-Hessian parabolic estimate [12] Theorem 5.1. Its bound for the spatial second derivatives and first time derivative depends on $parallel U parallel_oo$ and these data, without a prior bound for the full real Hessian. Schauder estimates then give higher derivatives and continuation on each fixed approximating background, as in [34] proof of Theorem 4.1.

For initial estimates, extend $U$ by zero to negative times and use $S \( x \, t_(+) \)$, where $t_(+) = max \( t \, 0 \)$. Each fixed approximating solution is already smooth one-sided at zero by short-time existence. Since $U \( dot.op \, 0 \) = U_t \( dot.op \, 0 \) = 0$, its spatial second derivatives and first time derivative extend continuously by zero. Thus the extension is $C^2$ in the parabolic sense required by Theorem 5.1 of [12] and solves the extended equation also at zero. The time-Lipschitz background satisfies that theorem’s Hölder hypothesis, so the same estimate applies across the initial surface. Spatial differentiation and the linear equation for $P$, with smooth one-sided coefficients and initial data, give successive initial Schauder estimates. On each fixed compact these estimates are uniform in $L$ once the local metric bounds below hold and $alpha = g$ there. Thus the approximating flows exist on $\[ 0 \, D \/ 2 \]$ whenever $L$ is sufficiently large for the chosen $D$.

=== 3.3 The local limit and its potential estimates <the-local-limit-and-its-potential-estimates>

The bounds needed to pass to a limit use other choices of $phi.alt$. For any canonical section $S$ from Proposition 2, take

#[#set math.equation(numbering: n => "(3.14)")
 $ phi.alt = log \| S \|_g^2 - n f - epsilon.alt u^2 - A_epsilon.alt \, #h(2em) 0 < epsilon.alt lt.eq c_0 \/ D \, #h(2em) A_epsilon.alt = C'_S \( 1 + epsilon.alt^(- 1) \) . $ <flow:singular-weight>]

The growth bound for $S$ makes $phi.alt lt.eq 0$ after choosing $C'_S$. Since $\| partial accent(partial u, ‾)^2 \|_g lt.eq C$, the canonical-current inequality gives

$ alpha - D "Ric" \( alpha \) + D partial macron(partial) phi.alt gt.eq alpha - C D epsilon.alt g gt.eq 1 / 2 alpha $

when $c_0$ is small. The comparison is made away from the zeros of $S$, where $phi.alt$ is smooth; the downward poles localize it away from those zeros. Finite sums of squared norms may be used as well.

Fix a compact set on which the chosen section does not vanish. For all sufficiently large $L$ it lies in ${ u < L \/ 2 }$, where $f = 0$. Equation (3.7) bounds $Q$ above there by a constant independent of $L$. Equation (3.10) bounds $P$ below there, and (3.13) gives a local upper metric bound with $e^(J \( Q \)) arrow.r 1$. The determinant lower bound then gives a positive local lower metric bound. Finitely many such nonvanishing sections cover an arbitrary compact set. Local parabolic estimates on slightly larger compact sets give all derivatives, including the one-sided initial estimates, uniformly in $L$. A diagonal subsequence over compacts and increasing horizons converges smoothly to $U \, P \, h$ with $h_0 = g$. The approximations have $alpha = g$ on each fixed compact for large $L$, so (3.5) passes to the Kähler equation there. The limit of (3.13) is $h_t lt.eq g$; the limits of (3.7) give $P lt.eq 0$ and $P_t lt.eq 0$. This proves (3.1).

The $Q$ comparison also passes to the limit. For a weight $phi.alt = log \| S \|_g^2 - epsilon.alt u^2 - A_epsilon.alt$ and $t lt.eq D \/ 2$, it gives, using $U lt.eq 0$,

#[#set math.equation(numbering: n => "(3.15)")
 $ rho \( x \, t \) lt.eq frac(- D phi.alt \( x \) + n t, D - t) lt.eq 2 #scale(x: 120%, y: 120%)[\(] - log \| S \( x \) \|_g^2 + epsilon.alt u \( x \)^2 + A_epsilon.alt + n #scale(x: 120%, y: 120%)[\)] . $ <flow:rho-pointwise>]

Take $D = 2 \( T + 1 \)$ and, on a ball of large radius $L$, take $epsilon.alt$ comparable to $L^(- 1)$ and at most $c_0 \/ D$. Proposition 2 then bounds the average of the right side by $C_T L$. Bounded radii are absorbed into the constant. This proves (3.2). At a fixed $x$, choose $S \( x \) eq.not 0$, put $D = 2 \( t + 1 \)$, and take $epsilon.alt = c_0 \/ D$. The same inequality gives $rho \( x \, t \) lt.eq C_x \( 1 + t \)$.

Finally replace $log \| S \|_g^2$ by $Xi$. For every sufficiently small $epsilon.alt > 0$, the smooth function $phi.alt_epsilon.alt = Xi - epsilon.alt u^2 - A_epsilon.alt$ is nonpositive after a finite constant shift and gives a smooth nonnegative $Q_epsilon.alt$ with the differential inequality in (3.10), now with $alpha = g$. The difference

$ Q_epsilon.alt - Q_(epsilon.alt \/ 2) = frac(D epsilon.alt, 2) u^2 + D \( A_epsilon.alt - A_(epsilon.alt \/ 2) \) $

shows that $Q_epsilon.alt gt.eq c u^2 - C$ because $Q_(epsilon.alt \/ 2) gt.eq 0$. Adding a constant gives a positive $Q$ satisfying (3.3). Theorem 4 is proved.

=== 3.4 A cutoff adapted to the evolving metric <a-cutoff-adapted-to-the-evolving-metric>

The comparison arguments below require a positive integrable weight $chi$ with $partial macron(partial) chi lt.eq C chi h_t$. A polynomial weight $u^(- k)$ gives only a Hessian bound by $C u^(- k - 2) g$, and $h_t$ need not be uniformly comparable to $g$ at infinity. We therefore construct a function $H$ whose complex Hessian approaches $g - h_t$ at infinity. The factor $exp \( - A H \/ u^2 \)$, for a suitable $A > 0$, will contribute the term $- A u^(- 2) \( g - h_t \)$ to the logarithmic Hessian, absorbing the errors measured in the initial metric.

Fix $T < oo$ and work, if necessary, on a slightly larger finite time interval. Put

$ eta_t = g - h_t \, #h(2em) a_t = "tr"_g eta_t . $

The forms $eta_t$ are nonnegative, closed, and bounded by $g$; their traces satisfy $0 lt.eq a_t lt.eq n$. The potential identity gives

$ a_t = t R_g - Delta_g U . $

Integrate against a cutoff from Section 2 equal to one on $B \( o \, L \)$, and use $- U = integral_0^t rho \( dot.op \, s \) thin d s$, (2.3), and (3.2). Moving the Laplacian onto the cutoff gives

#[#set math.equation(numbering: n => "(3.16)")
 $ frac(1, "Vol" B \( o \, L \)) integral_(B \( o \, L \)) a_t thin d V_g lt.eq C_T t \/ L #h(2em) \( L gt.eq 1 \, med 0 lt.eq t lt.eq T \) . $ <flow:eta-average>]

For large dyadic $L$, define

$ H_(L \, t) = - integral_0^(L^2) H_b a_t thin d b . $

There are $delta \, beta > 0$ such that, on $B \( o \, C_0 L \)$,

#[#set math.equation(numbering: n => "(3.17)")
 $ \| H_(L \, t) \| + L \| partial H_(L \, t) \|_g & lt.eq C_T L^(2 - delta) t^beta \,\
partial accent(partial H, ‾)_(L \, t) & = eta_t + O \( t \/ L \) g \,\
partial_t H_(L \, t) & gt.eq H_(L \, t) \/ t - C_T L #h(2em) \( t > 0 \) . $ <flow:heat-correction-size>]

We give the heat estimates and the time identity separately.

Gaussian upper bounds and relative volume comparison, combined with (3.16), give, for some fixed $p > 2$,

#[#set math.equation(numbering: n => "(3.18)")
 $ H_b a_t \( x \) lt.eq C_T min {1 \, t / L (L / sqrt(b))^p} \, #h(2em) x in B \( o \, C_0 L \) \, quad 0 < b lt.eq L^2 . $ <flow:heat-integrand>]

For clarity, when $sqrt(b) lt.double L$ the ball $B \( x \, sqrt(b) \)$ may be small relative to $B \( o \, L \)$. Relative volume comparison loses at most a fixed power of $L \/ sqrt(b)$; outside $B \( o \, C L \)$, Gaussian annuli absorb both that power and the polynomial volume growth. The estimate $a_t lt.eq n$ supplies the first term in the minimum. For the gradient, use the heat-kernel estimate

$ \| nabla_x H_b \( x \, y \) \| lt.eq C / sqrt(b) thin frac(exp \( - c thin d_g \( x \, y \)^2 \/ b \), sqrt("Vol" B \( x \, sqrt(b) \) "Vol" B \( y \, sqrt(b) \))) . $

It follows from [52] Theorem 1.3, equation (1.6) and the Gaussian upper bound in [36] Corollary 3.1, absorbing the factor $1 + d_g \( x \, y \)^2 \/ b$ into the Gaussian. Integrating its absolute value against $a_t gt.eq 0$ and using the same relative-volume and annular estimates as above gives $C_T b^(- 1 \/ 2) \( t \/ L \) \( L \/ sqrt(b) \)^p$; increase the fixed $p > 2$ if needed. The separate bound $a_t lt.eq n$ gives $C b^(- 1 \/ 2)$. Thus the gradient obeys the minimum in (3.18), multiplied by $C \/ sqrt(b)$. Splitting both integrals at $b_(*) = L^2 \( t \/ L \)^(2 \/ p)$ shows that their bounds are respectively

$ C_T L^(2 - 2 \/ p) t^(2 \/ p) \, #h(2em) C_T L^(1 - 1 \/ p) t^(1 \/ p) . $

After increasing the finite-time constant, we can take $delta = beta = 1 \/ p$ in (3.17). Lemma 3 gives

$ partial accent(partial H, ‾)_(L \, t) = eta_t - cal(H)_(L^2) eta_t . $

The last form is nonnegative, and its trace is bounded by $C_T t \/ L$ by (3.18). This proves (3.17).

The trace identity also gives

#[#set math.equation(numbering: n => "(3.19)")
 $ H_(L \, t) = - t integral_0^(L^2) H_b R_g thin d b + H_(L^2) U - U . $ <flow:H-potential-identity>]

To justify it, insert initial-metric cutoffs in $integral_0^(L^2) H_b Delta_g U thin d b = H_(L^2) U - U$. Both $U$ and $Delta_g U = t R_g - a_t$ have polynomially bounded absolute ball integrals, by (3.2), (2.3), and $0 lt.eq a_t lt.eq n$. Gaussian bounds for the scalar heat kernel and its gradient, together with the absolute Laplacian bounds for the cutoffs, make the shell errors tend to zero. This proves the identity distributionally and then smoothly locally. Differentiating it in $t$ is justified by the same ball-integral bounds on $P = - rho$; alternatively integrate the identity over a time interval and then differentiate locally. Subtracting $H_(L \, t) \/ t$ gives

$ partial_t H_(L \, t) - H_(L \, t) \/ t = H_(L^2) \( P - U \/ t \) - \( P - U \/ t \) . $

Since $P_t lt.eq 0$, $P - U \/ t lt.eq 0$ and $0 lt.eq U \/ t - P lt.eq rho$. Its heat average is at most $C_T L$, by (3.2) and Gaussian annular summation. The unaveraged term has the favorable sign. This proves (3.17).

Choose a nonnegative smooth dyadic partition of unity $zeta_L \( u \)$, with scales $L asymp u$, and put $H = sum_L zeta_L \( u \) H_(L \, t)$, using finitely many harmless initial scales on a fixed compact. The partition derivatives have sizes $O \( u^(- 1) \)$ and $O \( u^(- 2) \)$ in gradient and complex Hessian. Equations (3.17)–(3.17) give

#[#set math.equation(numbering: n => "(3.20)")
 $ \| H \| lt.eq C_T u^(2 - delta) t^beta \, #h(2em) \| partial H \|_g lt.eq C_T u^(1 - delta) t^beta \,\
partial accent(partial H, ‾) = eta_t + O \( u^(- delta) t^beta + t \/ u \) g \, #h(2em) H_t gt.eq H \/ t - C_T u . $ <flow:glued-correction>]

These functions are smooth in space and continuously differentiable in time, one-sided at $t = 0$, which is all that the integration below uses. In fact (3.19) gives their first time derivatives in terms of $H_(L^2) P$ and local smooth functions. The uniform absolute ball-integral bounds for $P$ give continuity of that heat average, including at $t = 0$, by local convergence and uniform Gaussian tail estimates. Spatial regularity follows from the heat equation and (3.17).

#thm([Lemma 3.2.])[
  (Integrable comparison cutoff).  #emph[For every sufficiently large fixed integer $k$, there is a positive function $chi \( x \, t \)$ on $M times \[ 0 \, T \]$, smooth in space and continuously differentiable in time one-sided at the initial surface, such that 
#[#set math.equation(numbering: n => "(3.21)")
 $ C_T^(- 1) u^(- k) lt.eq chi lt.eq C_T u^(- k) \, #h(2em) \| partial chi \|_g lt.eq C_T chi \/ u \,\
partial macron(partial) chi lt.eq C_T chi h_t \, #h(2em) partial_t chi lt.eq C_T \( 1 + t^(beta - 1) \) chi quad \( t > 0 \) . $ <flow:cutoff-bounds>]

]
] <flow:cutoff-lemma>

#proof[
  Take
  $ chi = u^(- k) exp \( - A H \/ u^2 \) . $
  For fixed $A$, (3.20) gives the two-sided size estimate and the gradient estimate. Expanding $chi^(- 1) partial macron(partial) chi = partial macron(partial) log chi + partial log chi ⊗ macron(partial) log chi$ gives at infinity
  $ chi^(- 1) partial macron(partial) chi lt.eq u^(- 2) { - A \( g - h_t \) + C_k g + o \( 1 \) g } \, $
  uniformly on the fixed time interval. The terms containing $H \/ u^2$ or its gradient are $o \( u^(- 2) \) g$ after $A$ is fixed. Choose $A > C_k + 1$ and then take $u$ sufficiently large. The negative multiple of $g$ absorbs the remaining error and leaves $chi^(- 1) partial macron(partial) chi lt.eq A u^(- 2) h_t$. On the remaining compact, smoothness and positivity of $h_t$ give the asserted bound. Finally, $chi_t \/ chi = - A H_t \/ u^2$ and (3.20) give
  $ chi_t \/ chi lt.eq A \| H \| \/ \( t u^2 \) + C_T \/ u lt.eq C_T \( 1 + t^(beta - 1) \) . $
  The exponent $beta > 0$ makes this time coefficient integrable at zero. ◻
]

=== 3.5 Minimality and nonlinear scalar comparison <minimality-and-nonlinear-scalar-comparison>

#thm([Proposition 3.3.])[
  (Scalar comparisons).  #emph[Fix a finite $T > 0$. The following conclusions hold for the flow of Theorem 4.]
  + #emph[The function $rho$ is the minimal nonnegative solution with zero initial values of 
#[#set math.equation(numbering: n => "(3.22)")
 $ \( partial_t - Delta_(h_t) \) rho = "tr"_(h_t) "Ric" \( g \) . $ <flow:rho-source>]

 There are nonnegative smooth supercaloric functions $rho_j$ on $M times \[ 0 \, T \]$ such that 
#[#set math.equation(numbering: n => "(3.23)")
 $ 0 lt.eq rho_j lt.eq rho \, #h(2em) rho_j gt.eq rho - C_j \, #h(2em) rho_j arrow.r 0 upright(" locally uniformly on ") M times \[ 0 \, T \] . $ <flow:rho-tails>]

 Each fixed $rho_j$ has all spatial and one-sided time derivatives smooth at $t = 0$ and bounded on compact spacetime sets.]
  + #emph[Suppose $v$ is upper semicontinuous, bounded on compact spacetime sets, $0 lt.eq v lt.eq rho$, and satisfies, in the upper viscosity sense on $0 < t < T$, 
#[#set math.equation(numbering: n => "(3.24)")
 $ partial_t v lt.eq e^(- v) Delta_(h_t) v + \( 1 - e^(- v) \) R_(h_t) . $ <flow:nonlinear-comparison>]

 Then $v = 0$ on $M times \[ 0 \, T \)$.]
  #emph[Neither assertion requires completeness of $h_t$.]
] <prop:scalar-comparison>

Before proving the proposition, we isolate the smooth majorant used in part (ii). Its construction uses compact-domain parabolic theory and will be given immediately after the comparison proof.

#thm([Lemma 3.4.])[
  (Smooth majorant).  #emph[Fix $T > 0$ and let $v$ be upper semicontinuous, bounded on compact spacetime sets, and satisfy $0 lt.eq v lt.eq rho$ on $M times \[ 0 \, T \]$. Suppose that $v$ satisfies (3.24) in the upper viscosity sense for $0 < t < T$. There is a function $w$, smooth on $M times \( 0 \, T \)$ and continuous on $M times \[ 0 \, T \)$, such that 
$ v lt.eq w lt.eq rho \, #h(2em) w_t = e^(- w) Delta_(h_t) w + \( 1 - e^(- w) \) R_(h_t) \, #h(2em) w \( dot.op \, 0 \) = 0 . $

]
] <lem:scalar-majorant>

#proof[
  The Ricci identity $"Ric" \( h_t \) = "Ric" \( g \) + partial macron(partial) rho$, traced with $h_t$, proves (3.22), since $rho_t = R_(h_t)$. Its source is nonnegative. Solve the source equation with zero initial and lateral boundary data on a smooth relatively compact exhaustion, first as a weak energy solution [32] Chapter III, Theorem 4.1, and then use local parabolic regularity. A source need not vanish at the initial lateral corner, so full corner compatibility is not asserted. This bounded-domain construction and its energy estimates pass between a finite set of coordinate charts; it requires no completeness of the evolving metric. Domain comparison makes these solutions increase, and comparison with $rho$ bounds them above. Their limit $rho_min$ is the minimal nonnegative potential. Local estimates give a smooth solution for $t > 0$ and continuous zero initial values, since it is bounded by the smooth function $rho = O_K \( t \)$ on each compact. The difference $z = rho - rho_min$ satisfies
  $ 0 lt.eq z lt.eq rho \, #h(2em) z_t = Delta_(h_t) z \, #h(2em) z \( dot.op \, 0 \) = 0 . $
  Use $chi$ from Lemma 5, with $k > 2 n + 3$, and a cutoff $p_N = p \( u \/ N \)$ which is one on $u lt.eq N$ and zero on $u gt.eq 2 N$. Set
  $ I_N \( t \) = integral_M z chi p_N thin d V_(h_t) . $
  Since $partial_t d V_(h_t) = - R_(h_t) d V_(h_t)$ and $R_(h_t) gt.eq 0$, integration by parts on the compact support of $p_N$ gives
  #[#set math.equation(numbering: n => "(3.25)")
   $ I'_N \( t \) lt.eq C_T \( 1 + t^(beta - 1) \) I_N \( t \) + E_N \( t \) \, #h(2em) \| E_N \( t \) \| lt.eq C_T N^(2 n - 1 - k) . $ <flow:linear-mass>]
  Here the error contains the derivatives falling on $p_N$. Its complex Hessian, including the gradient cross terms with $chi$, has $g$-norm at most $C_T N^(- k - 2)$ on $N lt.eq u lt.eq 2 N$. The pointwise cofactor identity and $0 < h_t lt.eq g$ imply, for any real $\( 1 \, 1 \)$-form $B$,
  #[#set math.equation(numbering: n => "(3.26)")
   $ \| "tr"_(h_t) B \| thin d V_(h_t) lt.eq C_n \| B \|_g thin d V_g . $ <flow:cofactor>]
  Indeed diagonalize $h_t$ relative to $g$; the coefficient multiplying each diagonal entry of $B$ is the product of the other $n - 1$ eigenvalues, each at most one. This also covers $n = 1$. Equation (3.2) bounds the integral of $z$ on the shell by $C_T N^(2 n + 1)$, proving the error bound.
  The mass $I = integral z chi thin d V_h$ is finite. Its tails tend to zero uniformly in $t$ by $z lt.eq rho$, $d V_h lt.eq d V_g$, and the same dyadic shell estimate. Its initial limit is zero by local convergence and this tail control. Integrating (3.25) from a positive initial time, sending $N arrow.r oo$, and then sending that time to zero gives $I \( t \) lt.eq integral_0^t C_T \( 1 + s^(beta - 1) \) I \( s \) thin d s$. Gronwall’s inequality gives $I = 0$, and positivity of $chi$ gives $z = 0$. Thus $rho = rho_min$.
  For the tails, choose smooth spatial cutoffs $0 lt.eq theta_j lt.eq 1$ increasing to one, each compactly supported and eventually equal to one near each fixed compact. Let $rho_j$ be the minimal zero-data potential of
  $ F_j = \( 1 - theta_j \) "tr"_(h_t) "Ric" \( g \) . $
  It is nonnegative and supercaloric. Linearity on each exhaustion domain and monotone limits give the decomposition of $rho$ into this exterior-source potential and the minimal potential of $theta_j "tr"_h "Ric" \( g \)$. The latter is at most $T sup_(M times \[ 0 \, T \]) theta_j "tr"_h "Ric" \( g \) < oo$ by the scalar maximum principle on the domains. This proves $rho_j gt.eq rho - C_j$. Monotone convergence of the nonnegative Dirichlet Green integrals, first in the domains and then for the source cutoffs, shows that $rho_j arrow.b 0$ pointwise.
  We record the initial regularity needed later. On every fixed compact neighborhood the coefficients of $Delta_(h_t)$ and the source $F_j$ are smooth and uniformly parabolic through $t = 0$. The domination $0 lt.eq rho_j lt.eq rho = O_K \( t \)$ supplies continuous zero initial values. For clarity, this initial regularity is local in space. Extend the smooth coefficients and source from a coordinate neighborhood to a smooth uniformly parabolic Cauchy problem, and solve it with zero initial data [32] Chapter IV, Theorem 5.1. Subtract this local particular solution from $rho_j$ on a smaller neighborhood. The difference is $O \( t \)$ there and solves the homogeneous equation for $t > 0$. A spatially localized energy estimate from time $delta > 0$, followed by $delta arrow.b 0$, puts the difference in the local weak energy class through zero; the squared $L^2$ norm of its initial value on the fixed compact is $O \( delta^2 \)$ and tends to zero. Extend that difference by zero to negative times, and extend the coefficients smoothly. Its zero initial trace removes a distributional boundary term, so it solves the homogeneous equation across the initial surface. Interior regularity [32] Chapter III, Theorem 12.1 makes it smooth there. Adding back the particular solution proves the claimed smooth one-sided jets. This argument extends the homogeneous difference, not the forced potential, by zero. In particular,
  $ partial_t rho_j \( x \, 0 \) = F_j \( x \, 0 \) \, $
  and higher initial derivatives are determined recursively from $\( rho_j \)_t = Delta_(h_t) rho_j + F_j$; they are smooth functions of $x$. No regularity at a distant Dirichlet corner is used. Dini’s theorem on compact spacetime sets now gives the local uniform convergence in (3.23). If an auxiliary smooth extension across $t = 0$ is desired on a compact, it can be chosen to match these jets. Extension by zero to negative time is not asserted.
  For (ii), let $w$ be the smooth majorant from Lemma 7. Thus $v lt.eq w lt.eq rho$, and $w$ solves equality in (3.24). Multiplying its equation by $e^w$ gives the useful volume-form identity
  #[#set math.equation(numbering: n => "(3.27)")
   $ partial_t #scale(x: 120%, y: 120%)[\[] \( e^w - 1 \) d V_(h_t) #scale(x: 120%, y: 120%)[\]] = \( Delta_(h_t) w \) d V_(h_t) . $ <flow:nonlinear-volume>]
  For example, the cancellation uses $partial_t d V_h = - R_h d V_h$ and $e^w \( 1 - e^(- w) \) R_h = \( e^w - 1 \) R_h$.
  Integrate (3.27) against $chi p_N$ and move the Laplacian onto that compactly supported function. Since $w lt.eq e^w - 1$ and $Delta_h chi lt.eq C_T chi$, the interior term is bounded by a constant times
  $ M_N \( t \) = integral_M \( e^w - 1 \) chi p_N thin d V_h . $
  The time derivative of $chi$ is bounded by $C_T \( 1 + t^(beta - 1) \) chi$. The exterior error is again $O \( N^(2 n - 1 - k) \)$, using $w lt.eq rho$ and (3.26). Moreover
  $ 0 lt.eq \( e^w - 1 \) d V_h lt.eq e^rho d V_h = d V_g . $
  Thus the full weighted mass is finite, its tails are uniformly small, and its initial limit is zero by dominated convergence on compacts and $chi asymp u^(- k)$. The same limiting Gronwall argument as above forces it to vanish. Hence $w = 0$, and $0 lt.eq v lt.eq w$ proves (ii). ◻
]

=== 3.6 Constructing the smooth majorant <constructing-the-smooth-majorant>

#proof[
  We construct the majorant on relatively compact domains and then pass to a limit. On a smooth relatively compact domain $Omega$ and for a fixed time less than $T$, consider equality in (3.24). Zero and $rho$ are respectively a subsolution and a supersolution. To check the latter, use
  $ R_(h_t) - Delta_(h_t) rho = "tr"_(h_t) "Ric" \( g \) gt.eq 0 . $
  The function $rho + 2 alpha$ is also a supersolution for every constant $alpha > 0$.
  Take constant initial data $alpha$. On $partial Omega$ choose a smooth $zeta : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$, equal to one near zero and supported in $\[ 0 \, 1 \]$, and put
  $ phi \( x \, t \) = rho \( x \, t \) + alpha - e^(- alpha) R_g \( x \) t zeta \( t \/ delta \) . $
  For $delta sup_(partial Omega) R_g lt.eq alpha \/ 2$ this lies between $rho + alpha \/ 2$ and $rho + alpha$. It has $phi \( dot.op \, 0 \) = alpha$ and $phi_t \( dot.op \, 0 \) = \( 1 - e^(- alpha) \) R_g$, which are exactly the value and first equation compatibility conditions.
  We give the local existence and continuation argument on this fixed compact domain. We use the compatible linear Dirichlet Schauder theorem [32] Chapter IV, Theorem 5.2 and its uniform small-time inverse estimate [32] Chapter IV, Theorem 5.4. These Euclidean-domain statements have the same compact-manifold form by the following finite-chart construction for a smooth uniformly parabolic linear operator $L$. Choose a partition of unity $chi_i$ and cutoffs $psi_i = 1$ near $"supp" chi_i$ in finitely many interior and boundary charts. Local domains are smoothly capped outside these supports, and $psi_i$ vanishes near every artificial boundary. If $E_i$ is the local zero-data inverse, then $S f = sum_i psi_i E_i \( chi_i f \)$ satisfies $L S f = f + cal(R) f$ for the global linear operator $L$. The remainder consists of first- and zeroth-order commutators $\[ L \, psi_i \] E_i \( chi_i f \)$. On the source space $f \( dot.op \, 0 \) = 0$, the local solutions have zero initial trace. Parabolic interpolation and the uniform inverse bounds give $parallel cal(R) parallel_(C^(beta \, beta \/ 2) arrow.r C^(beta \, beta \/ 2)) lt.eq C epsilon.alt^theta$ on a time interval of length $epsilon.alt$, with $theta > 0$; for $0 < beta < 1$ one can take $theta = \( 1 - beta \) \/ 2$. The remainder preserves this source space. Thus $S \( I + cal(R) \)^(- 1)$ is the required global inverse for small $epsilon.alt$. All constants here may depend on $Omega$.
  Extend the boundary data to a smooth function $p$ with
  $ p \( x \, 0 \) = alpha \, #h(2em) p_t \( x \, 0 \) = c \( x \) := \( 1 - e^(- alpha) \) R_g \( x \) quad upright("throughout ") Omega . $
  For example, in a smooth boundary collar with projection $pi$ and cutoff $theta.alt = 1$ near the boundary, take
  $ p \( x \, t \) = alpha + t c \( x \) + theta.alt \( x \) { phi \( pi \( x \) \, t \) - alpha - t c \( pi \( x \) \) } \, $
  and use $alpha + t c \( x \)$ outside the collar. The bracket and its first time derivative vanish at zero. Set $L = partial_t - e^(- p) Delta_h$ and seek $v_(Omega \, alpha) = p + z$, with zero initial and lateral data for $z$. Its equation is
  $ L z = cal(N) \( z \) := \( e^(- p - z) - e^(- p) \) Delta_h \( p + z \) + \( 1 - e^(- p - z) \) R_h - L p . $
  For every such $z in C^(2 + beta \, 1 + beta \/ 2)$, $cal(N) \( z \) \( x \, 0 \) = 0$ throughout $Omega$. The linear inverse is therefore applied to compatible sources. If $z \( dot.op \, 0 \) = 0$, then $parallel z parallel_oo lt.eq epsilon.alt parallel z_t parallel_oo$; spatial interpolation and the time Hölder quotient give
  $ parallel z parallel_(C^(beta \, beta \/ 2)) lt.eq C epsilon.alt^(1 - beta \/ 2) parallel z parallel_(C^(2 + beta \, 1 + beta \/ 2)) . $
  On a fixed ball in the latter space, the product and composition estimates consequently give
  $ parallel cal(N) \( z \) - cal(N) \( w \) parallel_(C^(beta \, beta \/ 2)) lt.eq C epsilon.alt^(1 - beta \/ 2) parallel z - w parallel_(C^(2 + beta \, 1 + beta \/ 2)) . $
  The coefficient of every highest-derivative difference has this small factor. Also $cal(N) \( 0 \)$ is smooth and vanishes at $t = 0$, so its $C^(beta \, beta \/ 2)$ norm tends to zero with $epsilon.alt$. The linear inverse and the contraction theorem give a local Dirichlet solution. Classical comparison with the barriers gives $0 lt.eq v_(Omega \, alpha) lt.eq rho + 2 alpha$.
  For continuation, write $Delta_h = a^(i j) partial_i partial_j + b^j partial_j$ in fixed real coordinates and set $q = e^(v_(Omega \, alpha))$. Directly,
  $ q_t - partial_i (a^(i j) / q thin partial_j q) = frac(b^j - partial_i a^(i j), q) thin partial_j q + \( q - 1 \) R_h . $
  The barriers bound $q$ above and away from zero. The leading matrix is uniformly elliptic, and the displayed drift and forcing are bounded independently of $nabla q$ on the fixed cylinder. Boundary as well as interior Hölder estimates therefore apply [32] Chapter III, Theorem 10.1; the exterior-measure condition there holds for the smooth compact boundary. Hence $v_(Omega \, alpha)$ is Hölder up to the parabolic boundary. Its original equation now has Hölder coefficients and source, so [32] Chapter IV, Theorem 5.2 gives a controlled $C^(2 + gamma \, 1 + gamma \/ 2)$ norm on the closed slab for some $0 < gamma < 1$. In particular its second spatial derivatives are bounded there. Only this finite corner regularity is asserted from the first compatibility condition.
  On slabs separated from the initial surface, differentiated boundary Schauder estimates give all higher bounds, since the coefficients and lateral data are smooth. At a hypothetical positive maximal time the solution thus has smooth limiting initial data satisfying the boundary equation jets. The same local construction, with those data and their first equation jet in place of $alpha$ and $c$, restarts it. This proves existence up to the prescribed finite horizon. No constants near the remote boundaries need be uniform as $Omega$ exhausts $M$.
  Viscosity comparison with this smooth solution gives $v lt.eq v_(Omega \, alpha)$. To see the only nonlinear point in that comparison, at a positive interior maximum of $e^(- C t) \( v - v_(Omega \, alpha) \)$ the test has the same spatial Hessian as $v_(Omega \, alpha)$. The difference of the right sides is bounded by a constant times $v - v_(Omega \, alpha)$, because the derivative in the value variable is $e^(- v) \( R_h - Delta_h v_(Omega \, alpha) \)$, bounded on the compact slab. Choose $C$ larger than this bound and use a strict increasing time penalty. The initial and lateral gaps are positive, so no boundary maximum interferes. This proves the comparison directly, consistently with the usual viscosity framework [15].
  Exhaust $M$, let $alpha arrow.b 0$, and use local uniformly parabolic estimates to extract a smooth interior limit $w$ with
  $ v lt.eq w lt.eq rho \, #h(2em) w_t = e^(- w) Delta_h w + \( 1 - e^(- w) \) R_h \, #h(2em) w \( dot.op \, 0 \) = 0 . $
  The limit at the initial surface follows from the barriers on each compact; no uniform estimates near the remote lateral boundaries are required. ◻
]

== 4 The cotangent envelope: compactness and frames <sec:discs>

We study the flow through boundary averages of its dual squared norm on holomorphic cotangent discs. Let $Delta = { z in bb(C) : \| z \| < 1 }$, let $d A$ denote Euclidean area on $Delta$, and write $pi : Y = T^(* \( 1 \, 0 \)) M arrow.r M$. Put

$ N \( x \, xi \, t \) = \| xi \|_(h_t^(- 1))^2 . $

Thus $N \( dot.op \, t \) gt.eq N \( dot.op \, 0 \)$ by Theorem 4. The function $N \( dot.op \, 0 \)$ is plurisubharmonic: the squared norm on the total space of a Griffiths nonpositive bundle is plurisubharmonic, and the dual of $T^(1 \, 0) M$ has this curvature sign.

Fix $T < oo$ and denote physical time at a disc center by $s$. If $y in Y$ and $0 < s < T$, let $v^(upright("raw")) \( y \, s \)$ be the infimum of

#[#set math.equation(numbering: n => "(4.1)")
 $ ⟨N #scale(x: 120%, y: 120%)[\(] f \( zeta \) \, s e^(w \( zeta \) + overline(w \( zeta \))) #scale(x: 120%, y: 120%)[\)]⟩ \, #h(2em) \( f \( 0 \) \, w \( 0 \) \) = \( y \, 0 \) \, $ <var:envelope>]

over holomorphic discs $f : overline(Delta) arrow.r Y$ and $w : overline(Delta) arrow.r bb(C)$, smooth on the closed unit disc, with $s e^(w + macron(w)) < T$ there. Brackets denote normalized circle average. Let $v$ be the lower semicontinuous regularization in $\( y \, s \)$. Constant discs, the plurisubharmonicity of $N \( dot.op \, 0 \)$, and $N \( dot.op \, t \) gt.eq N \( dot.op \, 0 \)$ give

#[#set math.equation(numbering: n => "(4.2)")
 $ N \( y \, 0 \) lt.eq v \( y \, s \) lt.eq v^(upright("raw")) \( y \, s \) lt.eq N \( y \, s \) . $ <var:sandwich>]

Multiplying the fiber component of every competing disc by a nonzero complex number shows that $v$ is homogeneous of degree two in the fiber. The assertion at the zero section follows from (4.2).

Minimizing boundary averages over discs with a prescribed center is the Poisson-envelope construction in the theory of Poletsky and Rosay [45,47]; see also [33] Sections 1–2 for the manifold framework. Here we prove the differential inequality needed for the evolving norm directly, with the compactness and quantitative deformation estimates specified below.

Our goal is to prove $v = N$. This equality will give the submean inequality for $N \( x \, xi \, e^(w + macron(w)) \)$, hence its joint plurisubharmonicity. The competitors in (4.1) have no common boundary compact or area bound. In Section 5 we will localize almost minimizing discs by boundary walls and a positive area penalty. The compact containing their full images may then depend on the penalty. With centers in a fixed compact coordinate region, the frame estimates used in the differential inequality must depend on boundary and center data, independently of the area bound and the compact containing the interiors. This Section establishes these two kinds of control, together with the cotangent evolution identity used in that estimate. All compactness arguments use the complete initial metric $g$.

=== 4.1 The symplectic Hessian operator <the-symplectic-hessian-operator>

The canonical holomorphic bivector on $Y$ is

$ cal(J) = sum_(i = 1)^n frac(partial, partial x_i) and frac(partial, partial xi_i) . $

We use column matrices for Hermitian forms, so a form with matrix $W$ has quadratic value $v^(*) W v$. In a frame $e_1 \, dots.h \, e_(2 n)$, write $cal(J) = sum_(A < B) J^(A B) e_A and e_B$ and define

#[#set math.equation(numbering: n => "(4.3)")
 $ p \( W \, cal(J) \) = sum_(A < B \, thin C < D) overline(J^(A B)) J^(C D) \( W_(A C) W_(B D) - W_(A D) W_(B C) \) . $ <disc:p-definition>]

This is the induced exterior-square squared norm when $W$ is positive, and is a real polynomial for every Hermitian $W$. The definition is independent of frame. In canonical cotangent coordinates we abbreviate it to $p \( W \)$; if $W = mat(delim: "(", A, B; B^(*), C)$, then

#[#set math.equation(numbering: n => "(4.4)")
 $ p \( W \) = "tr" \( A C^(sans(T)) \) - sum_(i \, j) B_(i j) overline(B_(j i)) . $ <disc:p-block>]

Here and below the transpose records the tangent–cotangent pairing. In particular, if tangent coefficients have metric matrix $h$, the column matrix of the dual norm is $b = h^(- sans(T))$.

#thm([Lemma 4.1.])[
  (Symplectic evolution).  #emph[For the flow of Theorem 4, 
#[#set math.equation(numbering: n => "(4.5)")
 $ partial_t N = p \( partial macron(partial)_Y N \) . $ <disc:symplectic-evolution>]

 For every real smooth base function $d = d \( x \, t \)$, with $t$ held fixed in the spatial Hessian, 
#[#set math.equation(numbering: n => "(4.6)")
 $ p \( partial macron(partial)_Y \( N + d \) \) = partial_t N + Delta_(h_t) d . $ <disc:base-addition>]

 These identities do not assume that $h_t$ is complete or has nonnegative curvature at positive time.]
] <lem:symplectic-evolution>

#proof[
  Fix $\( x \, t \)$ and use Kähler-normal coordinates for $h_t$ there. At that point $h_t = b_t = I$, all first spatial derivatives of $b_t$ vanish, and the Hessian of $N$ has blocks
  $ partial macron(partial)_Y N = mat(delim: "(", cal(R)_xi, 0; 0, I) . $
  The horizontal form $cal(R)_xi$ is the bisectional curvature form of $h_t$ with one pair of indices contracted against the metric dual of $xi$. Indeed differentiating $b = h^(- sans(T))$ twice at a normal point gives the negative second derivatives of $h$, transposed, which are precisely those curvature components. The Kähler symmetries give
  $ "tr" cal(R)_xi = xi^(*) "Ric" \( h_t \)^(sans(T)) xi . $
  On the other hand $partial_t h = - "Ric" \( h \)$ implies $partial_t b = h^(- sans(T)) "Ric" \( h \)^(sans(T)) h^(- sans(T))$. Equation (4.4) now proves (4.5). Adding a base Hessian changes only the horizontal block. Its contribution to $p$ is $"tr" \( \( partial macron(partial)_x d \) b^(sans(T)) \) = "tr" \( h_t^(- 1) partial macron(partial)_x d \)$, proving (4.6). The calculation is tensorial, so the normal-coordinate verification proves both identities everywhere. ◻
]

=== 4.2 Compact boundary and bounded area <compact-boundary-and-bounded-area>

#thm([Proposition 4.2.])[
  (Compactness of discs).  #emph[For each compact $K subset M$ and each $A_0 < oo$, there is a compact $K' subset M$ such that every holomorphic disc $f : overline(Delta) arrow.r M$, smooth up to the circle, satisfying 
$ f \( partial Delta \) subset K \, #h(2em) integral_Delta f^(*) omega_g lt.eq A_0 $

 has $f \( overline(Delta) \) subset K'$. Every sequence of such discs has a subsequence converging holomorphically on compact subsets of $Delta$.]
  #emph[The same statements hold for discs in $Y$ with compact boundary in $Y$ and with $integral_Delta \( pi compose f \)^(*) omega_g lt.eq A_0$. The resulting compact may depend on $K$ and $A_0$.]
] <prop:disc-compactness>

The area bound first places part of each disc in a fixed compact. An inverse-Jacobian estimate for the global injective immersion then propagates this control away from isolated possible singularities of a limit; properness of the immersion is not assumed. The following extra-integrability lemma removes those punctures. A second lemma records the subharmonic compactness needed to propagate the initial control.

The puncture estimate assumes no extension of the bundle or its metric across the puncture.

#thm([Lemma 4.3.])[
  (Extra integrability).  #emph[Let $\( E \, k \)$ be a smooth Hermitian holomorphic vector bundle on $Delta^(*) = { 0 < \| z \| < 1 }$, with Griffiths nonnegative curvature. Suppose that $A : E arrow.r Delta^(*) times bb(C)^q$ is holomorphic, pointwise injective, and has bounded operator norm. If $a$ is a holomorphic section with $integral_(Delta^(*)) \| a \|_k^2 thin d A < oo$, then there are $r_0 > 0$ and $sigma > 0$ such that 
#[#set math.equation(numbering: n => "(4.7)")
 $ integral_(0 < \| z \| < r_0) \| a \|_k^2 \| z \|^(- sigma) thin d A < oo . $ <disc:extra-integrability>]

 The exponent may depend on the section and the bundle data.]
] <lem:extra-integrability>

#proof[
  Choose a fixed smooth function $chi : bb(R) arrow.r \[ 0 \, 1 \]$ which is zero on $\( - oo \, - 2 \]$ and one on $\[ - 1 \, oo \)$, and set
  $ chi_m \( z \) = chi \( m^(- 1) log \| z \| \) \, #h(2em) phi.alt_m \( z \) = 2 / m log \| z \| + \| z \|^(1 \/ m) . $
  Writing $r = \| z \|$, one has
  $ \| macron(partial) chi_m \| lt.eq frac(C, m r) \, #h(2em) \( phi.alt_m \)_(z macron(z)) = frac(1, 4 m^2) r^(1 \/ m - 2) . $
  On a complex curve Griffiths and Nakano nonnegativity coincide. Apply the bundle-valued Hörmander estimate to $E$-valued $\( 1 \, 0 \)$-forms, with the metric $k e^(- phi.alt_m)$ and source $a thin macron(partial) chi_m and d z$; see [28] and [19] Theorem 5.1 and Remark 4.5. One may use any complete auxiliary Kähler metric on $Delta^(*)$. In dimension one its conformal factor cancels both from the norm of the unknown top form times volume and from the curvature-inverse source pairing times volume. Dropping the nonnegative curvature of $k$ therefore gives a solution $v_m$ of $accent(partial v, ‾)_m = a thin macron(partial) chi_m$ satisfying
  #[#set math.equation(numbering: n => "(4.8)")
   $ integral_(Delta^(*)) \| v_m \|_k^2 e^(- phi.alt_m) thin d A & lt.eq C integral_(e^(- 2 m) < r < e^(- m)) \| a \|_k^2 r^(- 3 \/ m) e^(- r^(1 \/ m)) thin d A \,\
integral_(Delta^(*)) \| v_m \|_k^2 r^(- 2 \/ m) thin d A & lt.eq C integral_(e^(- 2 m) < r < e^(- m)) \| a \|_k^2 thin d A arrow.r 0 . $ <disc:weighted-solve>]
  For the second estimate we used $r^(- 3 \/ m) lt.eq e^6$ on the source annulus and $e^(- 1) lt.eq e^(- r^(1 \/ m)) lt.eq 1$. The constants are independent of $m$. The estimate concerns smooth metrics on the punctured domain; it does not assert a curvature extension at zero.
  The sections $a_m = chi_m a - v_m$ are holomorphic and converge to $a$ in unweighted $L^2$. Near zero they equal $- v_m$, so each has a positive extra integrability exponent, namely $2 \/ m$. Since $A$ is bounded, $A a_m$ and $A a$ are ordinary $L^2$ holomorphic vector functions on the punctured disc. Their negative Laurent coefficients vanish by $L^2$ integrability; hence they extend across zero. Their $L^2$ convergence and the interior Cauchy estimates give convergence of every finite jet at zero.
  Here is the closure argument that recovers a positive exponent for $a$ itself. Let $R = cal(O)_(bb(C) \, 0)$, with maximal ideal $frak(m) = \( z \)$, and let $S subset R^q$ consist of all germs $A b$ where $b$ is holomorphic on some punctured neighborhood and
  $ integral \| b \|_k^2 r^(- epsilon) thin d A < oo quad upright("for some ") epsilon > 0 . $
  These images extend across zero by the same $L^2$ argument. The set $S$ is an $R$-submodule: for a sum take the smaller of the two positive exponents, and multiplication by a holomorphic germ is bounded after shrinking the neighborhood. The ring $R$ is Noetherian, so $S$ is a submodule of a finite free module and $Q = R^q \/ S$ is a finite module. For each $k$, the image of $S$ in $R^q \/ frak(m)^k R^q$ is a finite-dimensional vector subspace and is closed. Jet convergence of $A a_m in S$ consequently gives
  $ A a in S + frak(m)^k R^q #h(2em) upright("for every ") k . $
  Krull’s intersection Theorem for the finite local module $Q$ gives $⋂_k frak(m)^k Q = 0$ [53] Lemma 10.51.4. Thus $A a in S$. By definition it is the image of one section $b$ with some positive extra exponent. Pointwise injectivity of $A$ implies $a = b$ on a sufficiently small punctured neighborhood, proving (4.7). No common exponent for $a_m$ was used. ◻
]

Let $F = \( F_1 \, dots.h \, F_N \) : M arrow.r bb(C)^N$ be the global injective holomorphic immersion of Proposition 2. Set

$ psi = log sum_(\| I \| = n) \| d F_I \|_g^2 \, #h(2em) d F_I = d F_(i_1) and dots.h.c and d F_(i_n) . $

Immersivity makes $psi$ smooth. Along any holomorphic disc, $psi$ is subharmonic: each $d F_I$ is a holomorphic canonical form, whose logarithmic squared norm is plurisubharmonic under the curvature hypothesis, and the log-sum has the same property. Similarly $\| d F \|_g^2 = sum_i \| d F_i \|_g^2$ is plurisubharmonic.

#thm([Lemma 4.4.])[
  (Compactness with a lower anchor).  #emph[Let $Omega_j$ be increasing open subsets exhausting a connected complex manifold $X$, and let $u_j$ be plurisubharmonic on $Omega_j$. Assume that for each compact $K subset X$, the functions $u_j$ are uniformly bounded above on $K$ once $K subset Omega_j$. Every sequence has a subsequence for which either $u_j$ tends to $- oo$ locally uniformly from above, or $u_j$ converges in $L_(upright("loc"))^1$ to a plurisubharmonic function. A lower bound $u_j \( z_j \) gt.eq - A$ at points $z_j$ in a fixed compact set excludes the first alternative along that sequence. In particular, lower bounds on moving subsets of a fixed compact set of uniformly positive measure suffice. If the $L_(upright("loc"))^1$ limit is the constant $c$, then 
$ limsup_j sup_K u_j lt.eq c $

 for every compact $K subset X$.]
] <lem:psh-compactness-bridge>

#proof[
  We explain the lower-anchor step rather than building it into the compactness theorem. Pass to a subsequence with $z_j arrow.r z_(*)$ and work in a coordinate ball about $z_(*)$. On a slightly larger ball choose a common upper bound $C$ and set $w_j = C - u_j$. These functions are nonnegative and superharmonic. The supermean inequality at $z_j$ bounds their integrals on a ball of fixed radius about $z_j$ by its volume times $C + A$. A fixed smaller ball about $z_(*)$ is eventually contained in those balls, so the $L^1$ norms there are bounded.
  Such a bound propagates along finite chains of overlapping coordinate balls. In a fixed overlap of positive measure, the integral bound supplies a point at which $w_j$ is bounded by its average over the overlap. Applying the supermean inequality on a larger ball centered at that point, still contained in the coordinate neighborhood, bounds the integral on the next smaller ball. On each fixed compact overlap, the Euclidean volume measures in the two coordinate charts are uniformly comparable. Increasing the local upper bound $C$ when moving between charts only adds a fixed constant. Connectedness and a finite covering therefore give $L^1$ bounds on every fixed compact subset of $X$.
  Families of subharmonic functions bounded in $L_(upright("loc"))^1$ are relatively compact in that topology [20] Chapter I, Proposition 4.21. Apply this result in coordinate balls and take a diagonal subsequence. Positivity of the complex Hessians passes to the distributional limit, so its upper semicontinuous representative is plurisubharmonic. If no subsequence has a lower anchor in any fixed compact set, then the suprema on each member of a compact exhaustion tend to $- oo$; this is the other alternative. This also proves the assertion for exhausting domains, since each finite chain of balls is contained in every sufficiently late $Omega_j$.
  Finally suppose the limit is the constant $c$. In a coordinate ball whose concentric enlargement is relatively compact, apply the submean inequality on a fixed-radius ball centered at each point of the smaller ball. It bounds $u_j - c$ from above by a fixed constant times the $L^1$ norm of $u_j - c$ on the enlargement. This norm tends to zero. A finite covering proves the asserted upper bound on $K$. ◻
]

#proof[
  We first control centers of discs $f_l$ in $M$. The maximum principle gives uniform bounds
  #[#set math.equation(numbering: n => "(4.9)")
   $ \| F compose f_l \| lt.eq C_K \, #h(2em) \| d F \|_g compose f_l lt.eq C_K \, #h(2em) psi_l := psi compose f_l lt.eq C_K . $ <disc:boundary-upper>]
  The area bound controls the energy, with a fixed normalization constant. In particular, the functions
  $ E_l \( theta \) = integral_(1 \/ 2)^1 \| partial_r f_l \( r e^(i theta) \) \|_g^2 r thin d r $
  have uniformly bounded angular integrals. On a set of angles of measure bounded below, $E_l \( theta \) lt.eq C \( A_0 + 1 \)$. For each such angle and every $r in \[ 1 \/ 2 \, 3 \/ 4 \]$, Cauchy–Schwarz gives
  $ "dist"_g \( f_l \( r e^(i theta) \) \, K \) lt.eq E_l \( theta \)^(1 \/ 2) (integral_(1 \/ 2)^1 frac(d r, r))^(1 \/ 2) . $
  Completeness and Hopf–Rinow put these images in a fixed compact. Thus on a subset of the fixed annulus of area bounded below, $psi_l$ has a fixed lower bound. Lemma 11, together with (4.9), now gives a subsequence converging in $L_(upright("loc"))^1 \( Delta \)$ to a subharmonic function $psi_oo$; the lower bounds on the anchor subsets exclude collapse to $- oo$. We retain their positive-area property for the later step that avoids neighborhoods of the possible atoms. Let $mu_l = \( 2 pi \)^(- 1) Delta_(upright("eucl")) psi_l$ and $mu = \( 2 pi \)^(- 1) Delta_(upright("eucl")) psi_oo$. Then $mu_l arrow.r mu$ weakly on compact subsets.
  We spell out the required inverse-Jacobian estimate. Let $Z = { z : mu \( { z } \) gt.eq 1 }$, a locally finite subset of $Delta$. Near any point outside $Z$, choose a small disc $D$ whose boundary has zero $mu$-measure and for which $mu \( D \) < b < 4 \/ 3$. For large $l$, $mu_l \( D \) < b$. The Riesz decomposition on $D$ [20] Chapter I, Proposition 4.22 is
  $ psi_l = h_l + integral_D log \| z - zeta \| thin d mu_l \( zeta \) . $
  On each smaller concentric disc the harmonic terms $h_l$ are bounded in absolute value: their $L^1$ norms are bounded by $L^1$ convergence of $psi_l$, the bounded masses, and local integrability of the logarithmic kernel; harmonic interior estimates then apply. For a positive measure $nu$ of mass $b_l lt.eq b$, Jensen’s inequality gives, with the zero-mass case interpreted separately,
  $ exp (- p integral_D log \| z - zeta \| thin d nu \( zeta \)) lt.eq 1 / b_l integral_D \| z - zeta \|^(- p b_l) thin d nu \( zeta \) \, #h(2em) p = 3 / 2 . $
  Integrating in $z$ gives a uniform bound since $p b < 2$. Therefore $e^(- psi_l)$ is locally bounded in $L^(3 \/ 2) \( Delta \\ Z \)$.
  Let $s_1 lt.eq dots.h.c lt.eq s_n$ be the singular values of $d F$ measured from $g$ to the Euclidean metric. Cauchy–Binet and (4.9) imply
  $ e^(psi_l) = product_i s_i \( f_l \)^2 \, #h(2em) s_1 \( f_l \)^(- 2) lt.eq C_K e^(- psi_l) . $
  Consequently
  #[#set math.equation(numbering: n => "(4.10)")
   $ \| f'_l \|_g^2 lt.eq C_K e^(- psi_l) \| \( F compose f_l \)' \|^2 . $ <disc:inverse-jacobian>]
  The bounded holomorphic maps $F compose f_l$ have uniformly bounded derivatives on smaller discs. Hence $d f_l$ is locally bounded in $L^3$ off $Z$. For $p in M$ the function $v_(l \, p) \( z \) = "dist"_g \( f_l \( z \) \, p \)$ has weak gradient bounded by $\| d f_l \|_g$. Morrey’s local gradient-only estimate in real dimension two, with exponent $1 - 2 \/ 3 = 1 \/ 3$, therefore applies [21] Section 5.6.2, Theorem 4 and the Remark on p. 283. Its constant depends on the nested domain discs, not on $p$; no bound on the values of $v_(l \, p)$ is needed. Taking $p = f_l \( w \)$ gives the uniform local metric Hölder estimate.
  These local estimates propagate the compact anchors. Indeed, remove small neighborhoods of the finitely many points of $Z$ in the anchor annulus, with total area smaller than half the anchor lower bound. Choose anchor points in the remaining compact set and pass to a convergent subsequence of their domain positions. The local Hölder estimate puts their neighboring images in a fixed bounded $g$-neighborhood of the anchor compact. Any compact subset of the connected set $Delta \\ Z$ can be reached by finitely many overlapping small discs of this kind. Completeness makes each successive bounded neighborhood compact. Arzelà–Ascoli, local holomorphic coordinates, and diagonal extraction give a holomorphic limit $f : Delta \\ Z arrow.r M$. Its area is finite by lower semicontinuity, and $d F$ remains uniformly bounded along it.
  Fix a puncture of this limit and move its domain coordinate to zero. The bundle $E = f^(*) T^(1 \, 0) M$ has Griffiths nonnegative curvature, $A = d F : E arrow.r bb(C)^N$ is bounded and injective, and the holomorphic section $a = f'$ has finite $L^2$ norm. Lemma 10 applies. Fubini then gives an angle $theta$ with
  $ integral_0^(r_0) \| a \( r e^(i theta) \) \|_g^2 r^(1 - sigma) thin d r < oo . $
  Since $integral_0^(r_0) r^(sigma - 1) thin d r < oo$, the corresponding radial path has finite length and converges to a point $p in M$. The bounded map $F compose f$ extends holomorphically to zero and its value there is $F \( p \)$. Choose a relatively compact coordinate neighborhood $U$ of $p$ with compact boundary. Injectivity of $F$ gives
  $ "dist"_(upright("eucl")) \( F \( p \) \, F \( partial U \) \) > 0 . $
  For small enough $r$, $F compose f$ on $0 < \| z \| < r$ avoids $F \( partial U \)$, and the radial path supplies a point with image in $U$. Connectedness traps the entire punctured image in $U$. Bounded coordinate functions extend, so $f$ extends holomorphically. This argument uses compactness of a local chart boundary and global injectivity of $F$; it does not require $F$ to be proper.
  Off the puncture, $psi_oo = psi compose f$ almost everywhere. The latter now extends smoothly across it, so the two functions define the same distribution there and $mu$ has no atom at the puncture. Thus every alleged point of $Z$ is removable and has zero atomic mass. The preceding exponential-integrability and Morrey estimates apply across it as well, and the original sequence converges on all compact subsets of $Delta$. Since this applies to every sequence, the family of centers is relatively compact.
  If complete images could escape every compact, choose an escaping interior point on each disc and precompose with a disc automorphism sending zero to that point. Both the boundary compact and the area bound are unchanged, contradicting the center conclusion. This proves the first assertion.
  For the cotangent assertion take global holomorphic fields $X_1 \, dots.h \, X_m$ spanning $T^(1 \, 0) M$, as supplied by Proposition 2. The base images are compact by the first part. The functions $xi \( X_i \)$ along each disc are bounded by their boundary values. Over the resulting compact base the evaluation map $xi mapsto \( xi \( X_i \) \)_i$ has a uniform positive least singular value. Its bounded values therefore bound the cotangent vectors and put the images in a compact subset of $Y$. Local holomorphic normal-family compactness proves the stated subsequence conclusion. ◻
]

=== 4.3 Boundary factorization and holomorphic frames <boundary-factorization-and-holomorphic-frames>

We now construct frames normalized on the boundary of each disc. Their symplectic coefficients and their values at a fixed compact set of centers must remain controlled when the disc area increases. Fix the injective immersion

#[#set math.equation(numbering: n => "(4.11)")
 $ G : Y arrow.r bb(C)^q \, #h(2em) G \( x \, xi \) = #scale(x: 120%, y: 120%)[\(] F \( x \) \, xi \( X_1 \( x \) \) \, dots.h \, xi \( X_m \( x \) \) #scale(x: 120%, y: 120%)[\)] . $ <disc:immersion-y>]

It is injective because its base entries separate base points and the fiber evaluations separate covectors. It is immersive because $d F$ detects base tangent vectors and the evaluations detect vertical ones. There is also a finite family of global holomorphic fields spanning $T Y$: take the cotangent lifts

$ tilde(X)_i = sum_a X_i^a partial_(x_a) - sum_(a \, b) xi_b \( partial_(x_a) X_i^b \) partial_(xi_a) $

and the vertical translations by $d F_j$. The former span after projection to $T M$, and the latter span the vertical tangent. Smooth coefficients on any fixed compact subset of $Y$ can be represented by smooth functions of $G$ there, by local embedded coordinate neighborhoods and a finite partition of unity.

For a vector or matrix function $a$ on the circle, write

#[#set math.equation(numbering: n => "(4.12)")
 $ D \( a \)^2 = sum_(k in bb(Z)) \| k \| thin parallel a_k parallel_F^2 = frac(1, \( 2 pi \)^2) integral_0^(2 pi) #h(-0.16667em) integral_0^(2 pi) frac(parallel a \( e^(i \( t + theta \)) \) - a \( e^(i t) \) parallel_F^2, \| e^(i theta) - 1 \|^2) thin d t thin d theta \, $ <disc:half-sobolev>]

where $a_k$ are Fourier coefficients and $parallel dot.op parallel_F$ is the Frobenius norm. For holomorphic $a$, this is $pi^(- 1) integral_Delta parallel a' \( z \) parallel_F^2 thin d A$.

#thm([Lemma 4.5.])[
  (Disc frames and Gauss area).  #emph[Let $f$ be a holomorphic disc in $Y$ extending past the unit circle. There is a holomorphic frame $E_f$ of $f^(*) T Y$, smooth on the closed disc, for which $U = d G thin E_f$ satisfies 
#[#set math.equation(numbering: n => "(4.13)")
 $ U^(*) U = I quad upright("on ") partial Delta \, #h(2em) sup_Delta parallel U parallel_(upright("op")) lt.eq 1 . $ <disc:frame-unitary>]

 Let $frak(g) : Y arrow.r "Gr" \( 2 n \, q \)$ send $y$ to $d G \( T_y Y \)$, and normalize the Plücker form by $omega_("Gr") = i partial macron(partial) log det \( V^(*) V \)$ for a local holomorphic frame $V$ of its tautological plane. Then 
#[#set math.equation(numbering: n => "(4.14)")
 $ D \( U \)^2 = frac(1, 2 pi) integral_Delta \( frak(g) compose f \)^(*) omega_("Gr") . $ <disc:gauss-area>]

 If $f \( partial Delta \) subset K$ for a fixed compact $K subset Y$, the holomorphic component matrix $J_(E_f)$ of $cal(J)$ in this frame is bounded throughout $Delta$ by a constant depending only on $K$ and $G$. If also $f \( 0 \)$ ranges in a compact subset $K_0$ of a fixed coordinate chart, the frame matrix at zero and its inverse are bounded by constants depending only on $K$, $K_0$, $G$ and that chart. These constants do not depend on the disc area or on an interior compact containing its image.]
] <lem:disc-frames>

We will first trivialize $f^(*) T Y$ and then normalize the boundary Gram matrix of that frame. For the normalization we use the smooth Wiener–Masani factorization [55] in the Hardy-space form described by Berndtsson–Rosay [4] Theorem 2.1 and Section 6. We include its construction and the boundary half-Sobolev estimates that will control the later deformation error.

#thm([Lemma 4.6.])[
  (Boundary factorization).  #emph[Let $L$ be an $r times r$ smooth Hermitian matrix on the circle with $m I lt.eq L lt.eq M I$, where $0 < m lt.eq M < oo$. There is a holomorphic invertible matrix $H$ on $Delta$, smooth with smooth inverse on $overline(Delta)$, such that $L = H^(*) H$ on the circle. It satisfies 
#[#set math.equation(numbering: n => "(4.15)")
 $ parallel H parallel_(oo \, upright("op")) & lt.eq sqrt(M) \, & parallel H^(- 1) parallel_(oo \, upright("op")) & lt.eq m^(- 1 \/ 2) \,\
D \( H \)^2 & lt.eq frac(M, 2 m^2) D \( L \)^2 \, & D \( H^(- 1) \)^2 & lt.eq frac(1, 2 m^3) D \( L \)^2 . $ <disc:factor-sup>]

 In particular the seminorm constants depend only on the boundary spectral bounds, independently of higher derivatives of $L$.]
] <lem:boundary-factorization>

#proof[
  Equip the vector Hardy space with $parallel v parallel_L^2 = chevron.l v^(*) L v chevron.r$, where brackets denote normalized circle average. This norm is equivalent to the ordinary Hardy norm. The shift $v mapsto z v$ is an isometry, its range has codimension $r$, and $⋂_(k gt.eq 0) z^k H^2 = { 0 }$. An orthonormal basis $p_1 \, dots.h \, p_r$ of the orthogonal complement of the range, followed by all its successive shifts, is therefore an orthonormal basis of the weighted space. Indeed the orthogonal remainder after the first $k$ shift levels is $z^k H^2$, whose intersection is zero.
  Let $P$ be the holomorphic matrix with columns $p_i$. Orthogonality of all their shifts says that every Fourier coefficient of $P^(*) L P - I$ vanishes, so $P^(*) L P = I$ almost everywhere on the circle. Thus $P$ is bounded. Multiplication by $P$ maps the ordinary Hardy space isometrically onto the weighted space by the basis property. Apply this to constant target columns to obtain a holomorphic matrix $Q$ of Hardy functions with $P Q = I$. Consequently $P$ is invertible everywhere, $Q = P^(- 1)$, and the boundary identity gives $L = Q^(*) Q$. It also bounds both $P$ and $Q$ in $H^oo$ by their boundary values. Taking $H = Q$ proves (4.15).
  For the seminorm estimate put $L_theta \( z \) = L \( e^(i theta) z \)$ and $A_theta \( z \) = H \( e^(i theta) z \) H \( z \)^(- 1)$. This holomorphic matrix has $A_theta \( 0 \) = I$. Its mean is therefore $I$, and
  $ E_theta := chevron.l parallel A_theta - I parallel_F^2 chevron.r = chevron.l "tr" \( L_theta L^(- 1) - I \) chevron.r . $
  Changing variables in the expression for $E_(- theta)$ gives
  $ E_theta + E_(- theta) & = ⟨"tr" #scale(x: 120%, y: 120%)[\(] \( L_theta - L \) L^(- 1) \( L_theta - L \) L_theta^(- 1) #scale(x: 120%, y: 120%)[\)]⟩\
 & lt.eq m^(- 2) chevron.l parallel L_theta - L parallel_F^2 chevron.r . $
  The identities
  $ H_theta - H = \( A_theta - I \) H \, #h(2em) H_theta^(- 1) - H^(- 1) = H_theta^(- 1) \( I - A_theta \) $
  bound their squared differences by $M E_theta$ and $m^(- 1) E_theta$, respectively. Integrating against the symmetric kernel in (4.12) proves (4.15).
  It remains to justify smooth boundary regularity. The same difference inequality, divided by $theta^2$, first gives one full $L^2$ tangential derivative of $H$ and $H^(- 1)$. With prime denoting that derivative, set $B = H' H^(- 1)$; this is the boundary value of $i z H_z H^(- 1)$ and has zero constant Fourier coefficient. Differentiating $L = H^(*) H$ gives
  $ H^(- *) L' H^(- 1) = B + B^(*) . $
  The strictly positive Fourier projection recovers $B$. The one-dimensional Sobolev algebra property now bootstraps: if $H \, H^(- 1) in W^(k \, 2)$, the displayed expression is in $W^(k \, 2)$, hence so is $B$, and $H' = B H$ gives $H in W^(k + 1 \, 2)$. The inverse derivative formula gives the same for $H^(- 1)$. For this one-dimensional algebra assertion, Cauchy–Schwarz on Fourier coefficients and $sum_k \( 1 + k^2 \)^(- 1) < oo$ give $W^(1 \, 2) \( S^1 \) subset L^oo \( S^1 \)$. In each Leibniz term of total order at most $k gt.eq 1$, place a derivative of order at most $k - 1$ in $L^oo$ and the other factor in $L^2$; this gives the $W^(k \, 2)$ product estimate. The positive-frequency projection has norm at most one in every $W^(k \, 2)$. Iterating the preceding identities therefore gives all Sobolev orders, and the same Fourier estimate for derivatives proves smoothness on the closure. ◻
]

#proof[
  We first construct a preliminary frame on a neighborhood of the closed disc. The bundle $E = f^(*) T Y$ is embedded by $d G$ in a trivial bundle and is generated by the pullbacks of the finite global spanning fields. Start on a disc of radius greater than one and choose a generator not identically zero. On a slightly smaller disc, divide it by the finitely many common zero factors of its ambient components, using at each zero the minimum component vanishing order. The resulting section $e$ is holomorphic, remains in $E$ by continuity, and is nowhere zero.
  Write its ambient components as $e_1 \, dots.h \, e_q$ and put $ell_j = overline(e_j) \/ \| e \|^2$. Thus $sum_j e_j ell_j = 1$. The smooth $\( 0 \, 1 \)$-forms
  $ b_(j k) = ell_j macron(partial) ell_k - ell_k macron(partial) ell_j $
  are antisymmetric and satisfy $sum_j e_j b_(j k) = macron(partial) ell_k$. Solve $accent(partial c, ‾)_(j k) = b_(j k)$ with $c_(j k) = - c_(k j)$ on a further slightly smaller disc. This scalar step follows directly by multiplying the coefficient of each $\( 0 \, 1 \)$-form by one common smooth compactly supported cutoff equal to one on that disc and convolving on $bb(C)$ with $1 \/ \( pi z \)$; the distributional identity $macron(partial) \( 1 \/ \( pi z \) \) = delta_0$ gives a smooth solution for the smooth source. It does not use a frame of $E$. The functions
  $ a_k = ell_k - sum_j e_j c_(j k) $
  are holomorphic and obey $sum_k e_k a_k = 1$. The ambient row $a$ restricts to a holomorphic dual of $e$ on $E$, so $E = bb(C) e xor ker a$. If $s_i$ are the current generators, then $s_i - e thin a \( s_i \)$ generate $ker a$. Thus the kernel is again an ambiently embedded, finitely generated holomorphic bundle, now of rank one less. Repeat the construction on a finite nested sequence of discs whose radii remain greater than one. Induction gives a holomorphic frame of $f^(*) T Y$ on a neighborhood of $overline(Delta)$.
  Choose this preliminary frame and apply Lemma 13 to its $d G$ Gram matrix on the circle. Multiplication of the frame by $H^(- 1)$ yields $E_f$. The first identity in (4.13) follows immediately. For each constant column $v$, the maximum principle applied to the holomorphic vector $U v$ gives $\| U v \| lt.eq \| v \|$, proving the second.
  Put $Q = U^(*) U$. Since $Q = I$ on the circle,
  $ partial_r "tr" Q = "tr" \( partial_r Q \) = partial_r log det Q quad upright("on ") partial Delta . $
  Green’s formula and holomorphicity give
  $ 4 pi D \( U \)^2 = integral_Delta Delta_(upright("eucl")) "tr" Q thin d A = integral_Delta Delta_(upright("eucl")) log det Q thin d A = 2 integral_Delta \( frak(g) compose f \)^(*) omega_("Gr") \, $
  which proves (4.14).
  On the boundary, $E_f$ is orthonormal for the metric $G^(*) g_(upright("eucl"))$. Thus the components of $cal(J)$ there are bounded by its norm in that metric on $K$. They are holomorphic functions in the frame, so the maximum principle gives the same bound inside. For the last assertion, write $E_f = partial S$ in the fixed chart at the center, and let $J$ be the invertible coordinate matrix of $cal(J)$. Then
  $ J_(E_f) = S^(- 1) J S^(- sans(T)) \, #h(2em) S^(- 1) = J_(E_f) S^(sans(T)) J^(- 1) . $
  Let $gamma > 0$ be the infimum on $K_0$ of the least singular value of $d G$ in the coordinate Euclidean metric. By (4.13), $parallel S \( 0 \) parallel_(upright("op")) lt.eq gamma^(- 1)$. The preceding identity gives
  $ parallel S \( 0 \)^(- 1) parallel_(upright("op")) lt.eq sup_Delta parallel J_(E_f) parallel_(upright("op")) thin gamma^(- 1) sup_(K_0) parallel J^(- 1) parallel_(upright("op")) . $
  Every quantity on the right has the stated dependence. ◻
]

== 5 A differential inequality for the disc envelope <sec:variation>

Let $v$ be the lower semicontinuous envelope defined in (4.1)–(4.2), with its fixed horizon $T$. We continue to denote physical time at a disc center by $s$. The following inequality is the input to the fiber optimization in Section 6.

#thm([Proposition 5.1.])[
  (Differential inequality for the envelope).  #emph[Suppose that a smooth real function $phi$ touches $v$ from below at $\( y_(*) \, s_(*) \)$, where $0 < s_(*) < T$. In holomorphic cotangent coordinates write 
$ W = partial macron(partial)_Y phi \( y_(*) \, s_(*) \) = mat(delim: "(", A, B; B^(*), C) \, #h(2em) C > 0 . $

 There is a Hermitian form $K$ on the horizontal coordinate space such that 
#[#set math.equation(numbering: n => "(5.1)")
 $ K gt.eq 0 \, #h(2em) K gt.eq A - B C^(- 1) B^(*) \, #h(2em) partial_s phi \( y_(*) \, s_(*) \) gt.eq "tr" \( C^(sans(T)) K \) . $ <var:viscosity-inequality>]

 The transpose is the tangent–cotangent contraction in these coordinates. In particular the statement applies to lower tests translated in a fixed cotangent coordinate chart; its contraction has constant coefficients.]
] <prop:disc-inequality>

We prove the Proposition through localized almost minimizing discs. The estimate on their deformations will be stated with its constants: the compact set containing the interiors of the discs is allowed to depend on the area penalty, whereas the coefficient multiplying that penalty will depend only on boundary data. After this deformation estimate, we remove the negative part of the boundary Hessian and factor the remaining positive form. A backward clock variation bounds its symplectic cost. The final Schur-complement limit gives the asserted differential inequality.

=== 5.1 Localization and the order of approximation <localization-and-the-order-of-approximation>

Subtracting a positive multiple of $\| y - y_(*) \|^4 + \| s - s_(*) \|^4$ from $phi$ makes the contact strict on a compact coordinate cylinder $cal(C) subset.double Y times \( 0 \, T \)$ without changing the derivatives in (5.1). Thus $v - phi gt.eq 0$ on $cal(C)$, with equality only at $\( y_(*) \, s_(*) \)$, and with a positive gap near its boundary. The definition of lower semicontinuous regularization gives

$ inf_(\( y \, s \) in cal(C)) #scale(x: 120%, y: 120%)[\(] v^(upright("raw")) \( y \, s \) - phi \( y \, s \) #scale(x: 120%, y: 120%)[\)] = 0 . $

On an interval slightly larger than $\[ 0 \, T \]$, take $Q$ and $rho_j$ from Theorem 4 and Proposition 6, and set

#[#set math.equation(numbering: n => "(5.2)")
 $ d_(0 \, j) \( x \, t \) = j^(- 1) Q \( x \, t \) + rho_j \( x \, t \) . $ <var:base-cost>]

Thus $d_(0 \, j) gt.eq 0$, $\( partial_t - Delta_(h_t) \) d_(0 \, j) gt.eq 0$, and $d_(0 \, j) arrow.r 0$ uniformly on compact space–time sets. Choose increasing $A_j arrow.r oo$ so that

#[#set math.equation(numbering: n => "(5.3)")
 $ d_(0 \, j) \( x \, t \) gt.eq rho \( x \, t \) + j quad upright("if ") u \( x \) > A_j \/ 3 . $ <var:tail-wall>]

This is possible because $rho_j gt.eq rho - C_j$ and $Q$ has a positive quadratic lower bound. Choose fixed smooth scalar profiles and set $delta_1 = chi \( u \/ A_j \)$ and $delta_2 = tilde(chi) \( N \( dot.op \, 0 \) \/ B_j^2 \)$, with $0 lt.eq delta_i lt.eq 1$, where $delta_1 > 0$ exactly when $u < A_j$ and $delta_1 = 1$ when $u lt.eq 2 A_j \/ 3$, while $delta_2 > 0$ exactly when $N \( y \, 0 \) < B_j^2$ and $delta_2 = 1$ when $N \( y \, 0 \) lt.eq B_j^2 \/ 2$. Here $B_j gt.eq j$ will be increased below. Smooth cutoffs flat at their zero sets are permissible. On the open boundary region put

#[#set math.equation(numbering: n => "(5.4)")
 $ k_i = delta_i^(- 1) - 1 \, #h(2em) d \( y \, t \, s \) = d_(0 \, j) \( x \, t \) + \( 1 + s \) \( k_1 \( x \) + k_2 \( y \) \) . $ <var:wall-cost>]

Only the boundary of a competing disc is subject to these spatial restrictions. Their closed boundary region is a compact set $K_j subset Y$. Each fixed $d_(0 \, j)$ is smooth one-sided at $t = 0$, with all derivatives bounded on compact sets. When needed, use a smooth extension matching these initial jets; extending it by zero to negative time is unnecessary.

Use the boundary seminorm of Section 4,

$ D \( a \)^2 = sum_(k in bb(Z)) \| k \| thin parallel a_k parallel^2 \, $

and add the nonnegative energy

#[#set math.equation(numbering: n => "(5.5)")
 $ cal(E) \( f \, w \) =  & integral_Delta #scale(x: 120%, y: 120%)[\(] x_f^(*) omega_g + f^(*) G^(*) omega_(upright("eucl")) + \( frak(g) compose f \)^(*) omega_("Gr") + w^(*) omega_(upright("eucl")) #scale(x: 120%, y: 120%)[\)]\
 & + D #scale(x: 120%, y: 120%)[\(] log \( delta_1 delta_2 \) compose f #scale(x: 120%, y: 120%)[\)]^2 . $ <var:energy>]

Here $x_f = pi compose f$, and $frak(g)$ is the Gauss map of the immersion $G$ from Lemma 12. Let $mu_(j \, epsilon)$ be the infimum, over centers in $cal(C)$ and discs with the stated boundary restrictions, of

#[#set math.equation(numbering: n => "(5.6)")
 $ cal(F)_(j \, epsilon) \( f \, w \, s \) = chevron.l N \( f \, t \) + d \( f \, t \, s \) chevron.r + epsilon cal(E) \( f \, w \) - phi \( f \( 0 \) \, s \) \, #h(2em) t = s e^(w + macron(w)) . $ <var:penalized-functional>]

Infima are sufficient; no minimizing disc is asserted to exist. Every fixed admissible smooth disc has finite energy. Also every fixed disc in (4.1) eventually has $delta_1 = delta_2 = 1$ on its boundary. Consequently

#[#set math.equation(numbering: n => "(5.7)")
 $ mu_(j \, 0) arrow.r 0 \, #h(2em) mu_(j \, epsilon) arrow.b mu_(j \, 0) quad \( epsilon arrow.b 0 \) . $ <var:infimum-limits>]

For a minimizing sequence indexed by $nu$, at fixed $j \, epsilon > 0$, nonnegativity of the unpenalized excess gives

#[#set math.equation(numbering: n => "(5.8)")
 $ limsup_nu epsilon cal(E)_nu lt.eq mu_(j \, epsilon) - mu_(j \, 0) \, #h(2em) lim_(epsilon arrow.b 0) limsup_nu epsilon \( 1 + cal(E)_nu \) = 0 . $ <var:vanishing-penalty>]

As $j arrow.r oo$ after these limits, the centers approach $\( y_(*) \, s_(*) \)$ and

#[#set math.equation(numbering: n => "(5.9)")
 $ chevron.l d chevron.r arrow.r 0 \, #h(2em) chevron.l N \( f \, t \) chevron.r lt.eq C . $ <var:small-walls>]

Indeed each of $v - phi$, the boundary cost $d$, and $epsilon cal(E)$ is nonnegative and bounded by (5.6). The strict contact and the boundary gap in $cal(C)$ imply the assertion about centers. They therefore have a uniform interior margin for large $j$, small $epsilon$, and late terms of the sequences.

At fixed $j \, epsilon$ the energies are bounded. Proposition 9 then confines all images of $f$ to a common compact $K'_(j \, epsilon)$. There is no claim that $K'_(j \, epsilon)$ is independent of $epsilon$. One may require the initial discs to extend holomorphically past the circle: replacing $\( f \, w \)$ by $\( f \( r zeta \) \, w \( r zeta \) \)$, $r arrow.t 1$, preserves their centers and converges in every boundary norm used here. For each disc its strict boundary inequalities persist for $r$ close enough to one. Choosing the approximation separately for each term preserves all infima and minimizing-sequence assertions above.

=== 5.2 Boundary calculus and holomorphic deformations <boundary-calculus-and-holomorphic-deformations>

We first give the boundary estimates used to distinguish the two kinds of constants. The difference-quotient formula for $D$ gives

#[#set math.equation(numbering: n => "(5.10)")
 $ D \( a b \) & lt.eq parallel a parallel_oo D \( b \) + parallel b parallel_oo D \( a \) \,\
D \( Psi \( a \) \) & lt.eq "Lip" \( Psi \) D \( a \) \,\
\| chevron.l a \, partial_theta b chevron.r \| & lt.eq D \( a \) D \( b \) . $ <var:boundary-calculus>]

The last inequality follows directly from Fourier series; it is the pairing between $dot(H)^(1 \/ 2)$ and $dot(H)^(- 1 \/ 2)$. All three formulas hold componentwise for finite-dimensional vectors and matrices, with fixed dimensional constants. Smooth functions of bounded data can therefore be composed and multiplied with constants determined by their smooth bounds on the relevant compact sets. The circular Hilbert transform preserves $D$ on mean-zero functions.

For a disc let $E_f$ be the frame in Lemma 12, and put

$ X = G compose f \, #h(2em) U = d G thin E_f \, #h(2em) p = \( delta_1 delta_2 \) compose f \, #h(2em) q = log p . $

In the boundary estimates below, $p \, q$ denote these scalar functions. The symplectic polynomial $p \( cal(H) \)$ is distinguished by its matrix argument. For an integer $a gt.eq 4$, to be enlarged once below, let $m = p^a$ and let $h$ be the scalar outer function with boundary modulus $m$ and $h \( 0 \) > 0$. Thus

#[#set math.equation(numbering: n => "(5.11)")
 $ h \( 0 \) = exp chevron.l log m chevron.r \, quad parallel h parallel_oo lt.eq 1 \, quad D \( h \) + D \( h \/ m \) lt.eq C_a D \( q \) . $ <var:outer-wall>]

Here $h \/ m$ denotes only its boundary phase. To verify the last bound, write that phase as $exp \( i cal(H) \( a q \) \)$; both the exponential on the imaginary axis and $q mapsto e^(a q)$ for $q lt.eq 0$ are Lipschitz. The frame and energy estimates give

#[#set math.equation(numbering: n => "(5.12)")
 $ parallel U parallel_oo lt.eq 1 \, #h(2em) D \( X \) + D \( U \) + D \( w \) + D \( q \) lt.eq C \( 1 + sqrt(cal(E)) \) . $ <var:basic-boundary-bounds>]

Constants absorbing fixed area normalizations are harmless. Since $t lt.eq T$, the exponential restricted to the range of $2 Re w$ gives $D \( t \) lt.eq C_T D \( w \)$, even if some boundary times approach zero.

For $t$ and $s$ held fixed in the spatial Hessian, define

#[#set math.equation(numbering: n => "(5.13)")
 $ W_b = partial macron(partial)_Y \( N + d \) \, #h(2em) T_b = m^2 E_f^(*) W_b E_f . $ <var:boundary-symbol>]

For sufficiently large fixed $a$,

#[#set math.equation(numbering: n => "(5.14)")
 $ parallel T_b parallel_oo lt.eq C_j \, #h(2em) D \( T_b \)^2 lt.eq C_j \( 1 + cal(E) \) . $ <var:symbol-bounds>]

For example $partial macron(partial) \( delta^(- 1) \) = 2 delta^(- 3) partial delta ⊗ macron(partial) delta - delta^(- 2) partial macron(partial) delta$. Multiplication by $p^(2 a)$ clears all its denominators and leaves smooth coefficients on the closed boundary region. Every other coefficient is smooth on $K_j times \[ 0 \, T \] times cal(C)_s$. Choose $K_j subset cal(W)_j subset.double Y$ with compact closure. The injective immersion $G$ restricted to $overline(cal(W)_j)$ has a continuous inverse onto its image by compactness; thus $G \|_(cal(W)_j)$ is an embedding. A finite extension and partition construction from $G \( cal(W)_j \)$ near $G \( K_j \)$ expresses these coefficients as bounded smooth functions of $X$ there. The same applies to tensor coefficients evaluated on $U$. Equation (5.14) now follows from (5.10) and (5.12). These coefficient extensions are used only along the embedded compact set; no properness of $G$ is asserted.

#thm([Lemma 5.2.])[
  (Deformation estimate, with its uniformities).  #emph[Use the preceding localization, with $j$ sufficiently large and $epsilon > 0$ sufficiently small that the minimizing-sequence centers have a common interior margin in $cal(C)$. Fix a bound $L < oo$ and such a sequence for (5.6), with energy bounded by $E_0 < oo$. Let $l_nu$ be any holomorphic columns, smooth on the closed disc, such that 
$ parallel l_nu parallel_oo lt.eq L \, #h(2em) D \( l_nu \) lt.eq D_0 < oo . $

 They may depend on the disc. With $phi_(E \, c) = E_f \( 0 \)^(*) partial macron(partial)_Y phi \( f \( 0 \) \, s \) E_f \( 0 \)$, one has 
#[#set math.equation(numbering: n => "(5.15)")
 $ limsup_(nu arrow.r oo) {h \( 0 \)^2 phi_(E \, c) \( l \( 0 \) \, overline(l \( 0 \)) \) - chevron.l T_b \( l \, macron(l) \) chevron.r - C_j \( L \) epsilon #scale(x: 120%, y: 120%)[\(] 1 + cal(E) + D \( l \)^2 #scale(x: 120%, y: 120%)[\)]} lt.eq 0 . $ <var:deformation-estimate>]

 The constant $C_j \( L \)$ depends only on $L$, the dimension, the chosen integer $a$, the fixed time interval and center cylinder, and smooth coefficient bounds for the metrics, immersion, Gauss map and cutoffs on a fixed neighborhood of the boundary compact $K_j$. It is independent of $epsilon \, E_0 \, D_0$, of the interior compact $K'_(j \, epsilon)$, and of the auxiliary loss introduced in the proof. In contrast, the existence radius of the deformations, bounds on their full coefficients, and bounds on Taylor remainders may depend on $j \, L \, E_0 \, D_0 \, K'_(j \, epsilon)$, that loss, the interior margin of the centers, and the fixed smooth test $phi$.]
] <lem:disc-deformation>

#proof[
  We give the realization, Taylor justification, and actual mixed-derivative estimate separately.
  #emph[Realization of the first field.] Let $Z_1 \, dots.h \, Z_b$ be the global holomorphic spanning fields on $Y$. In the immersion $G$, let $A$ be their column matrix along $f$. If $r = dim_(bb(C)) Y$, enumerate all $r$-row, $r$-column minors $a_i$ of $A$. On $K'_(j \, epsilon)$ the sum of their squared moduli has a common positive lower bound. Their sup norms and Dirichlet norms are bounded at the fixed parameters: the minors are smooth holomorphic functions of $X$ on this compact, and $D \( X \)$ is bounded. Set
  $ sigma_i = frac(overline(a_i), sum_k \| a_k \|^2) \, #h(2em) b_(i k) = sigma_i macron(partial) sigma_k - sigma_k macron(partial) sigma_i . $
  These $\( 0 \, 1 \)$ coefficients have bounded $L^2 \( Delta \)$ norm. Solve $accent(partial Q, ‾)_(i k) = b_(i k)$, skew-symmetrically, with bounded $W^(1 \, 2)$ norm. Explicitly, if $b_(i k) = b_(i k \, 0) thin d macron(zeta)$, take $Q_(i k) = 4 partial_zeta Delta_D^(- 1) b_(i k \, 0)$, with the convention $Delta = 4 partial_zeta partial_(macron(zeta))$. Here $Delta_D^(- 1)$ is the zero-Dirichlet inverse on the unit disc. The unit disc has smooth boundary, the principal coefficients are the identity, and all lower coefficients vanish. The scalar Dirichlet estimate therefore gives
  $ parallel Delta_D^(- 1) b_(i k \, 0) parallel_(W^(2 \, 2) \( Delta \)) lt.eq C parallel b_(i k \, 0) parallel_(L^2 \( Delta \)) $
  [23] Theorem 9.15 and Lemma 9.17, proving the asserted $W^(1 \, 2)$ bound. Linearity preserves skew symmetry. Smooth input on the closed disc gives smooth output there [23] Theorem 8.13.
  Here is the precise boundary estimate. For a smooth function $q$ on the closed disc with boundary Fourier coefficients $a_k$, let $h \( r e^(i theta) \) = sum_k a_k r^(\| k \|) e^(i k theta)$ be its harmonic extension. Integration by parts gives
  $ integral_Delta \| nabla q \|^2 = integral_Delta \| nabla h \|^2 + integral_Delta \| nabla \( q - h \) \|^2 gt.eq 2 pi sum_k \| k \| \| a_k \|^2 . $
  If $q_0 \( r \)$ is the angular average, then for $1 \/ 2 lt.eq r lt.eq 1$
  $ \| q_0 \( 1 \) \|^2 lt.eq 2 \| q_0 \( r \) \|^2 + 2 \( 1 - r \) integral_r^1 \| q'_0 \( s \) \|^2 thin d s . $
  Integrating in $r$ and applying Jensen bounds the constant coefficient $\| a_0 \|^2$ by $C parallel q parallel_(W^(1 \, 2) \( Delta \))^2$. The nonconstant $L^2$ Fourier sum is bounded by its $\| k \|$-weighted sum. Consequently
  $ parallel q \|_(partial Delta) parallel_(L^2)^2 + D \( q \|_(partial Delta) \)^2 lt.eq C parallel q parallel_(W^(1 \, 2) \( Delta \))^2 . $
  Applied entrywise to $Q_(i k)$, this bounds its boundary $D$ and $L^2$ norms. The operator constants are fixed-disc constants; the input norms can still depend on $K'_(j \, epsilon)$. The functions
  $ g_i = sigma_i + sum_k Q_(i k) a_k $
  are holomorphic and $sum_i g_i a_i = 1$: differentiating uses $sum_k a_k sigma_k = 1$ and $sum_k a_k macron(partial) sigma_k = 0$, while skew symmetry cancels the quadratic term in the sum.
  A $W^(1 \, 2)$ trace need not be bounded. For a large number $P$ let $alpha$ be the scalar outer function with positive center value and boundary modulus
  $ r_P = \( 1 + \| Q \|^2 \/ P \)^(- 1) . $
  All norms and products involving $Q$ in the following boundary estimates refer to its trace on the circle. The maps $Q mapsto log \( 1 + \| Q \|^2 \/ P \)$ have Lipschitz constant $C \/ sqrt(P)$, and their $L^2$ norms are at most $C parallel Q parallel_2 \/ sqrt(P)$. The maps $Q mapsto r_P Q$ have bounded Lipschitz constant and sup norm at most $C sqrt(P)$. The phase of $alpha$ is the Hilbert transform of $log r_P$. Thus
  $ parallel alpha parallel_oo lt.eq 1 \, quad D \( alpha \) lt.eq C D \( Q \) \/ sqrt(P) \, quad D \( alpha Q \) lt.eq C D \( Q \) \, quad parallel alpha Q parallel_oo lt.eq C sqrt(P) . $
  In the third estimate the $sqrt(P)$ from the bounded product multiplies the $P^(- 1 \/ 2)$ bound for the phase. Moreover,
  $ chevron.l 1 - \| alpha \|^2 chevron.r lt.eq C parallel Q parallel_2^2 \/ P \, #h(2em) - log alpha \( 0 \) = chevron.l log \( 1 + \| Q \|^2 \/ P \) chevron.r arrow.r 0 . $
  Given $eta > 0$, choose $P$ uniformly for the sequence so that these last two quantities are at most $eta$ and $D \( alpha \) lt.eq 1$. The boundary estimates bound the sup norms and $D$ norms of $alpha g_i$. These functions are holomorphic, so the maximum principle also bounds their interior sup norms at the fixed parameters; it is not applied to the nonholomorphic products $alpha Q$.
  For each minor $a_i$, Cramer’s rule supplies a vector $c_i$, holomorphic in the disc, with $A c_i = a_i U l$. Namely use the adjugate on its selected rows and columns and set the other coefficient entries to zero. The identity follows by expanding the augmented determinants: every $\( r + 1 \)$-minor of $\( A \, U l \)$ is zero because this matrix still has rank $r$. This also treats selected minors that vanish identically. Consequently $c = sum_i alpha g_i c_i$ has bounded sup norm and $D$ and obeys $A c = alpha U l$. Write $c = \( c_1 \, dots.h \, c_b \)$ and compose the complex flows of $Z_1 \, dots.h \, Z_b$ with times $z h c_1 \, dots.h \, z h c_b$, starting at $f$. For a sufficiently small common complex parameter $z$ this gives a holomorphic family $f_z$, smooth up to the circle, whose first field is
  #[#set math.equation(numbering: n => "(5.16)")
   $ V = partial_z f_z\|_0 = alpha h E_f l . $ <var:first-field>]
  The existence radius is uniform at the fixed parameters, since the initial images lie in $K'_(j \, epsilon)$ and all flow times are bounded. On the boundary the displacement is $m$ times a uniformly bounded smooth function. Because $m lt.eq delta_i^a$, decreasing this radius makes each new $delta_i$ comparable to its old value, with constants between $1 \/ 2$ and $3 \/ 2$. Thus the spatial boundary restrictions persist. The variable $w$ and all times $t$ are unchanged, so no uniform margin below the upper time boundary is needed. The center stays in $cal(C)$ by its already established margin.
  #emph[Uniform Taylor remainders at the fixed parameters.] We spell this out because smoothness of individual discs does not by itself imply the uniform expansion needed for an infimum. On the controlled interior compact the flow map and all its derivatives through any fixed finite order are bounded. Differentiating in the disc variable introduces one derivative of $f$, $h$, or $c$. Their Dirichlet norms are bounded; for $f$ use local metric equivalence on $K'_(j \, epsilon)$ and (5.5). Hence the family and its first three real parameter derivatives have bounded $W^(1 \, 2)$ norms, with bounded sup norms for their values. Differentiating the area integrands through order three yields only bounded coefficients times products of at most two such first disc derivatives. Cauchy–Schwarz supplies uniform integrable bounds. The same reasoning applies to the Gauss map, whose derivatives are bounded on the controlled compact.
  At the boundary write $beta = h \/ m$. The boundary values of $f_z$ can be written in ambient coordinates as a smooth function of $X$, $c$, $beta$, and $z m$, on a fixed compact range. More precisely, for either cutoff,
  $ delta_i \( f_z \) = delta_i \( f \) + m R_i \( z \, X \, c \, beta \) \, #h(2em) R_i \( 0 \, dot.op \) = 0 \, $
  where the real parameter derivatives through order three of $R_i$ have bounded sup and $D$ norms at the fixed parameters, by (5.10). Since $m \/ delta_i = delta_i^(a - 1) delta_(3 - i)^a$ is smooth on the closed boundary region, the function
  $ log delta_i \( f_z \) - log delta_i \( f \) = log #scale(x: 120%, y: 120%)[\(] 1 + \( m \/ delta_i \) R_i #scale(x: 120%, y: 120%)[\)] $
  and its parameter derivatives through order three have uniformly bounded $D$ norms. For reciprocal walls, use
  $ frac(1, delta_i \( f_z \)) - frac(1, delta_i \( f \)) = - m / delta_i^2 thin frac(R_i, 1 + \( m \/ delta_i \) R_i) . $
  The prefactor is smooth and bounded when $a gt.eq 2$. Therefore all nonzero parameter derivatives of the wall costs through order three are uniformly bounded, even when the unchanged wall cost is large. The remaining boundary integrands $N \, d_(0 \, j)$ have bounded derivatives on $K_j times \[ 0 \, T \]$. Finally the quadratic seminorm of the logarithmic wall has three bounded parameter derivatives by its Hilbert space pairing formula. These observations prove a uniform $O \( \| z \|^3 \)$ remainder after parameter-circle averaging of the entire functional minus the test. The constants in this paragraph are allowed to depend on the interior compact and on $eta$.
  #emph[The actual mixed energy derivative uses boundary constants only.] Set $hat(V) = d G thin V = alpha h U l$ on the circle. Equations (5.10)–(5.16) imply
  #[#set math.equation(numbering: n => "(5.17)")
   $ parallel hat(V) parallel_oo lt.eq L \, #h(2em) D \( hat(V) \)^2 lt.eq C_j \( L \) #scale(x: 120%, y: 120%)[\(] 1 + cal(E) + D \( l \)^2 #scale(x: 120%, y: 120%)[\)] . $ <var:first-field-bound>]
  Here only $parallel alpha parallel_oo lt.eq 1$ and $D \( alpha \) lt.eq 1$ were used; the corona coefficients have disappeared.
  For clarity, consider any one of the closed $\( 1 \, 1 \)$ forms $omega$ in the three spatial area terms of (5.5). It is a smooth closed form on $Y$ after pullback. In ambient coordinates near the boundary write its intrinsic tensor as $i b_(p macron(q)) \( X \) thin d X^p and d macron(X)^q$, extending the coefficients smoothly from $G \( cal(W)_j \)$ near $G \( K_j \)$ as above. Deformed boundaries stay intrinsically in $cal(W)_j$ for a smaller parameter radius. Closure is used intrinsically before this extension. Cartan’s formula and Stokes give
  #[#set math.equation(numbering: n => "(5.18)")
   $ partial_z partial_(macron(z)) integral_Delta f_z^(*) omega\|_0 = i integral_0^(2 pi) #scale(x: 120%, y: 120%)[\[] & b_(p macron(q)) \( X \) hat(V)^p partial_theta overline(hat(V)^q)\
 & + \( partial_(macron(r)) b_(p macron(q)) \) \( X \) hat(V)^p overline(hat(V)^r) thin partial_theta overline(X^q) #scale(x: 120%, y: 120%)[\]] thin d theta . $ <var:boundary-area-identity>]
  One can also verify the identity using local potentials: the mixed parameter derivative equals the boundary normal derivative of $omega \( V \, macron(V) \)$, with the corresponding Stokes normalization. In (5.18), the holomorphic dependence of $G f_z$ eliminates a mixed second parameter field. The identity is global; it does not require partitioning $omega$ into nonclosed forms.
  The coefficient $b$ has bounded $C^2$ norm determined only by $K_j$. For $B = parallel hat(V) parallel_oo$,
  $ D \( b \( X \) hat(V) \) & lt.eq C_j #scale(x: 120%, y: 120%)[\(] D \( hat(V) \) + B D \( X \) #scale(x: 120%, y: 120%)[\)] \,\
D \( \( accent(partial b, ‾) \) \( X \) hat(V) overline(hat(V)) \) & lt.eq C_j #scale(x: 120%, y: 120%)[\(] B D \( hat(V) \) + B^2 D \( X \) #scale(x: 120%, y: 120%)[\)] . $
  Pairing each angular derivative by (5.10) bounds the absolute value of (5.18) by $C_j \( L \) \( D \( X \)^2 + D \( hat(V) \)^2 \)$. This proves the required estimate for all spatial areas. The $w$ area is unchanged. In particular for the Euclidean area the identity reduces, up to its fixed normalization, to $D \( hat(V) \)^2$.
  It remains to check the logarithmic seminorm; its unbounded argument cannot be handled by an unweighted smooth-composition assertion. On the boundary put $Z = alpha beta U l$, so that $hat(V) = m Z$. Then
  $ parallel Z parallel_oo lt.eq L \, #h(2em) D \( Z \) lt.eq C_j \( L \) \( 1 + sqrt(cal(E)) + D \( l \) \) . $
  Regarding $p = delta_1 delta_2$ as a smooth ambient function, the tensors
  #[#set math.equation(numbering: n => "(5.19)")
   $ m partial log p & = p^(a - 1) partial p \,\
m^2 partial macron(partial) log p & = p^(2 a - 1) partial accent(partial p, ‾) - p^(2 a - 2) partial p ⊗ accent(partial p, ‾) $ <var:cleared-log-tensors>]
  extend smoothly to the closed boundary region. For $q_z = log p \( f_z \)$ their contractions against $Z$ and $\( Z \, macron(Z) \)$ are exactly $partial_z q_z \|_0$ and $partial_z partial_(macron(z)) q_z \|_0$, respectively. Consequently each has $D$ bounded by $C_j \( L \) \( 1 + sqrt(cal(E)) + D \( l \) \)$. Write $b = partial_z q_z \|_0$ and $c = partial_z partial_(macron(z)) q_z \|_0$, and let $B_D$ be the sesquilinear pairing $B_D \( u \, v \) = sum_k \| k \| u_k overline(v_k)$. Since $q_z$ is real, differentiating this quadratic seminorm gives exactly
  #[#set math.equation(numbering: n => "(5.20)")
   $ partial_z partial_(macron(z)) D \( q_z \)^2\|_0 = 2 D \( b \)^2 + 2 Re B_D \( q \, c \) . $ <var:log-energy-identity>]
  Since $D \( q \)^2 lt.eq cal(E)$, Cauchy–Schwarz proves
  #[#set math.equation(numbering: n => "(5.21)")
   $ lr(|partial_z partial_(macron(z)) cal(E) \( f_z \, w \)\|_0|) lt.eq C_j \( L \) \( 1 + cal(E) + D \( l \)^2 \) . $ <var:actual-energy-derivative>]
  All constants in (5.21) use boundary coefficients only, independently of the realization and Taylor constants.
  #emph[Testing the infimum and removing the auxiliary loss.] Every deformed value of (5.6) is at least $mu_(j \, epsilon)$, while the values at $z = 0$ approach it. Average over $\| z \| = r$, subtract the value at zero, and divide by $r^2$. First take the minimizing-sequence limit with $r$ fixed, and then $r arrow.b 0$. The uniform remainder just proved yields a nonnegative lower limit for the mixed derivative of cost minus test. Its nonpenalty terms are
  $ chevron.l \| alpha \|^2 T_b \( l \, macron(l) \) chevron.r - \| alpha \( 0 \) \|^2 h \( 0 \)^2 phi_(E \, c) \( l \( 0 \) \, overline(l \( 0 \)) \) . $
  The center frames and their inverses are bounded independently of interior area by Lemma 12. Thus the test term is bounded, as is the boundary symbol by (5.14). Removing $alpha$ changes these terms by at most $C_(j \, L \, phi) eta$. Equation (5.21) has a coefficient independent of $eta$. Send $eta arrow.b 0$ after the sequence and radius limits. This proves (5.15) with the stated uniformities. In particular, none of the constants controlling the shrinking realization radius multiplies the final $epsilon cal(E)$ error. ◻
]

=== 5.3 Removing the negative part and factoring the boundary form <removing-the-negative-part-and-factoring-the-boundary-form>

The allowance for disc-dependent columns in Lemma 15 is essential here. Let $S = \( T_b \)_(-)$ be the positive semidefinite negative part of $T_b$. Matrix clipping is Lipschitz in the Frobenius norm, so $parallel S parallel_oo lt.eq C_j$ and $D \( S \)^2 lt.eq C_j \( 1 + cal(E) \)$. Let $S_P$ be its Fejér mean of order $P$. Positivity of the Fejér kernel preserves its sup bound, and its Fourier multipliers give

#[#set math.equation(numbering: n => "(5.22)")
 $ parallel S_P - S parallel_2^2 lt.eq C_j \( 1 + cal(E) \) \/ P . $ <var:fejer-error>]

Each column $l_i \( zeta \) = zeta^(P + 1) S_P \( zeta \) e_i$ is holomorphic, vanishes at zero, and has

$ parallel l_i parallel_oo lt.eq C_j \, #h(2em) D \( l_i \)^2 lt.eq C_j \( P + 1 \) . $

The frequency shift has modulus one on the circle, so summing (5.15) over these columns tests $"tr" \( T_b S_P^2 \)$. In comparison, $"tr" \( T_b S^2 \) = - "tr" \( S^3 \)$. For fixed $j \, epsilon$, discard finitely many sequence terms and let $B_epsilon$ bound $1 + cal(E)_nu$, with $epsilon B_epsilon arrow.r 0$ as $epsilon arrow.b 0$, as permitted by (5.8). Choose an integer $P = P_epsilon$, fixed along this sequence, with

$ B_epsilon \/ P_epsilon arrow.r 0 \, #h(2em) epsilon P_epsilon arrow.r 0 \; $

for example round $sqrt(B_epsilon \/ epsilon)$ upward. The trace error is at most $C_j parallel S_P - S parallel_2$ by boundedness of both matrices. Equations (5.15) and (5.22) therefore imply

#[#set math.equation(numbering: n => "(5.23)")
 $ lim_(epsilon arrow.b 0) limsup_nu chevron.l "tr" \( \( T_b \)_(-)^3 \) chevron.r = 0 \, #h(2em) lim_(epsilon arrow.b 0) limsup_nu parallel \( T_b \)_(-) parallel_1 = 0 . $ <var:negative-part>]

The second conclusion follows by Hölder’s inequality in fixed dimension. This argument uses both sides of the intermediate frequency choice; a bound merely of the form $epsilon cal(E) = O \( 1 \)$ would not suffice.

Fix $delta > 0$. Apply the smooth scalar function $lambda mapsto delta + \( lambda + sqrt(lambda^2 + delta^2) \) \/ 2$ to $T_b$ and call the resulting positive boundary matrix $L$. Then

$ L gt.eq T_b + delta I \, #h(2em) L gt.eq delta I \, #h(2em) parallel L - \( T_b \)_(+) parallel lt.eq 3 / 2 delta . $

Functional calculus in fixed dimension gives $D \( L \) lt.eq C_(j \, delta) D \( T_b \)$. Lemma 13 gives $L = H^(*) H$, with $H \, H^(- 1)$ holomorphic and smooth on the closed disc; this is the smooth boundary factorization of [4] Theorem 2.1, with the quantitative seminorm estimate established in Section 4. For every constant unit column $e$,

$ l = H^(- 1) e \, #h(2em) parallel l parallel_oo lt.eq delta^(- 1 \/ 2) \, #h(2em) D \( l \)^2 lt.eq C_(j \, delta) \( 1 + cal(E) \) . $

These are permissible disc-dependent tests at fixed $j \, epsilon \, delta$. Since $T_b lt.eq L$, their boundary quadratic costs are at most one. Equation (5.8) now gives

#[#set math.equation(numbering: n => "(5.24)")
 $ h \( 0 \)^2 phi_(E \, c) lt.eq \( 1 + o \( 1 \) \) H \( 0 \)^(*) H \( 0 \) $ <var:center-majorant>]

as the sequence limit and then $epsilon arrow.b 0$ are taken at fixed $j \, delta$. To see that this is a matrix assertion, if the largest violation did not tend to zero, choose its unit eigenvector separately for each disc. Those columns satisfy exactly the same sup and $D$ bounds, contradicting Lemma 15. Thus no fixed-test assumption has entered either the Fejér test or the spectral-factor test.

=== 5.4 The backward clock and the symplectic cost <the-backward-clock-and-the-symplectic-cost>

Choose cutoffs $0 lt.eq chi_i lt.eq 1$ which are one wherever $delta_i$ differs, or starts to differ, from one. Require

$ "supp" chi_1 subset { u > A_j \/ 3 } \, #h(2em) "supp" chi_2 subset { N \( y \, 0 \) > c_2 B_j^2 } $

for a fixed $c_2 > 0$. Before choosing $B_j$ we can choose $C'_j gt.eq 1$ depending on the base compact, $d_(0 \, j)$ and the time interval, and a fixed integer $c_3$, such that

#[#set math.equation(numbering: n => "(5.25)")
 $ \| p \( W_b \) - partial_t N - Delta_(h_t) #scale(x: 120%, y: 120%)[\(] d_(0 \, j) + \( 1 + s \) k_1 #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\|] lt.eq C'_j \( 1 + B_j \)^(c_3) \( delta_1 delta_2 \)^(- c_3) upright(bold(1))_({ chi_2 = 1 }) . $ <var:fiber-wall-error>]

Indeed Lemma 8 gives the exact equality without the second wall. The remaining expression is a polynomial of degree at most two in the Hessian entries. On a compact base, $N \( y \, t \)$ and $N \( y \, 0 \)$ are quadratic in the fiber variables, and their fixed finite derivatives grow polynomially in those variables. Differentiating the reciprocal cutoff twice introduces at most three inverse powers of $delta_2$; the analogous first-wall factors have at most three inverse powers of $delta_1$. Enlarging a fixed integer $c_3$ bounds all these finitely many terms. This proves (5.25), including that $C'_j$ is chosen before $B_j$. Also

#[#set math.equation(numbering: n => "(5.26)")
 $ \| Delta_(h_t) k_1 \| lt.eq C e^rho delta_1^(- 3) upright(bold(1))_({ chi_1 = 1 }) . $ <var:base-wall-error>]

Here the controlled gradient and complex Hessian of $u$ bound $\| partial accent(partial k, ‾)_1 \|_g$ by $C delta_1^(- 3)$ uniformly in large $A_j$. Since $0 < h_t lt.eq g$, each inverse eigenvalue relative to $g$ is at most $e^rho$, proving (5.26).

Fix integers $a \, c$ sufficiently large that $4 a gt.eq c_3 + 3$ and $c > c_3 + 3$, retaining all earlier requirements on $a$. Put

#[#set math.equation(numbering: n => "(5.27)")
 $ gamma_0 =  & m^4 exp #scale(x: 120%, y: 120%)[\[] - chi_1 \( rho + c log \( j + 2 \) \) #scale(x: 120%, y: 120%)[\]]\
 &  dot.op exp #scale(x: 120%, y: 120%)[\[] - chi_2 \( log C'_j + c log \( j + 2 \) + c log \( 1 + B_j \) \) #scale(x: 120%, y: 120%)[\]] \,\
gamma =  & gamma_0 \/ chevron.l gamma_0 chevron.r . $ <var:clock-weight>]

Choose $B_j$ so large that $log C'_j \/ B_j^2 arrow.r 0$. The preceding choice of $C'_j$ makes this noncircular. Since $- log delta_i lt.eq k_i$, (5.9) controls $chevron.l - log m chevron.r$. On $"supp" chi_1$, (5.3) controls both $rho$ and $j$ by $d_(0 \, j)$. On $"supp" chi_2$, the pointwise boundary inequality $N \( f \, t \) gt.eq N \( f \, 0 \)$ and (5.9) give $chevron.l chi_2 chevron.r lt.eq C \/ B_j^2$. It follows, in the stated successive limits, that

#[#set math.equation(numbering: n => "(5.28)")
 $ chevron.l - log gamma_0 chevron.r arrow.r 0 \, #h(2em) chevron.l gamma_0 chevron.r arrow.r 1 \, #h(2em) chevron.l log gamma chevron.r arrow.r 0 . $ <var:clock-loss>]

For example, the second limit also follows from $e^(chevron.l log gamma_0 chevron.r) lt.eq chevron.l gamma_0 chevron.r lt.eq 1$.

The powers and exponentials in (5.27) bound the weighted errors in (5.25) and (5.26) by a quantity tending to zero. On the support of each error its corresponding cutoff equals one, so the cancellation is literal; $m^4$ clears the displayed inverse wall powers, $e^(- rho)$ clears $e^rho$, and $\( C'_j \)^(- 1) \( 1 + B_j \)^(- c) \( j + 2 \)^(- c)$ clears the fiber error. The denominator $chevron.l gamma_0 chevron.r$ tends to one, and $t \/ s$ is bounded because centers stay in $cal(C)$. Since $\( partial_t - Delta_(h_t) \) d_(0 \, j) gt.eq 0$, we obtain

#[#set math.equation(numbering: n => "(5.29)")
 $ ⟨t / s gamma \( partial_t N + partial_t d_(0 \, j) \) + k_1 + k_2⟩ gt.eq ⟨t / s gamma p \( W_b \)⟩ - o_j \( 1 \) . $ <var:clock-comparison>]

Here $o_j \( 1 \)$ tends to zero after the earlier limits.

The clock test giving the left side of (5.29) must run backward. At fixed $j$,

$ parallel gamma parallel_oo lt.eq C_j \, #h(2em) D \( gamma \)^2 lt.eq C_j \( 1 + cal(E) \) . $

These follow by (5.10) from the smooth coefficients in (5.27); the denominator has a positive lower bound by Jensen and the bounded cost. For an explicit bound, let $M$ bound the unpenalized boundary cost along the fixed-$j$ sequences. Then $chevron.l k_1 + k_2 chevron.r lt.eq M$, $chevron.l - log p chevron.r lt.eq M$, and $chevron.l chi_1 rho chevron.r lt.eq M$ by the tail wall. Hence

$ chevron.l - log gamma_0 chevron.r lt.eq \( 4 a + 1 \) M + 2 c log \( j + 2 \) + log C'_j + c log \( 1 + B_j \) \, $

and Jensen gives a positive lower bound for $chevron.l gamma_0 chevron.r$ depending only on these fixed-$j$ data. No lower bound on the individual cutoffs or boundary times is used. Let $Gamma$ be holomorphic with boundary real part $gamma - 1$ and $Gamma \( 0 \) = 0$. For $s' < s$ set

$ w' = w + 1 / 2 log \( s' \/ s \) Gamma . $

On the circle the new time is $t \( s' \/ s \)^gamma$. In the interior its exponent is the positive harmonic extension of $gamma$. Hence every time decreases, including when the original disc has arbitrarily little margin below $T$. The center of $w'$ is still zero.

Comparing the perturbed functional with its infimum, first along the minimizing sequence and then letting $s' arrow.t s$, gives

#[#set math.equation(numbering: n => "(5.30)")
 $ partial_s phi \( f \( 0 \) \, s \) gt.eq ⟨t / s gamma \( partial_t N + partial_t d_(0 \, j) \) + k_1 + k_2⟩ - C_j epsilon \( 1 + cal(E) \) - o \( 1 \) . $ <var:backward-test>]

The sign follows because the quotient denominator $s' - s$ is negative. For the energy error only the $w$ area changes, and $D \( Gamma \) lt.eq C D \( gamma \)$ gives its derivative bound by Cauchy–Schwarz. Its Taylor expansion is quadratic in $log \( s' \/ s \)$. For the boundary cost, derivatives of $t \( s' \/ s \)^gamma$ are uniformly bounded at fixed $j$; $N \, d_(0 \, j)$ are smooth down to $t = 0$ on $K_j$. The possibly unbounded unchanged walls multiply $1 + s'$ affinely and thus have no second time remainder. These facts justify the sequence-then-difference limit in (5.30) without a bound on the imaginary part of $Gamma$.

Let $cal(J)_E$ be the bivector components in $E_f$. Its holomorphic sup bound depends only on $K_j$ by Lemma 12. Since $p$ is quadratic in the Hermitian form, $p \( W_b \) = m^(- 4) p \( T_b \, cal(J)_E \)$. At fixed $j$, the factor $gamma m^(- 4)$ is bounded. Therefore (5.23), the uniform symbol bounds, and $L = \( T_b \)_(+) + O \( delta \)$ allow the replacement

#[#set math.equation(numbering: n => "(5.31)")
 $ ⟨t / s gamma p \( W_b \)⟩ = ⟨t / s gamma m^(- 4) p \( L \, cal(J)_E \)⟩ + O_j \( delta \) + o \( 1 \) $ <var:positive-replacement>]

after $epsilon arrow.b 0$. The vector $\( and.big^2 H \) cal(J)_E$ is holomorphic and nonzero. Logarithmic submean for its squared norm, followed by scalar Jensen, gives

#[#set math.equation(numbering: n => "(5.32)")
 $ ⟨t / s gamma m^(- 4) p \( L \, cal(J)_E \)⟩ & gt.eq exp chevron.l log gamma chevron.r thin h \( 0 \)^(- 4) p \( H \( 0 \)^(*) H \( 0 \) \, cal(J)_E \( 0 \) \) . $ <var:symplectic-submean>]

Indeed $chevron.l log \( t \/ s \) chevron.r = 2 Re w \( 0 \) = 0$ and $log h \( 0 \) = chevron.l log m chevron.r$, which give precisely the factors in (5.32). If desired, logarithmic submean follows by applying submean to $log \( \| Z \|^2 + eta \)$ and then $eta arrow.b 0$ for the displayed holomorphic vector $Z$.

=== 5.5 Passing from positive majorants to the required form <passing-from-positive-majorants-to-the-required-form>

#thm([Lemma 5.3.])[
  (Symplectic cost and the Schur complement).  #emph[In a cotangent vector space with canonical bivector $cal(J) = sum_i e_i and f_i$, let $cal(H) > 0$ be Hermitian, and suppose $cal(H) gt.eq W$, where the vertical block $C$ of $W$ is positive. Then 
#[#set math.equation(numbering: n => "(5.33)")
 $ S = "Schur" \( cal(H) \) gt.eq 0 \, #h(2em) S gt.eq "Schur" \( W \) \, #h(2em) p \( cal(H) \) gt.eq "tr" \( C^(sans(T)) S \) . $ <var:schur-cost>]

]
] <lem:symplectic-schur>

#proof[
  Write $cal(H) = mat(delim: "(", A, B; B^(*), D)$, $S = A - B D^(- 1) B^(*)$ and $R = D^(- 1) B^(*)$. The complex-linear change $\( x \, y \) mapsto \( x \, y + R x \)$ makes the form block diagonal with blocks $\( S \, D \)$. It carries the canonical bivector to
  $ sum_i e_i and f_i + sum_(k \, i) R_(k i) f_k and f_i . $
  Its cross and vertical components are orthogonal for the induced exterior-square form, whence
  $ p \( cal(H) \) = "tr" \( S D^(sans(T)) \) + lr(|sum_(k \, i) R_(k i) f_k and f_i|)_D^2 . $
  The shear need not be symplectic; its additional vertical term is retained and is nonnegative. Since $D gt.eq C$ and $S > 0$, the last identity gives $p \( cal(H) \) gt.eq "tr" \( S C^(sans(T)) \)$. Finally, for each horizontal $x$,
  $ S \( x \, macron(x) \) = inf_y cal(H) \( \( x \, y \) \, overline(\( x \, y \)) \) gt.eq inf_y W \( \( x \, y \) \, overline(\( x \, y \)) \) = "Schur" \( W \) \( x \, macron(x) \) . $
  The last infimum is finite and has the usual Schur expression because $C > 0$. This proves the Lemma. ◻
]

#proof[
  #emph[Completion of the proof of Proposition 14.] Combine (5.24), (5.29), (5.30), (5.31), and (5.32). More explicitly, if $r gt.eq 0$ denotes the error tending to zero in (5.24), the form with frame matrix
  $ cal(H)_E = \( 1 + r \) h \( 0 \)^(- 2) H \( 0 \)^(*) H \( 0 \) $
  is a positive majorant of the test Hessian at its center, after an arbitrarily small enlargement if necessary. Transform it to the fixed cotangent coordinates. Its symplectic cost is
  $ p \( cal(H) \) = \( 1 + r \)^2 h \( 0 \)^(- 4) p \( H \( 0 \)^(*) H \( 0 \) \, cal(J)_E \( 0 \) \) . $
  For fixed $j \, delta$ first take the minimizing-sequence limits and $epsilon arrow.b 0$; then send $delta arrow.b 0$; finally let $j arrow.r oo$. Equations (5.9) and (5.28) give a diagonal sequence of approaching centers and positive majorants $cal(H)$ such that
  $ limsup p \( cal(H) \) lt.eq partial_s phi \( y_(*) \, s_(*) \) . $
  No compactness of the complete matrices $cal(H)$ is needed. Their test vertical blocks $C_c$ converge to $C > 0$, so for late centers $C_c gt.eq c I$ with a fixed $c > 0$. Lemma 16 bounds their positive Schur forms $S_c$ by $c "tr" S_c lt.eq p \( cal(H) \)$. Pass to a convergent subsequence $S_c arrow.r K$. The same Lemma and continuity of the test Hessian and its Schur complement give
  $ K gt.eq 0 \, #h(2em) K gt.eq "Schur" \( W \) \, #h(2em) "tr" \( C^(sans(T)) K \) lt.eq partial_s phi \( y_(*) \, s_(*) \) . $
  This is (5.1) and proves the Proposition. ◻
]

== 6 Fiber ellipsoids and joint positivity <sec:ellipsoids>

We turn the disc inequality into a scalar comparison by optimizing a Hermitian form in each cotangent fiber. Throughout this Section, $t$ is physical time, and $0 < t < T$ for a fixed finite $T$. Thus $t$ plays the role of the center-time parameter in Proposition 14. Let $v$ be its lower semicontinuous disc envelope. We use

#[#set math.equation(numbering: n => "(6.1)")
 $ N \( x \, xi \, 0 \) lt.eq v \( x \, xi \, t \) lt.eq N \( x \, xi \, t \) \, #h(2em) v \( x \, c xi \, t \) = \| c \|^2 v \( x \, xi \, t \) . $ <ell:envelope-bounds>]

The matrices below represent Hermitian forms on cotangent columns by $xi^(*) B xi$. Accordingly, contraction against a horizontal Levi form $H$ is $"tr" \( B^(sans(T)) H \)$; in particular, $Delta_(h_t) f = "tr" \( b_t^(sans(T)) partial macron(partial)_x f \)$.

=== 6.1 The optimizer and its contacts <the-optimizer-and-its-contacts>

The optimizer/contact-resolution argument is a Hermitian adaptation of John’s optimal-ellipsoid contact method [30]. The lower-semicontinuity details are proved here; the common-base product support and the ensuing PDE comparison are further arguments below, not consequences imported from the classical real convex-body theorem.

For each $\( x \, t \)$, let $B \( x \, t \)$ be the feasible matrix maximizing the determinant:

#[#set math.equation(numbering: n => "(6.2)")
 $ det B \( x \, t \) = max { det D : D > 0 \, med xi^(*) D xi lt.eq v \( x \, xi \, t \) upright(" for every ") xi #scale(x: 120%, y: 120%)[}] \, #h(2em) cal(L) = log det B . $ <ell:optimizer>]

The ellipsoid ${ xi : xi^(*) D xi < 1 }$ of a feasible matrix contains ${ xi : v \( x \, xi \, t \) < 1 }$. Maximizing $det D$ minimizes its Euclidean volume in these fiber coordinates.

#thm([Lemma 6.1.])[
  #emph[The maximum in (6.2) exists and is unique. The function $cal(L)$ is lower semicontinuous in each holomorphic coordinate chart, and 
#[#set math.equation(numbering: n => "(6.3)")
 $ F_0 := log det b_t - cal(L) quad upright("satisfies") quad 0 lt.eq F_0 lt.eq rho . $ <ell:volume-gap>]

 At any fixed point, choose linear cotangent coordinates in which $B = I$. There are finitely many unit columns $xi_i$ and positive numbers $alpha_i$ such that 
#[#set math.equation(numbering: n => "(6.4)")
 $ v \( x \, xi_i \, t \) = 1 \, #h(2em) sum_(i = 1)^m alpha_i xi_i xi_i^(*) = I \, #h(2em) sum_(i = 1)^m alpha_i = n . $ <ell:contact-resolution>]

 The largest weight can be made arbitrarily small by repeating columns.]
] <ell:optimizer-contacts>

#proof[
  The initial cometric $b_0$ is feasible by (6.1). Every feasible matrix satisfies $D lt.eq b_t$. The constraints therefore define a compact set if positive semidefinite matrices are temporarily admitted. A determinant maximizer in that set has determinant at least $det b_0 > 0$, so is positive definite. Strict concavity of $log det$ on the positive cone gives uniqueness. It also follows that $det b_0 lt.eq det B lt.eq det b_t$, which proves (6.3), since $rho = log det b_t - log det b_0$.
  Fix a feasible positive matrix $D$ at $\( x_0 \, t_0 \)$. For $0 < epsilon < 1$, the candidate $\( 1 - epsilon \) D$ has a strictly positive margin on the unit fiber sphere. Lower semicontinuity of $v$ and compactness of that sphere preserve this margin for all nearby $\( x \, t \)$. Consequently
  $ liminf_(\( x \, t \) arrow.r \( x_0 \, t_0 \)) cal(L) \( x \, t \) gt.eq log det D + n log \( 1 - epsilon \) . $
  Take $D = B \( x_0 \, t_0 \)$ and then $epsilon arrow.b 0$. This proves the asserted semicontinuity without asserting continuity of the optimizing matrix. Under a change of holomorphic base coordinates, both $cal(L)$ and $log det b_t$ acquire the same time-independent pluriharmonic summand. Thus $F_0$ is a globally defined upper semicontinuous function.
  Normalize $B \( x_0 \, t_0 \) = I$, using a constant linear base-coordinate change and its induced cotangent change. On the unit sphere put
  $ E = { xi : v \( x_0 \, xi \, t_0 \) = 1 } . $
  This is compact, because $v gt.eq \| xi \|^2$ at the chosen base point. Suppose that a Hermitian matrix $H$ is strictly negative on $E$. It is uniformly negative in a neighborhood of $E$ on the sphere; on the complementary compact set, $v - 1$ has a positive minimum. It follows that $I + epsilon H$ is feasible for all sufficiently small $epsilon > 0$. Optimality then implies $"tr" H lt.eq 0$.
  The cone generated by $xi xi^(*)$, $xi in E$, is closed: its generators have trace one, so bounded trace bounds the total coefficient in any conic combination. If $I$ were outside this cone, finite-dimensional separation would give $H$ with $"tr" H > 0$ and $xi^(*) H xi lt.eq 0$ on $E$. Subtracting a sufficiently small positive multiple of $I$ contradicts the preceding paragraph. Hence $I$ belongs to the cone. A finite conic representation gives (6.4), after discarding zero coefficients. Taking its trace gives $sum_i alpha_i = n$. Replacing each pair $\( xi_i \, alpha_i \)$ by $r$ copies of $\( xi_i \, alpha_i \/ r \)$ preserves every identity and divides the largest weight by $r$. ◻
]

#thm([Proposition 6.2.])[
  #emph[For the optimizer in (6.2), every smooth lower test $lambda$ of $cal(L)$ at an interior point $\( x_0 \, t_0 \)$ satisfies 
#[#set math.equation(numbering: n => "(6.5)")
 $ partial_t lambda \( x_0 \, t_0 \) gt.eq e^(- F_0 \( x_0 \, t_0 \)) Delta_(h_(t_0)) lambda \( x_0 \, t_0 \) . $ <ell:volume-viscosity>]

 Thus $cal(L)$ satisfies this inequality in the lower viscosity sense on $M times \( 0 \, T \)$.]
] <prop:ellipsoid-comparison>

To prove this scalar inequality, we construct simultaneous contact jets at a common base point and time and transfer them to lower tests of $v$. The transferred tests must have positive vertical Levi blocks, as required by Proposition 14. We first construct a support for the weighted sum of the contact values, then obtain simultaneous contacts and add their Schur-complement inequalities.

=== 6.2 A product support with positive vertical Levi form <a-product-support-with-positive-vertical-levi-form>

Fix a smooth lower test $lambda$ of $cal(L)$ at $\( x_0 \, t_0 \)$, and choose the normalized contact list in that fiber. Allow the columns to vary independently, and set

#[#set math.equation(numbering: n => "(6.6)")
 $ M_c = \( sqrt(alpha_1) xi_1 \, dots.h \, sqrt(alpha_m) xi_m \) \, #h(2em) A = M_c M_c^(*) . $ <ell:rectangular-matrix>]

Near the original tuple $M_0$, the matrix $M_c$ has rank $n$. Let $Pi \( M_c \)$ be its row plane in $"Gr" \( n \, m \)$. For every nearby $\( x \, t \)$ and every full-rank tuple,

#[#set math.equation(numbering: n => "(6.7)")
 $ sum_i alpha_i v \( x \, xi_i \, t \) gt.eq "tr" \( B \( x \, t \) A \) gt.eq n + cal(L) \( x \, t \) + log det A . $ <ell:product-support>]

Indeed apply $a gt.eq 1 + log a$ to the positive eigenvalues of $B^(1 \/ 2) A B^(1 \/ 2)$. Equality in the second inequality holds exactly when $B^(1 \/ 2) A B^(1 \/ 2) = I$.

Here is the Levi calculation that will control each separate fiber. For a full-rank complex $n times m$ matrix $M$, put $A = M M^(*)$. For a matrix variation $Z$, differentiating along $M + z Z$ gives

#[#set math.equation(numbering: n => "(6.8)")
 $ partial macron(partial) log det \( M M^(*) \) \[ Z \, macron(Z) \] & = "tr" \( A^(- 1) Z Z^(*) \) - "tr" \( A^(- 1) Z M^(*) A^(- 1) M Z^(*) \)\
 & = "tr" #scale(x: 120%, y: 120%)[\(] A^(- 1) Z \( I - M^(*) A^(- 1) M \) Z^(*) #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $ <ell:rectangular-levi>]

The middle factor in the final expression is an orthogonal projection. This form is the pullback by $Pi$ of the Grassmannian form induced by the Plücker embedding. In particular, for a variation $V_i$ in the $i$th unweighted column alone,

#[#set math.equation(numbering: n => "(6.9)")
 $ partial macron(partial)_(xi_i) log det A \[ V_i \, macron(V)_i \] = alpha_i #scale(x: 120%, y: 120%)[\(] 1 - alpha_i xi_i^(*) A^(- 1) xi_i #scale(x: 120%, y: 120%)[\)] V_i^(*) A^(- 1) V_i . $ <ell:single-column>]

At any tuple with $A = I$ and $\| xi_i \| = 1$, the form after division by $alpha_i$ is therefore $\( 1 - alpha_i \) I$. Repeating the contact columns leaves their matrix resolution unchanged and makes these normalized vertical forms as close to $I$ as needed.

Subtracting a small multiple of $\( \| x - x_0 \|^2 + \| t - t_0 \|^2 \)^2$ from $lambda$ makes its contact strict on a compact coordinate cylinder without changing its time derivative or spatial Levi form there. Choose a smooth nonnegative function $eta$ on $"Gr" \( n \, m \)$, vanishing only at $Pi \( M_0 \)$, and scale it so that

#[#set math.equation(numbering: n => "(6.10)")
 $ partial macron(partial) \( eta compose Pi \) lt.eq partial macron(partial) log det A . $ <ell:grassmann-penalty>]

Such a function exists: the squared Euclidean distance from the orthogonal projector of a plane to the projector of $Pi \( M_0 \)$ is smooth and vanishes at that plane alone, and its Levi form is bounded above by a constant times the positive Grassmannian metric. Fix $0 < theta < 1$, and use the smooth support

#[#set math.equation(numbering: n => "(6.11)")
 $ g_theta \( x \, t \, xi_1 \, dots.h \, xi_m \) = n + lambda \( x \, t \) + log det A - theta eta \( Pi \) . $ <ell:localized-support>]

The difference between the left side of (6.7) and $g_theta$ is nonnegative. At equality, strictness forces $\( x \, t \) = \( x_0 \, t_0 \)$, the trace inequality forces $A = I$, and the penalty forces $Pi = Pi \( M_0 \)$. Thus $M_c = U M_0$ for a unitary $U in U \( n \)$. In particular each unweighted column still has norm one. Equality also requires each column to remain a contact of $v$. The equality set is therefore a compact #emph[subset] of this unitary orbit. It is nonempty, since it contains the original contact tuple.

Choose a bounded open neighborhood $O$ containing this equality set, with compact closure in the base-time cylinder and in the full-rank matrix locus. Its boundary avoids the equality set. Lower semicontinuity gives a positive gap on $partial O$ between the sum and its support. All columns on $overline(O)$, and their small neighborhoods, lie in one bounded cotangent-coordinate region.

=== 6.3 Simultaneous contacts with a common base <simultaneous-contacts-with-a-common-base>

We use Alexandrov’s almost-everywhere second-order differentiability theorem [1], in the form of [15] Appendix A, Theorem A.2. The contact-set and translated-test arguments below follow the Jensen and inf-convolution framework of [15] Appendix A, Lemmas A.3–A.5. We give the local details that retain one shared base and time and introduce no negative error in the vertical Levi form.

Use the real coordinate vector $q = \( Re x \, Im x \, t \, Re xi \, Im xi \)$ and define, with sources restricted to a fixed slightly larger compact coordinate region,

#[#set math.equation(numbering: n => "(6.12)")
 $ v^kappa \( q \) = inf_z {v \( z \) + frac(\| q - z \|^2, 2 kappa)} . $ <ell:inf-convolution>]

The infimum is attained. On the region used here, $v^kappa lt.eq v$ and any minimizing source satisfies $\| z - q \| lt.eq C sqrt(kappa)$, by the local upper bound and nonnegativity in (6.1). Sources are consequently interior for small $kappa$. Moreover,

#[#set math.equation(numbering: n => "(6.13)")
 $ q_j arrow.r q \, quad kappa_j arrow.b 0 quad arrow.r.double quad liminf_j v^(kappa_j) \( q_j \) gt.eq v \( q \) . $ <ell:epigraph-limit>]

This follows by applying lower semicontinuity to minimizing sources. The function $v^kappa \( q \) - \| q \|^2 \/ \( 2 kappa \)$ is concave, being an infimum of affine functions. Thus $v^kappa$ is semiconcave and has a full real second-order expansion almost everywhere.

Let $Q = \( x \, t \, xi_1 \, dots.h \, xi_m \)$ denote the product coordinates, understood as real coordinates when differentiating in time, and put

$ f_kappa \( Q \) = sum_i alpha_i v^kappa \( x \, xi_i \, t \) - g_theta \( Q \) . $

This function is semiconcave. The shared variables $x \, t$ have not been duplicated. By (6.13), the positive boundary gap on $O$ persists for all sufficiently small $kappa$, whereas $f_kappa lt.eq 0$ at the original equality tuple. For any sequence $delta_kappa arrow.b 0$, all minima of $f_kappa \( Q \) - p dot.op Q$ on $overline(O)$, $\| p \| lt.eq delta_kappa$, are interior for small $kappa$. Any limit of such minimizing points lies in the original equality set: the minimum values have upper limit at most zero, and (6.13) gives the reverse inequality at each limit.

For completeness, these contacts form a set of positive Lebesgue measure for each fixed small $kappa$ and $delta_kappa > 0$. Let $E_kappa$ be the set of minimizers for all slopes in that closed ball. Continuity of $f_kappa$ and the boundary gap make $E_kappa$ a compact subset of $O$. At a contact, its supporting lower affine function and semiconcavity imply differentiability, with $D f_kappa = p$. If $x \, y in E_kappa$ are close and $C_kappa$ is a local semiconcavity constant, then

$ 0 lt.eq f_kappa \( y \) - f_kappa \( x \) - D f_kappa \( x \) dot.op \( y - x \) lt.eq 1 / 2 C_kappa \| x - y \|^2 . $

Combining the lower support at $x$ with the upper quadratic bound based at $y$, evaluated at $y + h$, gives

$ \( D f_kappa \( x \) - D f_kappa \( y \) \) dot.op h lt.eq 1 / 2 C_kappa #scale(x: 120%, y: 120%)[\(] \| x - y \|^2 + \| h \|^2 #scale(x: 120%, y: 120%)[\)] . $

Choose $h$ of length $\| x - y \|$ in the direction of the gradient difference. This proves that the gradient restricted to the contact set is locally Lipschitz. Its image contains the entire slope ball, so that contact set cannot have measure zero. Compact interior localization makes the preceding argument valid in finitely many coordinate balls. Notice that no strictifying quadratic has been added to $g_theta$.

For each $i$, the exceptional set where $v^kappa$ lacks an Alexandrov expansion is null. The projection

$ Q mapsto \( x \, t \, xi_i \) $

is a surjective real linear map; its inverse image of that exceptional set is null by Fubini. A finite union remains null. Hence we may choose a contact $Q_kappa in E_kappa$ at which every factor has a full real second-order expansion simultaneously. Write

$ a_i^kappa = partial_t v^kappa \( x_kappa \, xi_i^kappa \, t_kappa \) \, #h(2em) W_i^kappa = partial macron(partial)_(x \, xi) v^kappa \( x_kappa \, xi_i^kappa \, t_kappa \) . $

Differentiating the common-base minimum gives

#[#set math.equation(numbering: n => "(6.14)")
 $ sum_i alpha_i a_i^kappa = partial_t lambda \( x_kappa \, t_kappa \) + \( p_kappa \)_t \, #h(2em) \| p_kappa \| lt.eq delta_kappa \, $ <ell:time-sum>]

and, for every complex $X \, V_1 \, dots.h \, V_m$,

#[#set math.equation(numbering: n => "(6.15)")
 $ sum_i alpha_i W_i^kappa \[ \( X \, V_i \) \, overline(\( X \, V_i \)) \] gt.eq partial macron(partial)_x lambda \[ X \, macron(X) \] + \( 1 - theta \) partial macron(partial) log det A \[ V \, macron(V) \] . $ <ell:aggregate-levi>]

Here the forms on the right are evaluated at $Q_kappa$. To justify the passage from real to complex Hessians, if $H$ is a real Hessian and $Z$ is a complex spatial direction, its Levi quadratic form is

$ 1 / 4 #scale(x: 120%, y: 120%)[\(] H \[ Z_(bb(R)) \, Z_(bb(R)) \] + H \[ J Z_(bb(R)) \, J Z_(bb(R)) \] #scale(x: 120%, y: 120%)[\)] . $

Apply the real Hessian inequality in both directions, with time component zero. The linear perturbation has zero Hessian, and (6.10) gives (6.15). Thus this is an inequality of complex Levi forms, rather than an identification of real and complex Schur complements.

Let $C_i^kappa$ denote the vertical block of $W_i^kappa$. Take $X = 0$ and vary only the $i$th column in (6.15). Equation (6.9) and convergence to the compact equality set give

#[#set math.equation(numbering: n => "(6.16)")
 $ C_i^kappa gt.eq #scale(x: 120%, y: 120%)[\(] \( 1 - theta \) \( 1 - max_j alpha_j \) - o \( 1 \) #scale(x: 120%, y: 120%)[\)] I . $ <ell:vertical-positive>]

The $o \( 1 \)$ tends to zero as $kappa arrow.b 0$, with the list and $theta$ fixed. Replicate the list beforehand so that $max_i alpha_i < 1$; these vertical blocks are then uniformly positive.

We finally transfer these jets to the original envelope. Fix $kappa$ and the chosen contact, and let $z_i$ be a minimizing source in (6.12) for $q_i = \( x_kappa \, t_kappa \, xi_i^kappa \)$. Subtract $epsilon \| h \|^2$ from the real second-order expansion of $v^kappa \( q_i + h \)$. For every $epsilon > 0$ this gives a smooth quadratic lower test $phi.alt_(i \, epsilon)$ in a sufficiently small neighborhood of $q_i$. Since

$ v^kappa \( q_i + h \) lt.eq v \( z_i + h \) + frac(\| q_i - z_i \|^2, 2 kappa) \, $

the translated function

#[#set math.equation(numbering: n => "(6.17)")
 $ psi_(i \, epsilon) \( z_i + h \) = phi.alt_(i \, epsilon) \( q_i + h \) - frac(\| q_i - z_i \|^2, 2 kappa) $ <ell:translated-test>]

is a lower test of $v$ at $z_i$. Translation preserves its time derivative $a_i^kappa$ and its Levi form $W_i^kappa - epsilon I$.

Apply Proposition 14. Its canonical cotangent contraction has constant coefficients in these coordinates, so the possibly different source base points and times cause no coefficient error. If $C_i^kappa gt.eq c I$ and $0 < epsilon < c \/ 2$, it supplies $K_(i \, epsilon) gt.eq 0$ with

$ K_(i \, epsilon) gt.eq "Schur" \( W_i^kappa - epsilon I \) \, #h(2em) a_i^kappa gt.eq "tr" #scale(x: 120%, y: 120%)[\(] \( C_i^kappa - epsilon I \)^(sans(T)) K_(i \, epsilon) #scale(x: 120%, y: 120%)[\)] gt.eq \( c - epsilon \) "tr" K_(i \, epsilon) . $

In particular $a_i^kappa gt.eq 0$. At this fixed contact, let $epsilon arrow.b 0$ first. The displayed trace bound gives a convergent subsequence, and continuity of the Schur complement on positive vertical blocks yields matrices $K_i^kappa$ satisfying

#[#set math.equation(numbering: n => "(6.18)")
 $ K_i^kappa gt.eq 0 \, #h(2em) K_i^kappa gt.eq "Schur" \( W_i^kappa \) \, #h(2em) a_i^kappa gt.eq "tr" #scale(x: 120%, y: 120%)[\(] \( C_i^kappa \)^(sans(T)) K_i^kappa #scale(x: 120%, y: 120%)[\)] . $ <ell:transferred-inequality>]

The temporary Hessian decrease has thus disappeared before taking any limit in $kappa$. In particular it cannot be magnified by a later vertical minimization.

=== 6.4 The scalar volume inequality <the-scalar-volume-inequality>

#proof[
  #emph[Completion of the proof of Proposition 18.] Use the preceding construction at the lower contact, with $B = I$. Set $cal(K)_kappa = sum_i alpha_i K_i^kappa$. We first show
  #[#set math.equation(numbering: n => "(6.19)")
   $ cal(K)_kappa gt.eq 0 \, #h(2em) cal(K)_kappa gt.eq partial macron(partial)_x lambda \( x_kappa \, t_kappa \) . $ <ell:schur-aggregate>]
  For a Hermitian form with blocks $W = mat(delim: "(", H, D; D^(*), C)$, $C > 0$, completing the square gives
  $ W \[ \( X \, V \) \, overline(\( X \, V \)) \] = X^(*) \( H - D C^(- 1) D^(*) \) X + \( V + C^(- 1) D^(*) X \)^(*) C \( V + C^(- 1) D^(*) X \) . $
  Its minimum over the complex vertical vector $V$ is $"Schur" \( W \) \[ X \, macron(X) \]$. The extra term on the right of (6.15) is nonnegative by (6.8). Minimizing the left side independently over every $V_i$ therefore proves
  $ sum_i alpha_i "Schur" \( W_i^kappa \) gt.eq partial macron(partial)_x lambda \( x_kappa \, t_kappa \) . $
  Equation (6.18) gives (6.19).
  Write $c_(theta \, alpha) = \( 1 - theta \) \( 1 - max_i alpha_i \) > 0$. Equations (6.14), (6.16), and (6.18) imply
  #[#set math.equation(numbering: n => "(6.20)")
   $ partial_t lambda \( x_kappa \, t_kappa \) + \( p_kappa \)_t gt.eq #scale(x: 120%, y: 120%)[\(] c_(theta \, alpha) - o \( 1 \) #scale(x: 120%, y: 120%)[\)] "tr" cal(K)_kappa . $ <ell:aggregate-trace>]
  The positive aggregate matrices are bounded. Let $kappa arrow.b 0$ and pass to a subsequence to obtain a matrix $cal(K)_(theta \, alpha)$ such that
  $ cal(K)_(theta \, alpha) gt.eq 0 \, #h(2em) cal(K)_(theta \, alpha) gt.eq partial macron(partial)_x lambda \( x_0 \, t_0 \) \, #h(2em) partial_t lambda \( x_0 \, t_0 \) gt.eq c_(theta \, alpha) "tr" cal(K)_(theta \, alpha) . $
  Now let $theta arrow.b 0$ and repeat the construction with increasingly replicated lists, so that $max_i alpha_i arrow.b 0$. The aggregate matrices still act on the fixed $n$-dimensional horizontal space and have uniformly bounded trace. Another subsequence gives
  #[#set math.equation(numbering: n => "(6.21)")
   $ cal(K) gt.eq 0 \, #h(2em) cal(K) gt.eq partial macron(partial)_x lambda \( x_0 \, t_0 \) \, #h(2em) partial_t lambda \( x_0 \, t_0 \) gt.eq "tr" cal(K) . $ <ell:limiting-majorant>]
  This also specifies the parameter order: fix the list and $theta$; regularize and select simultaneous contacts; remove the lower-test Hessian decrease at each fixed contact; let $kappa$ and the slopes tend to zero; finally let $theta$ and the maximum weight tend to zero. No bound uniform in the number of individual contact jets is needed.
  At the normalized point $B = I lt.eq b_(t_0)$, and $F_0 = log det b_(t_0)$. All eigenvalues of $b_(t_0)$ are at least one, so each is at most their product. Consequently
  $ 0 < e^(- F_0) b_(t_0) lt.eq I . $
  Using the two matrix inequalities in (6.21), in the indicated order, gives
  $ partial_t lambda gt.eq "tr" cal(K) gt.eq e^(- F_0) "tr" \( b_(t_0)^(sans(T)) cal(K) \) gt.eq e^(- F_0) "tr" \( b_(t_0)^(sans(T)) partial macron(partial)_x lambda \) = e^(- F_0) Delta_(h_(t_0)) lambda . $
  The positivity of $cal(K)$ justifies the middle comparison even when $partial macron(partial)_x lambda$ is indefinite. This proves (6.5). ◻
]

=== 6.5 Equality of the envelope and the norm <equality-of-the-envelope-and-the-norm>

#thm([Theorem 6.3.])[
  #emph[For the flow in Theorem 4, the function 
$ \( x \, xi \, w \) mapsto N \( x \, xi \, e^(w + macron(w)) \) $

 is plurisubharmonic on $T^(* \( 1 \, 0 \)) M times bb(C)$. For every finite $T$, its disc envelope satisfies $v = N$ on $T^(* \( 1 \, 0 \)) M times \( 0 \, T \)$.]
] <thm:joint-positivity>

#proof[
  In any holomorphic base coordinates let $ell = log det b_t$. The flow equation and the Ricci-form identity give
  $ partial_t ell = R_(h_t) \, #h(2em) partial macron(partial)_x ell = "Ric" \( h_t \) \, #h(2em) Delta_(h_t) ell = R_(h_t) . $
  If $phi$ is an upper test of $F_0 = ell - cal(L)$, then $lambda = ell - phi$ is a lower test of $cal(L)$. Proposition 18 therefore says
  #[#set math.equation(numbering: n => "(6.22)")
   $ partial_t phi lt.eq e^(- F_0) Delta_(h_t) phi + \( 1 - e^(- F_0) \) R_(h_t) $ <ell:scalar-gap-equation>]
  at contact. The coefficient $F_0$ there equals the test value $phi$. By (6.3), $F_0$ is upper semicontinuous, locally bounded, and between zero and $rho$. Since $rho$ is smooth and vanishes initially, extending $F_0$ by zero at $t = 0$ preserves upper semicontinuity. Apply Proposition 6 to (6.22) on each interval $\[ 0 \, T' \]$ with $T' < T$. Since $T'$ is arbitrary, $F_0 = 0$ for every $t < T$. Its proof does not require completeness of $h_t$ at positive time.
  We have $B lt.eq b_t$ and $det B = det b_t$. The positive matrix $b_t^(- 1 \/ 2) B b_t^(- 1 \/ 2) lt.eq I$ has determinant one; every one of its eigenvalues is therefore one. Hence $B = b_t$, and feasibility and (6.1) imply
  $ N \( x \, xi \, t \) = xi^(*) B xi lt.eq v \( x \, xi \, t \) lt.eq N \( x \, xi \, t \) . $
  This proves $v = N$.
  For the raw disc infimum $v^(upright("raw"))$ of (4.1), we have $v lt.eq v^(upright("raw"))$, while constant discs give $v^(upright("raw")) lt.eq N$. Thus $v^(upright("raw")) = N$ too, so $N$ obeys the submean inequality for every admissible disc, not merely for regularized centers. Given a holomorphic disc $\( f \, W \)$ in $Y times bb(C)$, put $t_0 = e^(W \( 0 \) + overline(W \( 0 \)))$ and $w = W - W \( 0 \)$. Choose $T$ larger than the maximum of $e^(W + macron(W))$ on the closed disc. The defining disc inequality then gives
  $ N \( f \( 0 \) \, t_0 \) lt.eq frac(1, 2 pi) integral_0^(2 pi) N #scale(x: 120%, y: 120%)[\(] f \( e^(i theta.alt) \) \, e^(W \( e^(i theta.alt) \) + overline(W \( e^(i theta.alt) \))) #scale(x: 120%, y: 120%)[\)] thin d theta.alt . $
  It suffices to use discs smooth past their boundary, including all sufficiently small coordinate discs. Since the joint norm is smooth, these submean inequalities are precisely its plurisubharmonicity. The horizon $T$ was arbitrary. ◻
]

== 7 Harnack inequalities and shrinking holomorphic charts <sec:charts>

The joint positivity of the cotangent norm will now give an exhausting system of inverse charts with quantitative transition estimates. We first prove positive-time completeness and construct uniform local charts. These charts may have several sheets, so continuing their inverse germs across compact sets also requires a topological step: we will contract loops before constructing single-valued inverse branches. For the quantitative estimates, volume loss must force contraction in every direction, with an exponent common to all compact sets. The local chart and path-lifting constructions have antecedents in Chau–Tam [8] Section 2[9] Sections 2–3. Throughout this Section, a metric on a cotangent space is the Hermitian dual metric, including the transpose in its matrix representation.

=== 7.1 From joint positivity to completeness <from-joint-positivity-to-completeness>

The differential Harnack inequalities for Kähler–Ricci flow have their classical antecedent in Cao’s work [6]. Here we derive the needed inequalities from joint positivity before using them to prove completeness of the evolving metric.

#thm([Proposition 7.1.])[
  #emph[The flow of Theorem 4 has nonnegative holomorphic bisectional curvature and is complete at every positive time. Its Ricci tensor is positive definite. Writing $A = "Ric" \( h_t \)$ and $R = "tr"_(h_t) A$, one has, in fixed holomorphic coordinates, 
#[#set math.equation(numbering: n => "(7.1)")
 $ A_t + A h_t^(- 1) A + t^(- 1) A & gt.eq 0 \,\
R_t + t^(- 1) R + 2 "Re" partial_X R + A \( X \, overline(X) \) & gt.eq 0 #h(2em) \( X in T^(1 \, 0) M \) . $ <chart:matrix-harnack>]

 In particular $h_(t') lt.eq h_t$ for $t' gt.eq t$, $R \( o \, t \) lt.eq C$ for $t gt.eq 0$, and 
#[#set math.equation(numbering: n => "(7.2)")
 $ R \( x \, t \) lt.eq R \( y \, t' \) t' / t exp #h(-0.16667em) (frac(C "dist"_(h_t) \( x \, y \)^2, t' - t)) #h(2em) \( 0 < t < t' \) . $ <chart:integrated-harnack>]

 On each fixed compact set, $h_t lt.eq C_K t^(- a_K) g$ for $t gt.eq 1$, with $a_K > 0$.]
] <prop:harnack-completeness>

#proof[
  By Theorem 19, the dual squared norm of the tangent metric pulled back to $\( x \, w \)$, where $t = e^(w + macron(w))$, is plurisubharmonic. Completing the square in the free first derivative of a cotangent section identifies this assertion with Griffiths nonnegativity of the pulled-back tangent metric. At a spatially Kähler-normal point its curvature blocks are
  $ Theta_(i macron(j) thin alpha macron(beta)) = "Rm"_(i macron(j) alpha macron(beta)) \, #h(2em) Theta_(w macron(j) thin alpha macron(beta)) = t nabla_(macron(j)) A_(alpha macron(beta)) \, #h(2em) Theta_(w macron(w)) = t A + t^2 \( A_t + A h_t^(- 1) A \) . $
  The spatial block gives nonnegative bisectional curvature and hence $A gt.eq 0$ and metric monotonicity. The last block gives (7.1). Trace the curvature in its fiber indices and evaluate on the spacetime direction $\( X \, t^(- 1) \)$. The identities
  $ "tr"_(h_t) A_t = R_t - \| A \|_(h_t)^2 \, #h(2em) "tr"_(h_t) \( A h_t^(- 1) A \) = \| A \|_(h_t)^2 \, #h(2em) "tr"_(h_t) nabla_X A = partial_X R $
  give (7.1).
  At a fixed point choose a moving unitary frame satisfying $E_t = 1 / 2 A^(\#) E$, where $A^(\#) = h_t^(- 1) A$. Differentiation shows that
  $ frac(d, d t) #scale(x: 120%, y: 120%)[\[] t A \( E \, overline(E) \) #scale(x: 120%, y: 120%)[\]] = t #scale(x: 120%, y: 120%)[\(] A_t + A h_t^(- 1) A + t^(- 1) A #scale(x: 120%, y: 120%)[\)] \( E \, overline(E) \) gt.eq 0 . $
  Initial strict bisectional positivity and local smooth convergence give $A > 0$ at sufficiently small positive times on any prescribed compact set. The preceding inequality propagates this positivity and gives $t A gt.eq a_K h_t$ there for $t gt.eq 1$, after changing the compact constant. Integrating $partial_t h_t = - A$ proves the asserted power contraction. Applied to the trace, the same inequality gives monotonicity of $t R \( o \, t \)$. The linear bound for $rho \( o \, t \)$ in Theorem 4 implies, for $t gt.eq 1$,
  $ t R \( o \, t \) log 2 lt.eq integral_t^(2 t) R \( o \, v \) thin d v = rho \( o \, 2 t \) - rho \( o \, t \) lt.eq C \( 1 + 2 t \) . $
  Smoothness on compact time intervals supplies the remaining basepoint bound.
  For clarity, the next integration precedes the completeness proof. Choose a piecewise smooth path from $x$ to $y$ whose $h_t$ length is within $epsilon$ of their distance, and run it at constant $h_t$ speed on $\[ t \, t' \]$. Such paths exist by the definition of the distance. Along this path, (7.1), divided by $R > 0$, and $A lt.eq R h_v$ give
  $ frac(d, d v) log R \( gamma \( v \) \, v \) gt.eq - 1 / v - C \| dot(gamma) \( v \) \|_(h_v)^2 . $
  Since $h_v lt.eq h_t$, its energy is at most $\( "dist"_(h_t) \( x \, y \) + epsilon \)^2 \/ \( t' - t \)$. Integrating and then letting $epsilon arrow.b 0$ proves (7.2) without using a minimizing geodesic or completeness of $h_t$.
  Fix $T < oo$. Put $d = "dist"_(h_t) \( x \, o \)$ and apply (7.2) with $y = o$ and $t' = t + 1 + d^2$. The basepoint bound gives
  #[#set math.equation(numbering: n => "(7.3)")
   $ R \( x \, t \) lt.eq frac(C_T \( 1 + d^2 \), t) \, #h(2em) 0 < t lt.eq T . $ <chart:quadratic-curvature>]
  Let $D_L = B_g \( o \, L \)$, and let $l_L \( t \)$ be the infimum of lengths of paths from $o$ to first exit from $D_L$, measured in $h_t$. The initial metric is complete, so $overline(D)_L$ is compact. There is a minimizing segment realizing $l_L \( t \)$, contained in $overline(D)_L$, and every initial part of it minimizes to its endpoint. On this segment the distance in (7.3) is at most $l_L \( t \)$.
  Write $l = l_L \( t \)$. In the summed real index forms use perpendicular parallel fields times a cutoff which rises from zero to one on an endpoint interval of width
  $ a = min (l / 2 \, frac(sqrt(t), 1 + l)) . $
  If $l gt.eq 2 sqrt(t) \/ \( 1 + l \)$, the index inequality and the two endpoint curvature bounds imply
  $ integral_0^l "Ric"_(h_t) \( dot(gamma) \, dot(gamma) \) thin d r lt.eq C / a + frac(C_T \( 1 + l^2 \) a, t) lt.eq frac(C_T \( 1 + l \), sqrt(t)) . $
  Here and below fixed real-versus-complex normalization factors are included in $C_T$. If $l < 2 sqrt(t) \/ \( 1 + l \)$, use (7.3) on the whole segment to obtain the same bound. The function $l_L$ is locally Lipschitz in time, since the metrics are smoothly equivalent on the compact closure. At a differentiability time, compare a current minimizing segment with its length at a slightly earlier time. The metric variation formula therefore gives
  $ l'_L \( t \) gt.eq - frac(C_T \( 1 + l_L \( t \) \), sqrt(t)) quad upright("for almost every ") t in \( 0 \, T \] . $
  Consequently
  #[#set math.equation(numbering: n => "(7.4)")
   $ 1 + l_L \( t \) gt.eq \( 1 + L \) e^(- 2 C_T sqrt(t)) . $ <chart:exit-distance>]
  As $L arrow.r oo$, every divergent path has infinite $h_t$ length. Equivalently, each finite $h_t$ ball is trapped in a compact initial ball; its closure is compact by local equivalence of the smooth metrics. This proves completeness. ◻
]

#thm([Lemma 7.2.])[
  (Uniform immersed charts).  #emph[For every fixed compact $K subset M$, there are $r_K \, c_K \, C_K > 0$ such that, for sufficiently large $t$ and every $p in K$, there is a holomorphic local biholomorphism 
$ Phi : B_(bb(C)^n) \( r_K \) arrow.r M \, #h(2em) Phi \( 0 \) = p \, #h(2em) d Phi \( 0 \) upright(" unitary for ") h_t \, $

 with $c_K g_(upright("eucl")) lt.eq Phi^(*) h_t lt.eq C_K g_(upright("eucl"))$. The pullback metrics have bounds of every fixed derivative order on smaller balls. The corresponding local smooth compactness statement holds for rescaled flows whenever curvature is uniformly bounded on fixed-radius moving balls during a fixed two-sided time interval.]
] <chart:local-charts>

#proof[
  For $t gt.eq 1$, (7.2), with a fixed future time increment, bounds $R$ on every fixed-radius $h_t$ ball about $o$. Nonnegative bisectional curvature gives $\| "Rm" \| lt.eq C_n R$. Centers in $K$ are handled by a compact family of paths from $o$: their $h_t$ lengths are bounded, so balls about these centers lie in a bounded-radius ball about $o$.
  To apply local curvature derivative estimates, take a ball for the earliest time of a short time interval. It remains inside the corresponding larger later-time balls because metrics decrease. The curvature bound gives metric equivalence on this fixed region throughout the interval. A path measured in the later metric cannot first exit the earlier ball at arbitrarily small length; thus a smaller later-time ball is contained in this region. Local Ricci-flow derivative estimates [49][31] Theorem 1.4 now give all curvature derivatives on smaller balls and inner time intervals. Here the estimate is applied on shifted sufficiently short cylinders, with a time buffer before each observation slice. Metric equivalence keeps the initial balls required by the local estimate compactly inside the fixed region. This construction applies verbatim after a fixed rescaling.
  Here is why no injectivity-radius hypothesis enters the chart statement; compare [8] Lemma 2.2. Pull back by the exponential map on a small tangent ball. The curvature bound excludes conjugate points at this scale, although the exponential map may identify distinct points. Jacobi-field estimates and their differentiated equations give uniformly controlled pullback metrics and parallel complex structures, with a fixed Euclidean lower metric bound. In particular any sequence has a smoothly convergent subsequence on a smaller tangent ball. The identities $J^2 = - "Id"$ and $N_J = 0$ pass to the smooth limit. The Newlander–Nirenberg theorem supplies local holomorphic coordinates for the limit complex structure [42] [27] Theorem 1.1. In the smooth case their components satisfy the smooth elliptic equation $macron(partial)_J^(*) macron(partial)_J f = 0$, so interior elliptic regularity makes these coordinates smooth. Restrict them to a still smaller ball. Their squared radius is uniformly strictly plurisubharmonic for all sufficiently close complex structures. Solve the small $macron(partial)$ errors of these coordinate functions on a smaller strictly pseudoconvex coordinate ball. One can use the weighted $L^2$ estimate [28,19], viewing scalar functions as top forms with values in the anticanonical bundle. Give this bundle the metric induced by the original uniformly controlled pullback metric. A fixed large multiple of the squared radius pays its uniformly bounded curvature, and the strictly plurisubharmonic exhaustion of the ball supplies an auxiliary complete Kähler metric. The source errors tend to zero smoothly, so the correcting functions tend to zero in local $L^2$. We first justify smoothness of each correction, then obtain uniform estimates on a fixed smaller real ball. Write the corrections as $u_j$ and their equations as $macron(partial)_(J_j) u_j = eta_j$. For each index separately, the existing complex structure $J_j$ has smooth holomorphic coordinates, with no uniform radius asserted. In those coordinates,
  $ Delta_(upright("eucl")) u_j = 4 sum_a partial_(z_a) eta_(j \, a) $
  is an identity of distributions with smooth right side. A compactly supported smooth extension of the right side, convolved with the Euclidean fundamental solution, gives a smooth particular solution on a smaller ball. The remaining harmonic distribution is smooth: its mollifications satisfy the mean-value identity against a fixed smooth radial unit-mass kernel, and passage to the distributional limit identifies the distribution with its smooth convolution by that kernel. Thus each $u_j$ is qualitatively smooth.
  For uniform estimates return to the fixed real ball and use $P_j = macron(partial)_(J_j)^(*) macron(partial)_(J_j)$ with the original controlled pullback Kähler metric, rather than the auxiliary weighted metric. The scalar Kähler identity identifies $P_j$, up to a fixed sign and normalization, with the real Laplace–Beltrami operator. Its coefficients have uniform bounds of every fixed order and a uniform ellipticity lower bound. Moreover $P_j u_j = macron(partial)_(J_j)^(*) eta_j = : F_j$ tends smoothly to zero. Testing this equation with $chi^2 overline(u_j)$ and absorbing the cross term gives the Caccioppoli estimate
  $ integral chi^2 \| nabla u_j \|^2 lt.eq C integral_("supp" chi) \( \| u_j \|^2 + \| F_j \|^2 \) $
  for a fixed interior cutoff. The qualitative smoothness just proved legitimizes this test. Uniform metric equivalence gives a $W^(1 \, 2)$ bound in the fixed real coordinates. Interior elliptic estimates [23] Theorems 8.8 and 8.10, on successively smaller fixed balls, now yield
  $ parallel u_j parallel_(H^(m + 2) \( B' \)) lt.eq C_m #scale(x: 120%, y: 120%)[\(] parallel u_j parallel_(L^2 \( B \)) + parallel F_j parallel_(H^m \( B \)) #scale(x: 120%, y: 120%)[\)] . $
  Choose $m + 2 > k + n$ and use Sobolev embedding in real dimension $2 n$ [21] Section 5.6.3, Theorem 6. This proves convergence to zero in every fixed $C^k$ norm on smaller balls. The corrected coordinate maps are therefore $C^1$ close to the limiting coordinate map. On a sufficiently small fixed ball their derivatives are uniformly close to its invertible center derivative. They are injective on that ball, and their images contain a common ball about their center values, by the quantitative inverse function theorem. Subtract the coordinate center values and invert on this common ball. Composing with the exponential parametrization and making a bounded linear normalization, with one further fixed reduction of radius, gives the required maps into $M$ with unitary center derivative. If no common radius and bounds existed for the original family, a sequence witnessing their failure would have a smoothly convergent subsequence of pullbacks. The construction just given supplies common charts on that subsequence, a contradiction. This proves the uniform chart assertion.
  For a flow, use the exponential parametrization at its central time as a fixed parametrization. The curvature bound controls the time derivative of the metric; the first Ricci derivative controls that of its connection. Induction using the higher covariant derivative estimates gives ordinary space-time derivative bounds for the metrics and their parallel complex structures. Arzelà–Ascoli on smaller balls gives the claimed local smooth limits. ◻
]

=== 7.2 Total distortion in the initial metric <total-distortion-in-the-initial-metric>

In an $h_t$-unitary chart at $x$, the product of the initial-metric singular lengths is $e^(rho \( x \, t \) \/ 2)$. This determinant identity alone allows the growth to occur in only some directions. The next lemma bounds the greatest singular length by a fixed power of the least, so volume loss will force contraction in every direction.

#thm([Lemma 7.3.])[
  (Static distortion).  #emph[Fix $r \, c > 0$ and a compact set $K subset M$. Suppose $Phi : B_(bb(C)^n) \( r \) arrow.r M$ is a holomorphic local biholomorphism, $Phi \( 0 \) in K$, and $tilde(g) = Phi^(*) g gt.eq c g_(upright("eucl"))$. Let $A$ and $B$ be the least and greatest singular lengths of $d Phi \( 0 \)$, using the Euclidean metric in the domain and $g$ in the target. There are constants depending only on $K \, r \, c$ and the initial geometry on a compact neighborhood of $K$ such that 
#[#set math.equation(numbering: n => "(7.5)")
 $ B lt.eq C \( 1 + A \)^C . $ <chart:static-distortion>]

 In particular these constants are independent of the particular chart and its total distortion.]
] <lem:static-distortion>

#proof[
  We construct a plurisubharmonic weight whose upper bound is of order $log \( 1 + A \)$ and whose Levi form is strict near the center. Its moving-ball definition will also give a nonnegative lower bound on the support of the weighted $macron(partial)$ construction. These bounds make the extension estimate independent of the total distortion. We then extend a local function whose differential detects $B$; its $L^2$ bound gives the required polynomial bound.
  Choose a constant holomorphic covector $alpha = d f$ with $\| alpha \|_(upright("eucl")) = A$ and $\| alpha \|_(tilde(g)) \( 0 \) = 1$. The logarithmic dual norm
  $ psi = log \| alpha \|_(tilde(g))^2 quad upright("satisfies") quad psi \( 0 \) = 0 \, #h(2em) psi lt.eq C + 2 log A . $
  For a tangent $X$, the curvature formula for this logarithmic norm is
  $ partial macron(partial) psi \( X \, overline(X) \) = frac("Rm" \( X \, overline(X) \, v \, overline(v) \), \| v \|^2) + frac(\| D'_X alpha \|^2 \| alpha \|^2 - \| chevron.l D'_X alpha \, alpha chevron.r \|^2, \| alpha \|^4) \, $
  where $v$ is the metric dual of $alpha$ and all norms in this formula use $tilde(g)$. The second summand is nonnegative. Initial bisectional positivity therefore makes $psi$ plurisubharmonic. On any region whose target image lies in a prescribed compact neighborhood $K^(+)$ of $K$, it gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ partial macron(partial) psi gt.eq kappa tilde(g) $ <chart:strict-covector>]
  with $kappa > 0$ uniform. The normalization of $alpha$ cancels from this estimate.
  Shrink the Euclidean domain by a fixed factor. Choose $r_0 > 0$ so small that any path of $tilde(g)$ length at most $3 r_0$ starting in this smaller domain stays in $B \( r \)$; the lower metric bound makes this choice uniform. The small closed metric balls used below are compact there and their distances are attained by minimizing segments. Put
  #[#set math.equation(numbering: n => "(7.7)")
   $ Psi \( z \) = max_("dist"_(tilde(g)) \( z \, y \) lt.eq r_0) psi \( y \) . $ <chart:metric-ball-envelope>]
  This function is continuous. Compactness gives upper semicontinuity. For lower semicontinuity, move a maximizing endpoint a little towards the center along a minimizing segment; the resulting endpoint is admissible for all nearby centers and its value tends to the maximum.
  We verify the Levi inequality for this moving-ball maximum. Let $phi$ be a smooth upper test at $z$, let $y$ realize the maximum, and prescribe a nonzero complex tangent $V$ at $z$. Choose a holomorphic center germ with this derivative. If $"dist"_(tilde(g)) \( z \, y \) < r_0$, any holomorphic endpoint germ with derivative equal to the parallel translate of $V$ along a minimizing segment stays admissible for a sufficiently small parameter. Suppose instead that the constraint is active. For two real parameter directions corresponding to $V$ and $J V$, choose trial paths whose first variation fields are the parallel translates along this segment. Their first length variations vanish. The trace of their second length variations is
  $ - integral_0^(r_0) #scale(x: 120%, y: 120%)[\[] "Rm" \( T \, V^parallel \, V^parallel \, T \) + "Rm" \( T \, J V^parallel \, J V^parallel \, T \) #scale(x: 120%, y: 120%)[\]] thin d r < 0 . $
  Tangential components make no curvature contribution, and holomorphic endpoint germs have zero trace covariant acceleration, so there are no omitted trace boundary terms. The strict sign is precisely the initial bisectional sign.
  The trace inequality alone is insufficient to preserve a two-parameter length constraint. At the far endpoint we may prescribe its holomorphic second jet freely while retaining its first derivative. Changing that jet by a real tangent $W$ (regarded as a complex tangent by $J$) changes the real length Hessian by
  $ mat(delim: "(", chevron.l W \, T chevron.r, chevron.l J W \, T chevron.r; chevron.l J W \, T chevron.r, - chevron.l W \, T chevron.r) $
  at the final endpoint. Vectors in the real span of $T \, J T$ realize every trace-free symmetric matrix of size two. Choose the jet to remove the trace-free part of the length quadratic. The trace remains strictly negative; hence the full quadratic is negative definite. Smooth trial paths joining these holomorphic endpoint germs then have length less than $r_0$ for every sufficiently small nonzero parameter. The actual distance is no greater than this trial length. This proves admissibility also at an active constraint, without differentiating a possibly nonsmooth distance function.
  On either kind of admissible endpoint germ $y \( a \)$, $phi \( z \( a \) \) gt.eq Psi \( z \( a \) \) gt.eq psi \( y \( a \) \)$, with equality at $a = 0$. Taking the parameter Levi derivative proves $partial macron(partial) Psi gt.eq 0$ in upper-test sense, and thus in the plurisubharmonic sense. If $"dist"_(tilde(g)) \( 0 \, z \) < r_0 \/ 4$, all the relevant paths and endpoints map into a fixed compact $K^(+)$; applying (7.6) to the transported tangent gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ partial macron(partial) Psi gt.eq kappa tilde(g) quad upright("on ") B_(tilde(g)) \( 0 \, r_0 \/ 4 \) \, #h(2em) Psi gt.eq 0 quad upright("on ") B_(tilde(g)) \( 0 \, r_0 \) . $ <chart:strict-envelope>]
  The latter inequality uses the admissible endpoint $0$. Throughout the fixed Euclidean domain, $Psi lt.eq C + 2 log A$.
  We next specify the weighted extension, including its support. A fixed small initial holomorphic coordinate neighborhood $U$ of $p = Phi \( 0 \)$ lifts to a single sheet through $0$. Indeed its short radial paths and their short homotopies lift by local inversion of $Phi$, and their $tilde(g)$ lengths equal their initial target lengths. The lower metric bound prevents escape from the coordinate domain. Uniqueness of local lifts and the short homotopies make this an inverse branch on $U$. Choose $U$ uniformly over $p in K$, with the whole sheet inside $B_(tilde(g)) \( 0 \, r_0 \/ 4 \)$.
  In these initial target coordinates $w$, centered at $p$, choose a linear holomorphic function $ell$ whose differential has target norm one and whose pullback differential at $0$ has Euclidean norm $B$. Let $chi$ be a fixed cutoff on this sheet, equal to one near $0$ and zero near its boundary. The function $a = chi ell$, extended by zero outside the sheet, is smooth and uniformly bounded. Its source $beta = accent(partial a, ‾)$ is supported in a fixed target coordinate annulus and satisfies
  $ \| beta \|_(tilde(g)^(- 1)) lt.eq C \, #h(2em) integral_("supp" beta) d V_(upright("eucl")) lt.eq c^(- n) integral_("supp" beta) d V_(tilde(g)) lt.eq C . $
  The last integral is the volume of one initial target annulus, since the chosen sheet is injective. These constants do not contain $B$.
  On the same sheet choose a nonpositive logarithmic-pole weight $lambda$, equal to $\( n + 1 \) log \( \| w \|^2 \/ delta^2 \)$ near $0$ and cut off to zero within the strict region. Its negative Hessian is bounded by $C tilde(g)$ on the cutoff annulus, uniformly also for smooth pole regularizations. Choose a fixed large $k$ so that the weight
  $ phi_(*) = k Psi + lambda + \| z \|^2 $
  is plurisubharmonic and its Levi form dominates a positive multiple of $tilde(g)$ on $"supp" beta$. On that support, $Psi gt.eq 0$ and $lambda$ is bounded below. The scalar weighted $macron(partial)$ estimate on the fixed Euclidean ball [28][19] Theorem 5.1 and Remark 4.5 gives $accent(partial v, ‾) = beta$ with
  #[#set math.equation(numbering: n => "(7.9)")
   $ integral \| v \|^2 e^(- phi_(*)) thin d V_(upright("eucl")) lt.eq integral \| beta \|_(\( partial macron(partial) phi_(*) \)^(- 1))^2 e^(- phi_(*)) thin d V_(upright("eucl")) lt.eq C . $ <chart:weighted-extension>]
  For a smooth-weight justification, first convolve $Psi$ on a slightly larger Euclidean region and regularize the pole. For each particular smooth $tilde(g)$, the convolution scale can be chosen small enough to retain half of (7.8) on the compact support regions. The estimates just obtained are independent of that scale. Weak $L^2$ limits and Fatou’s lemma give (7.9) for the singular weight.
  The correction $v$ is holomorphic near $0$. Integrability with the pole $\| w \|^(- 2 \( n + 1 \))$ forces its constant and linear terms to vanish. Thus $a - v$ is holomorphic on the Euclidean ball and has the prescribed differential of norm $B$ at $0$. Since $lambda lt.eq 0$ and $sup Psi lt.eq C + 2 log A$, dropping the weight in (7.9) gives
  $ parallel a - v parallel_(L^2 \( d V_(upright("eucl")) \))^2 lt.eq C \( 1 + A \)^(2 k) . $
  Interior differentiation of a holomorphic function bounds its center derivative by this norm, proving (7.5). ◻
]

=== 7.3 The volume clock and selected Ricci windows <the-volume-clock-and-selected-ricci-windows>

The letter $s$ now denotes the volume clock, rather than the time variable used in the disc envelope. Set

#[#set math.equation(numbering: n => "(7.10)")
 $ tau = log t \, #h(2em) s = rho \( o \, t \) \, #h(2em) q \( s \) = frac(d s, d tau) = t R \( o \, t \) . $ <chart:clocks>]

For all sufficiently large times this is a smooth increasing change of clock.

We need two kinds of control. Estimates valid at every sufficiently late clock will govern the chart transitions and their polynomial models. We will also select late times at which the rescaled Ricci tensor is uniformly pinched at $o$ and the scalar Harnack inequality approaches equality. The surrounding intervals provide compactness for the limits used to contract loops.

#thm([Proposition 7.4.])[
  #emph[The function $q$ is nondecreasing, $q gt.eq c > 0$ for large $s$, and 
#[#set math.equation(numbering: n => "(7.11)")
 $ s arrow.r oo \, #h(2em) q lt.eq C e^tau \, #h(2em) liminf_(s arrow.r oo) frac(q \( s \), s) lt.eq 2 . $ <chart:q-growth>]

 Uniformly on every fixed compact set, $rho \( x \, t \) \/ s arrow.r 1$, and there is $c_K > 0$ such that, eventually on that compact set, 
#[#set math.equation(numbering: n => "(7.12)")
 $ e^(- 2 s) g lt.eq h_t lt.eq e^(- c_K s) g . $ <chart:metric-decay>]

 There are fixed $a_0 in \( 0 \, 1 \)$ and $b_0 > 0$ such that the least eigenvalue at $o$ of $t "Ric" \( h_t \)$ relative to $h_t$ satisfies 
#[#set math.equation(numbering: n => "(7.13)")
 $ lambda_min \( s \) gt.eq b_0 q \( a_0 s \) quad upright("for all sufficiently large ") s . $ <chart:ricci-lower>]

 Moreover there are $S_i arrow.r oo$ and $K_0 < oo$ with 
#[#set math.equation(numbering: n => "(7.14)")
 $ q \( 2 S_i \) lt.eq K_0 q \( a_0 S_i \) . $ <chart:good-windows>]

 One can choose $s_i in \[ 5 S_i \/ 4 \, 7 S_i \/ 4 \]$ so that $\( log q \)' \( s_i \) arrow.r 0$. If $t_i$ corresponds to $s_i$ and $R_i = R \( o \, t_i \)$, the rescaled flows 
#[#set math.equation(numbering: n => "(7.15)")
 $ g_i \( z \) = R_i h_(t_i + z \/ R_i) $ <chart:rescaled-flows>]

 have uniform curvature and derivative bounds on each fixed-radius moving ball about $o$ in a fixed small two-sided time interval. At $\( o \, 0 \)$ their scalar curvature is one and their Ricci eigenvalues have a fixed positive lower bound.]
] <prop:ricci-windows>

#proof[
  Proposition 20 gives monotonicity and the positive lower bound for $q$, together with $q lt.eq C e^tau$. Hence $s arrow.r oo$. If $q \( s \) > 2 s$ for every sufficiently large $s$, integration of $d s \/ d tau > 2 s$ would give $s gt.eq c e^(2 tau)$, contradicting the linear-in-$t$ bound for $rho \( o \, t \)$. This proves (7.11).
  For a compact family of initial paths from $o$, the power contraction in Proposition 20 makes their $h_t$ lengths tend uniformly to zero. The factor on the right of (7.2), with time increment one, therefore tends uniformly to one on the compact set. Apply the inequality in both spatial directions and integrate in time. More explicitly, for every $epsilon > 0$ and all sufficiently large $v$, uniformly on the compact set,
  $ R \( x \, v \) lt.eq \( 1 + epsilon \) R \( o \, v + 1 \) \, #h(2em) R \( o \, v \) lt.eq \( 1 + epsilon \) R \( x \, v + 1 \) . $
  The first inequality also bounds $R \( x \, v \)$ there. Shifting either integral endpoint by one costs a bounded amount. After division by $s arrow.r oo$, and then letting $epsilon arrow.b 0$, the two inequalities give $rho \( x \, t \) \/ s arrow.r 1$. No integrability of the error factor is required.
  Let $lambda_1 \, dots.h \, lambda_n$ be the eigenvalues of $h_t$ relative to $g$ at $x$. They lie in $\( 0 \, 1 \]$, and their product is $e^(- rho \( x \, t \))$. Thus every $lambda_j gt.eq e^(- rho \( x \, t \))$, which proves the lower bound of (7.12). Choose the instantaneous unitary chart of Lemma 21 at $x$. Its initial-metric singular lengths are $lambda_j^(- 1 \/ 2)$, whose product is $e^(rho \( x \, t \) \/ 2)$. Lemma 22 bounds their largest value by a fixed power of their smallest, uniformly for $x$ in the compact set. Since all these lengths are at least one, their product forces the smallest to be at least $C^(- 1) e^(c rho \( x \, t \))$. This proves the upper bound of (7.12), after reducing $c_K$ and increasing the starting time.
  For each fixed nonzero covector $xi in T_o^(* \( 1 \, 0 \)) M$, the function
  $ L_xi \( tau \) = log \| xi \|_(h_(e^tau)^(- 1))^2 $
  is convex. Indeed the logarithmic norm of a holomorphic dual section is plurisubharmonic for a Griffiths-nonnegative tangent metric, and its restriction to complexified $tau$ is independent of the imaginary part. Its derivative is the Rayleigh quotient of $t "Ric"$ on the dual unit vector. Normalize $\| xi \|_(g^(- 1)) = 1$. At $o$, (7.12) gives
  $ L_xi \( tau \( s \) \) - L_xi \( tau \( a_0 s \) \) gt.eq \( c_o - 2 a_0 \) s . $
  Choose $a_0 < c_o \/ 4$, reducing it further to be less than one if needed. Monotonicity of $q$ gives
  $ tau \( s \) - tau \( a_0 s \) = integral_(a_0 s)^s frac(d v, q \( v \)) lt.eq frac(s, q \( a_0 s \)) . $
  The endpoint derivative of a convex function dominates its secant slope. Taking the minimum over all covectors proves (7.13).
  The estimates obtained so far hold at every sufficiently late clock. We now select intervals on which the lower Ricci bound is comparable to the scalar curvature. Put $L = 2 \/ a_0 > 1$ and choose $K_0 > L^2$. If (7.14) failed for all large $S$, then $q \( L r \) > K_0 q \( r \)$ for all large $r$. Iteration and monotonicity would give $q \( r \) gt.eq c r^(log K_0 \/ log L)$ for every large $r$, contradicting (7.11). Thus such windows occur arbitrarily far out. On their middle halves,
  $ integral_(5 S_i \/ 4)^(7 S_i \/ 4) \( log q \)' \( s \) thin d s lt.eq log K_0 . $
  Choose $s_i$ there with $\( log q \)' \( s_i \) lt.eq 2 log K_0 \/ S_i$.
  Write $q_i = q \( s_i \) = t_i R_i$. On the rescaled clock of (7.15),
  #[#set math.equation(numbering: n => "(7.16)")
   $ frac(d s, d z) = frac(q \( s \), q_i + z) \, #h(2em) hat(R)_i \( o \, z \) = frac(R \( o \, t_i + z \/ R_i \), R_i) = frac(q \( s \), q_i + z) . $ <chart:clock-rescaling>]
  Since $q_i gt.eq c > 0$, choose $delta < c \/ 4$. As long as $s$ lies in the good window, $\| d s \/ d z \| lt.eq 2 K_0$ for $\| z \| lt.eq delta$. The chosen $s_i$ lie a distance at least $S_i \/ 4$ from its ends, so this estimate keeps the whole fixed time interval in the window for large $i$. Formula (7.16) then bounds the rescaled basepoint scalar curvature above and below by fixed positive constants. Apply the rescaled (7.2), using a fixed future-time buffer, to get a uniform scalar bound on every fixed-radius moving ball in a smaller interval. Bisectional nonnegativity controls $\| "Rm" \|$, and Lemma 21 supplies the local higher bounds. Finally (7.13) and (7.14) give at the central point
  $ lambda_min \( "Ric" \( g_i \) \) gt.eq frac(b_0 q \( a_0 s_i \), q_i) gt.eq b_0 / K_0 \, #h(2em) hat(R)_i \( o \, 0 \) = 1 . $
  ◻
]

=== 7.4 Harnack equality and contraction of loops <harnack-equality-and-contraction-of-loops>

The uniform charts are still only local biholomorphisms. To continue their inverse germs to single-valued maps on compact subsets of $M$, we must remove possible monodromy. The selected windows do this by producing equality in a limiting Harnack inequality. We will show that this equality forces real strict concavity of the scalar curvature, then use its gradient flow to contract loops in the corresponding small intrinsic balls.

#thm([Proposition 7.5.])[
  #emph[The manifold $M$ is simply connected.]
] <prop:simple-connectivity>

#proof[
  Take the rescaled flows in Proposition 23. Their pointed pullbacks on tangent balls have a smooth local subsequential limit, denoted $g \( z \)$. Pass to a further subsequence so that
  $ k_i \( z \) = frac(1, q_i + z) arrow.r k \( z \) \, #h(2em) k_z = - k^2 . $
  This includes $k = 0$ when $q_i arrow.r oo$. Denote the limit scalar curvature by $R$ and its Ricci form by $A$. At the central spacetime point, $R = 1$ and $A gt.eq b thin g$ with $b > 0$. Formula (7.16) gives the exact identity
  $ [partial_z hat(R)_i + k_i hat(R)_i]_(\( o \, 0 \)) = \( log q \)' \( s_i \) arrow.r 0 . $
  The limit therefore has $S := R_z + k R = 0$ at the central point.
  The matrix Harnack inequality has the rescaled form $A_z + A g^(- 1) A + k A gt.eq 0$. Its trace is $S$, because $R_z = "tr"_g A_z + \| A \|_g^2$. Thus this nonnegative matrix vanishes at the point in question. Also $A_z = partial accent(partial R, ‾)$ under Kähler–Ricci flow. If $H_(j macron(l)) = nabla_j nabla_(macron(l)) R$, then
  #[#set math.equation(numbering: n => "(7.17)")
   $ H = - A^2 - k A $ <chart:equality-mixed-hessian>]
  there, writing endomorphism products in a unitary frame. On a small spacetime neighborhood, $A$ is positive definite. Minimizing the scalar Harnack inequality over $X$ gives
  #[#set math.equation(numbering: n => "(7.18)")
   $ Z = S - Q gt.eq 0 \, #h(2em) Q = \| partial R \|_(A^(- 1))^2 . $ <chart:equality-Z>]
  At the equality point $S = 0$, so $partial R = 0$ and $Z = 0$.
  We give the scalar Hessian calculation, since a vanishing Harnack quantity by itself does not supply real strict concavity. Use $R_z = Delta R + \| A \|^2$, $A_z = partial accent(partial R, ‾)$, and $k_z = - k^2$. The derivative of the Laplacian on a scalar is $\( partial_z Delta \) R = chevron.l A \, partial accent(partial R, ‾) chevron.r$, while
  $ partial_z \| A \|^2 = 2 chevron.l A \, partial accent(partial R, ‾) chevron.r + 2 "tr" \( A^3 \) . $
  Consequently
  #[#set math.equation(numbering: n => "(7.19)")
   $ \( partial_z - Delta \) S = 3 chevron.l A \, partial accent(partial R, ‾) chevron.r + 2 "tr" \( A^3 \) + k \| A \|^2 - k^2 R . $ <chart:equality-evolution>]
  At the equality point, substitution of (7.17) reduces this to $- "tr" #scale(x: 120%, y: 120%)[\(] A \( A + k "Id" \)^2 #scale(x: 120%, y: 120%)[\)]$. Diagonalize $A$ there, with eigenvalues $lambda_j > 0$. Since $partial R = 0$, derivatives of the coefficients of $A^(- 1)$ make no contribution to $Delta Q$ or $Q_z$, and
  $ Q_z = 0 \, #h(2em) Delta Q = sum_(j \, l) lambda_j^(- 1) (\| R_(j macron(l)) \|^2 + \| R_(j l) \|^2) . $
  The first square sum is exactly $"tr" #scale(x: 120%, y: 120%)[\(] A \( A + k "Id" \)^2 #scale(x: 120%, y: 120%)[\)]$ by (7.17). Hence at this point
  $ \( partial_z - Delta \) Z = sum_(j \, l) lambda_j^(- 1) \| R_(j l) \|^2 gt.eq 0 . $
  On the other hand $Z gt.eq 0$ has an interior spacetime zero, so $Z_z = 0$ and $Delta Z gt.eq 0$ there. The displayed sum must vanish. Thus the pure complex Hessian $R_(j l)$ is zero, while the mixed Hessian is negative definite by (7.17). The real Hessian of $R$ is therefore negative definite at the center, with a definite bound furnished by the positive lower bound for $A$.
  This conclusion holds uniformly on actual small metric balls in the original rescaled manifolds, not only on their immersed parametrizations. Smooth convergence gives the center Hessian bound and $\| nabla hat(R)_i \| \( o \, 0 \) arrow.r 0$. The intrinsic third-derivative estimates from Proposition 23 allow one to parallel transport the Hessian along any minimizing radial geodesic. Shrinking a fixed radius $r_(*) > 0$, independently of $i$, gives constants $a > 0$ with
  #[#set math.equation(numbering: n => "(7.20)")
   $ "Hess"_(g_i \( 0 \)) hat(R)_i lt.eq - a g_i \( 0 \) quad upright("on ") B_(g_i \( 0 \)) \( o \, 2 r_(*) \) \, #h(2em) \| nabla hat(R)_i \| \( o \, 0 \) arrow.r 0 . $ <chart:intrinsic-concavity>]
  Indeed the change in the transported Hessian is bounded by $C r_(*)$, so one chooses $r_(*)$ after the uniform center bound. This argument uses intrinsic derivative estimates along actual geodesics and is unaffected by multiple sheets of a local chart.
  Hold the complete metric $g_i \( 0 \)$ fixed and flow by the real vector field $Y_i = nabla hat(R)_i \( dot.op \, 0 \)$. Along a minimizing radial geodesic of length $r lt.eq 2 r_(*)$,
  $ chevron.l Y_i \, partial_r chevron.r lt.eq \| Y_i \( o \) \| - a r . $
  For large $i$ this is negative on $r = r_(*)$. At cut points, first variation along any minimizing radial segment gives the same upper bound for the upper directional derivative of distance. Thus the closed ball of radius $r_(*)$ traps trajectories starting inside it. Completeness makes this closed ball compact, so these trajectories exist for all positive flow time. For a carried tangent vector $V$, (7.20) gives
  $ frac(d, d v) \| V \|_(g_i \( 0 \))^2 = 2 "Hess" hat(R)_i \( V \, V \) lt.eq - 2 a \| V \|_(g_i \( 0 \))^2 . $
  Every loop contained well inside the trapping ball consequently has carried length tending exponentially to zero.
  Let a fixed piecewise smooth loop in $M$ be given. Its image and a finite collection of paths from $o$ lie in a fixed compact set. Their $h_(t_i)$ lengths tend to zero by (7.12), and $R_i lt.eq C$ by Proposition 20. Thus this loop lies inside $B_(g_i \( 0 \)) \( o \, r_(*) \/ 4 \)$ for sufficiently large $i$. Fix one such $i$. The compact trapping ball has a positive minimum injectivity radius for this one smooth metric. A sufficiently short carried loop lies in a normal ball and is contractible. The gradient flow up to that finite time is a homotopy from the original loop to it. Approximation of continuous loops by piecewise smooth loops finishes the proof. ◻
]

=== 7.5 Inverse charts and one contraction exponent <inverse-charts-and-one-contraction-exponent>

Simple connectivity permits continuation of the inverse germs, but their first contraction estimates will depend on the compact set. The following Liouville principle, applied to limits of logarithmic norms, will make the exponent common to all compact sets. We state it in the required regularity class; it is also a special case of [37] Theorem 9.

#thm([Lemma 7.6.])[
  #emph[Every bounded-above plurisubharmonic function on $M$ is constant, including a function which is not assumed continuous.]
] <chart:psh-liouville>

#proof[
  Allow the constant $- oo$, and otherwise let $v$ be such a function. The compact-ball maximum $m \( r \) = max_(overline(B)_g \( o \, r \)) v$ is finite and nondecreasing. It is convex as a function of $log r$. To see this, fix $0 < r_1 < r_2$ and compare on the closed annulus with the logarithmic chord
  $ H \( r \) = m \( r_1 \) + frac(m \( r_2 \) - m \( r_1 \), log r_2 - log r_1) \( log r - log r_1 \) . $
  If its slope is zero the desired comparison is immediate from the definition of $m \( r_2 \)$. For positive slope, a positive maximum of $v - H \( "dist"_g \( o \, dot.op \) \)$ would occur in the annulus interior. At such a point choose a minimizing radial segment. The length index form with linear parallel test fields in the $J$-radial direction gives an upper Hessian bound for distance. More explicitly, let $T$ be the final radial unit vector, let $T \( ell \)$ denote its parallel extension, and let $macron(r)$ be the length upper support obtained from these trial paths. At the endpoint of a segment of length $r$ the real Hessian satisfies
  $ "Hess" log macron(r) \( T \, T \) + "Hess" log macron(r) \( J T \, J T \) lt.eq - 1 / r^3 integral_0^r ell^2 "Rm" \( T \( ell \) \, J T \( ell \) \, J T \( ell \) \, T \( ell \) \) thin d ell < 0 . $
  Indeed the radial term is $- 1 \/ r^2$, while the linear test field in the $J T$ direction gives $1 \/ r^2$ minus the displayed curvature integral. This is the strictly negative Levi derivative on the radial complex line.
  This support argument applies also at cut points: smoothly vary the endpoint and use trial paths along the chosen minimizing segment. Their lengths give a smooth upper support with the same index-form bound. Since $H$ is increasing, it produces a smooth upper test for $v$ at the hypothetical positive maximum, with a negative Levi derivative. A plurisubharmonic function admits no such upper test, whether or not it is continuous. Hence $v lt.eq H$ on the annulus, proving the claimed convexity. A nondecreasing convex function of $log r in bb(R)$ which is bounded above must be constant. Upper semicontinuity implies $lim_(r arrow.b 0) m \( r \) = v \( o \)$, so $v$ attains its global maximum at $o$. The plurisubharmonic maximum principle on connected $M$ shows that $v$ is constant. ◻
]

Write $J_d F$ for the Taylor jet of $F$ through total degree $d$ at zero, and fix a coefficient norm on each finite-dimensional jet space.

#thm([Proposition 7.7.])[
  #emph[For every sufficiently large volume clock $s$, there is a holomorphic local biholomorphism $Phi_s : B_(bb(C)^n) \( r_0 \) arrow.r M$ centered at $o$, with unitary center derivative for the metric at clock $s$, and 
#[#set math.equation(numbering: n => "(7.21)")
 $ C^(- 1) g_(upright("eucl")) lt.eq Phi_s^(*) h_(t \( s \)) lt.eq C g_(upright("eucl")) . $ <chart:uniform-chart-metric>]

 For fixed $0 < r_1 < r_0$, chosen sufficiently small, the transition germs $F_(s \, u) = Phi_u^(- 1) Phi_s$, $u gt.eq s$, extend to nonsingular holomorphic maps on $B \( r_1 \)$ with a common bound. They fix $0$, compose as germs, and satisfy 
#[#set math.equation(numbering: n => "(7.22)")
 $ parallel F'_(s \, u) \( 0 \) parallel lt.eq 1 \, #h(2em) \| det F'_(s \, u) \( 0 \) \| = e^(- \( u - s \) \/ 2) \, #h(2em) parallel F'_(s \, u) \( 0 \)^(- 1) parallel lt.eq e^(\( u - s \) \/ 2) . $ <chart:center-transitions>]

 There are coherent inverse branches $f_s$ on neighborhoods of any fixed compact exhaustion set for all sufficiently large $s$, satisfying $f_s \( o \) = 0$ and $Phi_s f_s = "Id"$. A constant $sigma > 0$, common to all compact sets, satisfies 
#[#set math.equation(numbering: n => "(7.23)")
 $ sup_K \| f_s \| lt.eq e^(- sigma s) quad upright("for every fixed compact ") K upright(" and all sufficiently large ") s . $ <chart:common-exponent>]

 For every fixed jet order $d$ there is $C_d$ such that 
#[#set math.equation(numbering: n => "(7.24)")
 $ \| J_d F_(s \, u) \| lt.eq C_d min { 1 \, e^(C_d s - sigma u) } #h(2em) \( u gt.eq s upright(" sufficiently large") \) . $ <chart:transition-jets>]

 There are $c \, gamma_0 > 0$ such that, for each fixed $0 < gamma lt.eq gamma_0$, one has 
#[#set math.equation(numbering: n => "(7.25)")
 $ sup_(\| z \| lt.eq e^(- gamma s)) \| F_(s \, u) \( z \) \| lt.eq e^(- c gamma u) #h(2em) upright("for every ") u gt.eq s gt.eq s_gamma . $ <chart:transition-small-balls>]

 The constants in the last two estimates are independent of the later endpoint $u$; the starting threshold in (7.23) may depend on $K$.]
] <prop:shrinking-charts>

#proof[
  Take the charts of Lemma 21 at $o$. We use the elementary short-path lifting property of these possibly noninjective charts; compare [9] Lemmas 2.2–2.3 and Corollary 2.2. A path beginning at the center and having sufficiently small current-metric length lifts from $0$ by local inversion. The lower bound in (7.21) bounds the Euclidean length of its lift. If the given length is smaller than the fixed distance to the chart boundary, the lift cannot escape, and hence extends over the whole path. The same reasoning applies to a homotopy all of whose paths obey this length bound. Local uniqueness of lifts supplies uniqueness throughout the homotopy.
  For $u gt.eq s$, the image under $Phi_s$ of a short radial path has $h_(t \( u \))$ length at most its $h_(t \( s \))$ length. Lift it through $Phi_u$ from $0$. Short radial homotopies give a well-defined map on a fixed ball $B \( r_1 \)$; locally this map is $Phi_u^(- 1) Phi_s$, so it is holomorphic with nonsingular derivative. Its lift has a fixed Euclidean length bound, and therefore the maps are uniformly bounded on $B \( r_1 \)$. They compose wherever both sides are defined near $0$ by uniqueness of local inverses. This is the local transition construction of [9] Lemmas 3.1–3.2 with the metric bounds already established here.
  Unitary center normalization and $h_(t \( u \)) lt.eq h_(t \( s \))$ give the first estimate in (7.22). Taking determinants of these normalizations and using $det h_(t \( s \)) \( o \) = e^(- s) det g \( o \)$ gives the determinant identity. All singular values are at most one and their product is $e^(- \( u - s \) \/ 2)$, so the least is at least this product. This proves the inverse estimate.
  We now use simple connectivity to continue the inverse germs. Fix a connected relatively compact neighborhood of a compact set and $o$. Cover its closure by finitely many small convex initial target neighborhoods with connected pairwise intersections, enlarging the connected neighborhood if necessary to include fixed paths from $o$ to their centers. Choose one such path to each center. On each target neighborhood it extends the inverse germ at $o$ by path lifting. For each nonempty overlap, use one point in the overlap to form the two-path loop. By Proposition 24 this loop bounds a fixed piecewise smooth homotopy. There are only finitely many paths and homotopies; their images lie in a fixed compact set and their initial lengths have a uniform bound. Equation (7.12) makes every path in these homotopies sufficiently short in the current metric when $s$ is large. All lifts stay inside the chart. Thus the two inverse germs agree at the chosen overlap point, and then throughout the connected overlap by analytic continuation. They patch to an inverse $f_s$ on a neighborhood of the compact set.
  Choose nested connected relatively compact open exhaustion sets $D_m$, and choose nondecreasing thresholds $T_m gt.eq m$ so that all shortness conditions for $D_m$ hold whenever $s gt.eq T_m$. At clock $s$, use the construction on $D_(max { m : T_m lt.eq s })$. On a smaller set, the branches obtained from two larger constructions agree by continuation from $o$. This gives the stated coherent branches with domains exhausting $M$. The length estimate for a lift, together with (7.12) on the finite path compact, gives for each fixed $K$
  #[#set math.equation(numbering: n => "(7.26)")
   $ sup_K \| f_s \| lt.eq C_K e^(- a_K s) $ <chart:local-exponent>]
  with $a_K > 0$. It also gives $f_u = F_(s \, u) compose f_s$ on any fixed compact set whenever $s$ is sufficiently large and $u gt.eq s$: both sides are the same continued inverse, and (7.26) keeps $f_s$ in the transition domain.
  It remains to make the exponent independent of the compact. The functions $v_s = s^(- 1) log \| f_s \|$ are plurisubharmonic on their exhausting domains and locally bounded above. For any sequence $s arrow.r oo$, Lemma 11 and diagonal extraction give either convergence to $- oo$ locally uniformly from above, or local $L^1$ convergence to a plurisubharmonic function on $M$. In the second case the upper-regularized limit is at most zero everywhere by (7.26). Lemma 25 makes it constant. On one fixed neighborhood of $o$, (7.26) bounds this constant by a fixed negative number, say $- a_(*)$. The constant-limit conclusion of Lemma 11 then gives $limsup sup_K v_s lt.eq - a_(*)$ on every fixed compact along this subsequence. The collapsing case gives the same conclusion with $- oo$. A sequence violating (7.23), with $sigma = a_(*) \/ 2$, would contradict these alternatives. This proves a common exponent on the full family of clocks.
  For the two remaining transition estimates, transfer the common exponent from a fixed initial neighborhood back to a small ball in the chart domain. Choose a fixed compact initial neighborhood $K_0$ of $o$ with positive initial distance from $o$ to its boundary. Until a path $Phi_s \( r z \)$ first exits $K_0$, (7.12) and (7.21) bound its initial length by $C e^s \| z \|$. It follows that, for a fixed $C_0 > 1$ and all large $s$,
  $ Phi_s #scale(x: 120%, y: 120%)[\(] B \( e^(- C_0 s) \) #scale(x: 120%, y: 120%)[\)] subset K_0 . $
  For every $u gt.eq s$, the map $f_u Phi_s$ on this ball is the same local inverse composition as $F_(s \, u)$ near zero, and hence everywhere there. Equation (7.23) therefore gives the bound
  #[#set math.equation(numbering: n => "(7.27)")
   $ sup_(B \( e^(- C_0 s) \)) \| F_(s \, u) \| lt.eq e^(- sigma u) #h(2em) upright("for all ") u gt.eq s upright(" and large ") s . $ <chart:transition-inner-bound>]
  Cauchy’s estimates on this inner ball give the factor $e^(d C_0 s - sigma u)$ for derivatives of order at most $d$. Cauchy’s estimates on a fixed transition ball give a uniform bound. Combining the two proves (7.24).
  For completeness, fix an outer radius $R < r_1$ and a common bound $B_(*)$ for the transitions there. Euclidean three-circle interpolation, applied to their scalar linear projections and then taking the supremum, gives at radius $e^(- gamma s)$, for fixed small $gamma > 0$,
  $ log sup_(B \( e^(- gamma s) \)) \| F_(s \, u) \| lt.eq - theta_s sigma u + \( 1 - theta_s \) log B_(*) \, #h(2em) theta_s = frac(log \( R \/ e^(- gamma s) \), log \( R \/ e^(- C_0 s) \)) gt.eq frac(gamma, 2 C_0) $
  for all sufficiently large $s$. In this formula choose $gamma_0 < C_0$, so the middle radius lies between the inner and outer radii. Since $u gt.eq s$, the fixed term $log B_(*)$ is absorbed uniformly for every later endpoint, giving (7.25) with, for example, $c = sigma \/ \( 4 C_0 \)$ and a threshold depending on $gamma$. This proves all the stated uniformities. ◻
]

== 8 Polynomial models with nonuniform contraction <sec:dynamics>

We retain the volume clock $s = rho \( o \, t \)$, its logarithmic-time speed $q \( s \) = d s \/ d tau = t R \( o \, t \)$, and the charts of Proposition 26. Polynomial normalization and inverse iteration are classical tools for attracting basins, notably in Rosay–Rudin’s work [48] Appendix; Chau–Tam brought this strategy into Kähler uniformization [7,9,8]. The estimates proved here address the nonuniform contraction permitted by Proposition 23. For sequences of holomorphic automorphisms of $bb(C)^n$, $n gt.eq 2$, fixing zero and satisfying $A \| z \| lt.eq \| f_j \( z \) \| lt.eq B \| z \|$ on one fixed ball about zero, with $0 < A < B < 1$ independent of $j$, Bera–Verma prove that the attracting basin is biholomorphic to $bb(C)^n$ [3] Theorem 1.1. The chart transitions here require the variable-rate estimates below. In particular, we use only

#[#set math.equation(numbering: n => "(8.1)")
 $ q upright(" nondecreasing") \, #h(2em) q gt.eq c > 0 \, #h(2em) liminf_(s arrow.r oo) frac(q \( s \), s) lt.eq 2 \, #h(2em) lambda_min \( t "Ric" \) \( o \) gt.eq b_0 q \( a_0 s \) \, $ <eq:dyn:rate-input>]

where $0 < a_0 < 1$ and $b_0 > 0$ are fixed.

We continue to use $J_d$ and the fixed coefficient norms introduced in Section 7. All maps and jets in this Section fix zero. A coefficient bound $exp \( o \( s_k \) \)$ means an upper bound $exp \( eta_k s_k \)$ with $eta_k arrow.r 0$; its rate of convergence may depend on parameters already fixed. No assertion of uniformity as those parameters vary is intended. For polynomial automorphisms put $G_(k \, l) = G_(l - 1) compose dots.h.c compose G_k$ and $G_(k \, k) = "Id"$.

#thm([Proposition 8.1.])[
  (Polynomial models).  #emph[Fix an integer $d gt.eq 2$ and a macro width $0 < h < 1$. After starting at a sufficiently late macro endpoint, there is a grid $s_k arrow.r oo$ with macro endpoints $S_j = e^(h j)$ and the following properties. Each macro interval is either one bad step or is divided into regular steps of length comparable to $sqrt(S_j)$. Thus, eventually, 
#[#set math.equation(numbering: n => "(8.2)")
 $ c_h sqrt(s_k) lt.eq Delta s_k := s_(k + 1) - s_k lt.eq \( e^h - 1 \) s_k . $ <eq:dyn:grid-size>]

 For $F_k = F_(s_k \, s_(k + 1))$ there are polynomial local coordinate changes $H_k$ and polynomial automorphisms $G_k$ of $bb(C)^n$ satisfying 
#[#set math.equation(numbering: n => "(8.3)")
 $ J_d \( H_(k + 1) compose F_k \) = J_d \( G_k compose H_k \) . $ <eq:dyn:jet-conjugacy>]

 The degrees of $H_k \, G_k \, G_k^(- 1)$ are bounded independently of $k$. The coefficients of $H_k$ and its inverse jet are $exp \( o \( s_k \) \)$; $H'_k \( 0 \)$ and its inverse have polynomial bounds in $s_k$. For a constant $C_d$ depending only on the fixed jet order and dimension, 
#[#set math.equation(numbering: n => "(8.4)")
 $ lr(bar.v.double G_k bar.v.double)_(upright("coeff")) + lr(bar.v.double G_k^(- 1) bar.v.double)_(upright("coeff")) & lt.eq exp #scale(x: 120%, y: 120%)[\(] C_d Delta s_k + o \( s_k \) #scale(x: 120%, y: 120%)[\)] \,\
lr(bar.v.double G'_k \( 0 \)^(- 1) bar.v.double) & lt.eq s_k^C exp \( Delta s_k \/ 2 \) . $ <eq:dyn:coefficient-bound>]

 In particular, the coefficient $C_d$ of $Delta s_k$ is independent of $h$. Finally, for some finite $D$, 
#[#set math.equation(numbering: n => "(8.5)")
 $ deg G_(0 \, k) lt.eq D s_k quad upright("on an unbounded subsequence of macro endpoints.") $ <eq:dyn:forward-degree>]

]
] <prop:polynomial-models>

First we normalize the Jacobian jets coherently along the grid. On regular steps we then construct polynomial models whose nonlinear terms and intervening linear changes preserve bounds for the degree of each component. On bad steps, realization of the full normalized jet costs a fixed degree factor. The last part of the proof charges these factors to growth of $q$ and obtains (8.5). The distinction between the constant $C_d$ in (8.4) and constants hidden in $o \( s_k \)$ will be used in Section 9.

=== 8.1 Coherent volume jets <coherent-volume-jets>

On the uniform transition ball, the germs $F_k$ are nonsingular and have uniformly bounded derivatives of each fixed order on a smaller ball. Their center derivatives are contractions, and chart normalization gives

#[#set math.equation(numbering: n => "(8.6)")
 $ \| det F'_k \( 0 \) \| = e^(- Delta s_k \/ 2) \, #h(2em) lr(bar.v.double F'_k \( 0 \)^(- 1) bar.v.double) lt.eq e^(Delta s_k \/ 2) . $ <eq:dyn:transition-linear>]

The second inequality follows because every singular value is at most one and their product is $e^(- Delta s_k \/ 2)$. Choose the holomorphic logarithm vanishing at zero of

$ P_k \( z \) = log frac(det F'_k \( z \), det F'_k \( 0 \)) . $

The upper bound on its real part is $C + Delta s_k \/ 2$. The coefficient estimate for a holomorphic function with bounded real part, applied on concentric balls and with $P_k \( 0 \) = 0$, therefore gives $lr(bar.v.double J_(d - 1) P_k bar.v.double) lt.eq C_d \( 1 + Delta s_k \)$.

The volume correction uses only the spacing bounds (8.2), so it can be constructed before the macro intervals are classified. On any such grid the jet series

#[#set math.equation(numbering: n => "(8.7)")
 $ ell_k = sum_(l gt.eq k) J_(d - 1) #scale(x: 120%, y: 120%)[\(] P_l compose F_(s_k \, s_l) #scale(x: 120%, y: 120%)[\)] $ <eq:dyn:volume-series>]

converges. Indeed Proposition 26 bounds each coefficient of the summand by

$ C_d \( 1 + Delta s_l \) min { 1 \, exp \( C_d s_k - sigma s_l \) } . $

The absence of a constant term in $P_l$ is essential here. For $s_l lt.eq C'_d s_k$ the step lengths telescope and the number of steps is polynomial in $s_k$. Beyond that range the displayed exponential is summable, since the grid eventually has spacing at least one and $Delta s_l lt.eq \( e^h - 1 \) s_l$. Thus $ell_k$ has polynomial coefficient bounds in $s_k$. The composition identity for transitions yields

#[#set math.equation(numbering: n => "(8.8)")
 $ ell_k = J_(d - 1) #scale(x: 120%, y: 120%)[\(] P_k + ell_(k + 1) compose F_k #scale(x: 120%, y: 120%)[\)] . $ <eq:dyn:volume-cocycle>]

Let $E_k = J_(d - 1) exp \( ell_k \)$ and define a polynomial change

$ A_k \( z \) = (z_1 \, dots.h \, z_(n - 1) \, integral_0^(z_n) E_k \( z_1 \, dots.h \, z_(n - 1) \, zeta \) thin d zeta) . $

It is tangent to the identity, has degree at most $d$, and satisfies $J_(d - 1) log det A'_k = ell_k$. Its coefficients and inverse jet have polynomial bounds in $s_k$. In the new coordinates the normalized logarithmic Jacobian jet of $A_(k + 1) F_k A_k^(- 1)$ is

$ J_(d - 1) #scale(x: 120%, y: 120%)[\(] ell_(k + 1) compose F_k + P_k - ell_k #scale(x: 120%, y: 120%)[\)] compose A_k^(- 1) = 0 . $

This records the sign of the volume correction explicitly. We shall call a jet with Jacobian determinant equal, through degree $d - 1$, to its center determinant a #emph[constant-volume jet].

#thm([Lemma 8.2.])[
  (Realization of constant-volume jets).  #emph[For fixed $n \, d$, every invertible constant-volume $d$-jet fixing zero is the $d$-jet of a polynomial automorphism of $bb(C)^n$. Its degree and inverse degree are bounded by a constant $D_d$. Its coefficients and inverse coefficients are bounded polynomially in the coefficients of the given jet and its inverse linear part. These bounds do not depend on the grid or on $h$.]
] <lem:volume-jets>

#proof[
  Normalize the derivative to the identity. If a volume-preserving polynomial automorphism agrees with the required jet through degree $m - 1$, the first discrepancy is a homogeneous vector polynomial $X_m$ of degree $m$ with $"div" X_m = 0$: this is the degree $m - 1$ part of the Jacobian determinant condition.
  The space of such fields is spanned by
  #[#set math.equation(numbering: n => "(8.9)")
   $ X \( z \) = l \( z \)^m v \, #h(2em) l in \( bb(C)^n \)^(*) \, quad v in bb(C)^n \, quad l \( v \) = 0 . $ <eq:dyn:shear-fields>]
  This is the divergence-free shear lemma of Andersén [2]; see also [22] proof of Theorem 3.1. We include the finite-dimensional proof to track the coefficient bounds. Pair a linear functional on homogeneous vector polynomials with $l^m v$. The result has the form $A \( l \) \( v \)$, where $A \( l \)$ is a covector-valued homogeneous polynomial of degree $m$. If the functional annihilates all fields in (8.9), then $A \( l \)$ is proportional to $l$. The polynomial identities $l_i A_j \( l \) = l_j A_i \( l \)$ show that $A \( l \) = B \( l \) l$ for a homogeneous polynomial $B$ of degree $m - 1$. Such functionals are exactly the image of the transpose of divergence, since $"div" \( l^m v \) = m l \( v \) l^(m - 1)$. Taking annihilators proves the spanning assertion. In dimension one the divergence kernel in these degrees is zero, so this argument also covers $n = 1$.
  Select a finite spanning list of the fields (8.9), once for each $2 lt.eq m lt.eq d$. The time-$c$ map of such a field is the polynomial shear $z mapsto z + c l \( z \)^m v$, whose inverse has the minus sign; both have Jacobian determinant one. A fixed linear decomposition of $X_m$ therefore gives a finite composition of shears correcting degree $m$ without changing lower degrees. Induction through $m = d$, followed by the original linear map, proves realization. There are a fixed number of shears, and each operation on the truncated jets is polynomial in the preceding coefficients and the inverse linear part. This proves all the coefficient and degree bounds, including those for the inverse. Restoring the original linear map gives the realizing automorphism the determinant of that linear map; the correcting shears have determinant one. ◻
]

=== 8.2 Rate order without commuting matrices <rate-order-without-commuting-matrices>

Consider one interval in logarithmic time, of length $T > 0$. Singular-value decompositions in its start and end unitary tangent coordinates give derivative

#[#set math.equation(numbering: n => "(8.10)")
 $ D = "diag" \( e^(- mu_1 T \/ 2) \, dots.h \, e^(- mu_n T \/ 2) \) \, #h(2em) 0 lt.eq mu_1 lt.eq dots.h.c lt.eq mu_n \, #h(2em) sum_i mu_i = frac(Delta s, T) . $ <eq:dyn:diagonal-rates>]

The volume changes $A_k$ do not change these linear parts.

We need an order statement for the rate forms, and not merely their ordered eigenvalues. Normalize the cometric at the start to $I$ in a fixed covector basis. In the diagonalized basis its value at the end is $"diag" \( e^(mu_i T) \)$. On the complex strip $0 lt.eq Re z lt.eq T$, the holomorphic covector with components $a_i e^(- mu_i z \/ 2)$ has squared norm $\| \| a^2$ on both boundary lines. Its squared norm is bounded and subharmonic by Theorem 19, applied with $t = t_(upright("start")) e^(Re z)$; equivalently the complex time variable there is shifted by $z \/ 2$. The bounded subharmonic maximum principle on the strip gives the same upper bound inside. Consequently the cometric is bounded above by the flat exponential interpolation of its endpoint values. Differentiating this matrix inequality at the two ends gives

#[#set math.equation(numbering: n => "(8.11)")
 $ \( t "Ric" \)_(upright("start")) lt.eq "diag" \( mu_i \) \, #h(2em) "diag" \( mu_i \) lt.eq \( t "Ric" \)_(upright("end")) \, $ <eq:dyn:endpoint-rate-order>]

where each matrix is expressed in the corresponding endpoint unitary covector coordinates. The inequalities have opposite endpoint signs because the matrix difference vanishes at both ends and is nonnegative inside.

At a shared endpoint of two steps, let $U_k$ send old tangent components to new tangent components. It is unitary; a row covector $v$ in the new coordinates has old row $v U_k$. Combining the two inequalities in (8.11) gives

#[#set math.equation(numbering: n => "(8.12)")
 $ sum_l mu_l^(upright("old")) \| \( v U_k \)_l \|^2 lt.eq sum_i mu_i^(upright("new")) \| v_i \|^2 . $ <eq:dyn:loewner-jump>]

This proof allows the instantaneous Ricci matrices to fail to commute. In particular, the sorted rates are nondecreasing from step to step.

=== 8.3 The macro grid and propagated weights <the-macro-grid-and-propagated-weights>

The positive weights below will bound ordinary polynomial degrees component by component. For a polynomial map $P = \( P_1 \, dots.h \, P_n \) : bb(C)^n arrow.r bb(C)^n$ with $deg P_l lt.eq w_l$, one has

$ deg \( P_1^(beta_1) dots.h.c P_n^(beta_n) \) lt.eq sum_l beta_l w_l . $

Thus a nonlinear map preserves these degree bounds if every monomial $z^beta$ in component $i$ satisfies $sum_l beta_l w_l lt.eq w_i$. A linear change between two weight systems preserves the bounds provided every nonzero entry sends an old coordinate to a new coordinate of at least its weight. We shall enforce both rules on regular steps. Bad steps may multiply degrees by a fixed factor; their defining rate growth will pay for that factor.

Put $Q_j = q \( S_j \)$ and choose an integer $N gt.eq 1$ with $e^(- h N) lt.eq a_0$. A macro index $j$ is #emph[flagged] when

#[#set math.equation(numbering: n => "(8.13)")
 $ log Q_(j + 1) - log Q_(j - N) > M \, $ <eq:dyn:flag>]

where the fixed threshold $M$ will be chosen sufficiently large below. Declare bad the union of the expanded flag intervals $\[ j - N \, j + 1 + N \)$ in the integer macro index line. Each bad macro is a single step. Divide every remaining macro interval into equal steps whose lengths are comparable to $sqrt(S_j)$, for example by taking the number of pieces to be the nearest larger integer to $\( S_(j + 1) - S_j \) \/ sqrt(S_j)$. Once $j$ is large this gives (8.2).

If macro $j$ is regular, it is not flagged. On each of its steps, (8.1) and (8.11) imply

#[#set math.equation(numbering: n => "(8.14)")
 $ b_0 Q_(j - N) lt.eq mu_i lt.eq Q_(j + 1) \, #h(2em) b Q_j lt.eq mu_i lt.eq b^(- 1) Q_j $ <eq:dyn:regular-rates>]

for a fixed $b > 0$ depending on $M \, b_0$. These constants may depend on $h$ after all parameter choices have been made.

For a regular macro set $theta_j = Q_j \/ j^2$ and choose bounded increasing multipliers $lambda_j$ on the whole macro sequence by

$ lambda_(j + 1) \/ lambda_j = 1 + K_0 \/ j^2 . $

Their product is bounded, since $sum j^(- 2) < oo$; an overall constant factor is free. Choose $0 < epsilon.alt_0 < 1 \/ \( 10 n \)$. For each regular macro, form a finite directed graph whose vertices are the pairs $\( k \, i \)$ consisting of a step in that macro and one of its coordinates. Give this vertex raw weight $lambda_j \( mu_i - theta_j \)$, where $mu_i$ is its rate in step $k$. Draw an edge to a vertex in the same or the next step precisely when the destination rate is at least the source rate minus $epsilon.alt_0 theta_j$. Define $w_(k \, i)$ as the maximum raw weight among vertices from which $\( k \, i \)$ is reachable, allowing paths of length zero. This maximum exists because the graph is finite, even when same-step edges form cycles. Assign the weight to both ends of its diagonal step.

This propagation loses at most $n epsilon.alt_0 theta_j$ in rates, independently of the number of steps. To verify the assertion, follow any permitted chain and keep its successive lower records. Once a sorted index has appeared, its rate at a later occurrence is at least its earlier rate, by (8.12). A new lower record can therefore occur only on the first visit to an index; each such record lowers the previous record by at most $epsilon.alt_0 theta_j$. There are at most $n$ indices. It follows that

#[#set math.equation(numbering: n => "(8.15)")
 $ lambda_j \( mu_i - theta_j \) lt.eq w_(k \, i) lt.eq lambda_j \( mu_i - 0.9 theta_j \) . $ <eq:dyn:weights>]

In particular, whenever a permitted passage is possible the weights do not decrease.

The same nondecrease can be required across adjacent regular macros. Indeed, write $mu'$ for a new rate and $mu$ for an old one, with $mu' gt.eq mu - epsilon.alt_0 theta_j$. A lower bound on the new raw weight minus the upper bound on the old propagated weight is

$ \( lambda_(j + 1) - lambda_j \) mu' - lambda_(j + 1) theta_(j + 1) + \( 0.9 - epsilon.alt_0 \) lambda_j theta_j . $

Since $mu' gt.eq b Q_(j + 1)$, choosing $K_0$ large in terms of $b$ makes this expression nonnegative at every sufficiently large index. Thus the passage rule is valid also at regular macro junctions. Increase the overall scale of $lambda$ so that all weights are at least one after the eventual starting index.

Call a nonlinear monomial $z^beta$ in component $i$ #emph[allowed] when $sum_l beta_l w_(k \, l) lt.eq w_(k \, i)$, and #emph[forbidden] otherwise. For a forbidden monomial of degree $m gt.eq 2$, (8.15) gives

#[#set math.equation(numbering: n => "(8.16)")
 $ sum_l beta_l mu_l - mu_i > \( 0.9 m - 1 \) theta_j gt.eq 0.8 theta_j . $ <eq:dyn:forbidden-gap>]

For an allowed monomial, every variable occurring in it has strictly smaller weight than its output: the weights are positive and $m gt.eq 2$. Thus allowed nonlinear maps are triangular after ordering coordinates by weight.

=== 8.4 Aligning the linear jumps <aligning-the-linear-jumps>

#thm([Lemma 8.3.])[
  (Linear alignment).  #emph[On every run of regular steps there are unipotent matrices $L_k^(+)$, with off-diagonal entries only in rows of smaller weight than their columns, such that, on putting $L_k^(-) = D_k^(- 1) L_k^(+) D_k$, the diagonal step derivative remains $D_k$ and every regular jump becomes 
#[#set math.equation(numbering: n => "(8.17)")
 $ J_k = L_(k + 1)^(-) U_k \( L_k^(+) \)^(- 1) \, #h(2em) \( J_k \)_(i l) = 0 quad upright("if ") w_(k + 1 \, i) < w_(k \, l) . $ <eq:dyn:aligned-jump>]

 The matrices $L_k^(+)$ and their inverses have polynomial bounds in the macro index $j$, while 
#[#set math.equation(numbering: n => "(8.18)")
 $ lr(bar.v.double L_k^(-) - I bar.v.double) lt.eq j^C exp (- c sqrt(S_j) / j^2) . $ <eq:dyn:small-start-change>]

 The estimates are uniform in finite terminal horizons, and hold on an infinite regular run by a coefficientwise limit.]
] <lem:linear-alignment>

#proof[
  Work backward, taking $L_k^(+) = I$ at the last step of a finite run or horizon. Suppose the next small start adjustment is known and set $B = L_(k + 1)^(-) U_k$. For a real threshold $x$, let $A_x$ be the span of rows of $B$ whose new weights are at most $x$, and let $E_x$ be the old coordinate row space with weights at most $x$.
  Projection $P_(E_x) : A_x arrow.r E_x$ is injective, and its inverse on its image has norm $O \( j \)$. For the proof assume $A_x eq.not 0$ and let $r_x$ be the largest new rate among its defining rows. Every old rate outside $E_x$ exceeds $r_x + epsilon.alt_0 theta_j$: otherwise the passage rule would make that old weight at most the weight of a selected new row. For any unit $a in A_x$, (8.12) and the small next adjustment imply that its old rate Rayleigh quotient is at most $r_x + o \( theta_j \)$. To see the size of this error, express $a$ as a combination of the selected rows of $L_(k + 1)^(-) U_k$; its coefficient norm is $1 + o \( 1 \)$, and the error is bounded by the operator norm of $L_(k + 1)^(-) - I$ times the largest old or new rate. The regular rate bounds make that error $o \( theta_j \)$, also at a macro junction. Nonnegativity of all old rates now gives
  $ \( r_x + epsilon.alt_0 theta_j \) \( 1 - lr(bar.v.double P_(E_x) a bar.v.double)^2 \) lt.eq r_x + o \( theta_j \) . $
  As $r_x lt.eq C Q_j$, this implies $lr(bar.v.double P_(E_x) a bar.v.double)^2 gt.eq c \/ j^2$. Empty or full coordinate spaces give the same assertion in its evident form.
  We give the graph extension explicitly. List the distinct spaces $E_x$ increasingly. For each such space retain the largest required $A_x$ with that $E_x$, so that the required $A_x$ remain nested. Starting with the full row space, descend through the list. Suppose the next larger space $V_(+)$ already projects isomorphically to $E_(+)$ and contains the current $A = A_x$. Write $T_(+) : E_(+) arrow.r V_(+)$ for its inverse projection, $E = E_x$, $Y = P_E A$, and $R_A : Y arrow.r A$ for the inverse of $P_E \|_A$. Define
  #[#set math.equation(numbering: n => "(8.19)")
   $ T_E \( e \) = R_A \( P_Y e \) + T_(+) \( \( I - P_Y \) e \) \, #h(2em) e in E . $ <eq:dyn:graph-extension>]
  Here orthogonal projection $P_Y$ is taken in $E$. Both terms lie in $V_(+)$, projection to $E$ is $e$, and the range contains $A$. Moreover $lr(bar.v.double T_E bar.v.double) lt.eq lr(bar.v.double R_A bar.v.double) + lr(bar.v.double T_(+) bar.v.double)$. There are at most $n$ nontrivial stages, so the resulting graph lifts have polynomial bounds in $j$.
  For each coordinate row, take its lift at its own weight threshold. These rows form $L_k^(+)$. The rows up to every threshold span the corresponding nested graph: they lie there and their projections form a triangular basis of its coordinate space. Each lifted row equals its coordinate row plus terms of strictly higher weight. Hence $L_k^(+) = I + N_k$ with $N_k$ nilpotent, and $\( L_k^(+) \)^(- 1) = sum_(r = 0)^(n - 1) \( - N_k \)^r$ has polynomial bounds. The inclusion $A_x \( L_k^(+) \)^(- 1) subset E_x$ is exactly the zero pattern in (8.17).
  For every nonzero off-diagonal entry in row $i$, column $l$, the within-step passage rule gives $mu_l - mu_i > epsilon.alt_0 theta_j$. Conjugation therefore gives
  $ \( D_k^(- 1) L_k^(+) D_k \)_(i l) = \( L_k^(+) \)_(i l) exp #scale(x: 120%, y: 120%)[\(] - \( mu_l - mu_i \) Delta tau_k \/ 2 #scale(x: 120%, y: 120%)[\)] . $
  By (8.14), $theta_j Delta tau_k gt.eq c sqrt(S_j) \/ j^2$. This proves (8.18); its exponential absorbs every polynomial bound needed in the preceding backward step. After a sufficiently late start the induction thus closes uniformly in the horizon. A diagonal subsequence of finite-horizon matrices proves the assertion on infinite runs; the zero conditions and all bounds are closed under that limit. ◻
]

=== 8.5 Homological equations and polynomial automorphisms <homological-equations-and-polynomial-automorphisms>

Choose a single primary coordinate system at each grid endpoint. Use the adjusted start coordinates if a regular step starts there; otherwise use the adjusted end coordinates of a regular step just ended, if there is one; use the volume coordinates in all other cases. These choices are a linear change, of polynomial size together with its inverse, following $A_k$. For a regular step, before the possible jump to the next regular start, write the resulting transition as $hat(F)_k$, with derivative $D_k$. Its actual transition to the next primary coordinates is $J_k hat(F)_k$, with $J_k = I$ when the next step is bad. It has a constant-volume $d$-jet and polynomially bounded coefficients. This follows by formal composition and inversion of the primary coordinate jets; only their local germs are used.

We construct tangent-to-identity polynomial jets $h_k$ at regular starts, taking $h_k = I$ elsewhere. For a regular step seek $G_k = J_k g_k$, where $g_k$ has linear part $D_k$ and only allowed nonlinear terms, satisfying

#[#set math.equation(numbering: n => "(8.20)")
 $ g_k compose h_k = J_k^(- 1) compose h_(k + 1) compose J_k compose hat(F)_k quad upright("through degree ") d . $ <eq:dyn:homological-identity>]

In homogeneous degree $m$, once lower degrees have been fixed, this is

#[#set math.equation(numbering: n => "(8.21)")
 $ g_k^(\( m \)) + D_k h_k^(\( m \)) = J_k^(- 1) h_(k + 1)^(\( m \)) \( J_k D_k z \) + B_k^(\( m \)) \( z \) \, $ <eq:dyn:homological-layer>]

where $B_k^(\( m \))$ contains only already known data. Put only forbidden coefficients into $h_k^(\( m \))$ and only allowed coefficients into $g_k^(\( m \))$. If $Pi_k$ projects to the forbidden coefficients, the equation for $h_k^(\( m \))$ is a backward affine recursion with linear operator

#[#set math.equation(numbering: n => "(8.22)")
 $ T_k X = Pi_k [D_k^(- 1) J_k^(- 1) X \( J_k D_k z \)] . $ <eq:dyn:backward-operator>]

Conjugation by $J_k$ has polynomial norm in $j$ at each fixed degree. After it has been expanded, a coefficient in output $i$ and input $beta$ receives the diagonal factor $exp \[ - \( sum_l beta_l mu_l - mu_i \) Delta tau_k \/ 2 \]$. Projection and (8.16) consequently give

#[#set math.equation(numbering: n => "(8.23)")
 $ lr(bar.v.double T_k bar.v.double) lt.eq j^(C_m) exp (- c sqrt(S_j) / j^2) . $ <eq:dyn:backward-contraction>]

This estimate holds for every incoming homogeneous polynomial $X$; no support restriction on $X$ has been imposed before conjugation.

Solve first on a finite regular horizon with terminal correction the identity, and proceed by degree. Inductively the lower-layer forcing, including division by $D_k$, has coefficients bounded by $exp \( C'_m sqrt(s_k) \)$: regular steps have $Delta s_k asymp sqrt(s_k)$, and $lr(bar.v.double D_k^(- 1) bar.v.double) lt.eq e^(Delta s_k \/ 2)$. The envelopes $exp \( C_m sqrt(s_k) \)$ have bounded consecutive ratios, because $sqrt(s_(k + 1)) - sqrt(s_k)$ is bounded on regular steps. Thus (8.23) is eventually less than one half after weighting by these envelopes. The backward geometric series solves (8.21) with

#[#set math.equation(numbering: n => "(8.24)")
 $ lr(bar.v.double h_k bar.v.double) + lr(bar.v.double J_d h_k^(- 1) bar.v.double) + lr(bar.v.double g_k bar.v.double) + lr(bar.v.double g_k^(- 1) bar.v.double)_(upright("coeff")) lt.eq exp \( C'_d sqrt(s_k) \) \, $ <eq:dyn:regular-coefficients>]

uniformly in the terminal horizon. Here $C'_d$ may depend on all fixed grid parameters. Taking coefficientwise diagonal limits gives the same construction on an infinite regular run.

Each $g_k$ is a triangular polynomial automorphism: all nonlinear inputs have smaller weights than their output. Its inverse is found by successive substitution in increasing weight order. Its degree and inverse degree are bounded in terms of $n \, d$, and its determinant is the constant $det D_k$.

The coordinate jets $h_k$ also preserve volume through degree $d - 1$. This is not a property assumed of the forbidden projection. In a finite-horizon problem, differentiate the complete jet identity (8.20). The determinant of $hat(F)'_k$ has the same constant jet as $det D_k$, and $g_k$ has that determinant exactly. If $det h'_(k + 1) = 1$ through degree $d - 1$, then the determinant identity forces the same statement for $h_k$. Backward induction from the identity terminal jet proves it, and it passes to the coefficientwise limits.

At a bad macro step realize, by Lemma 28, the jet of the transition between the two primary coordinate systems after their endpoint corrections $h_k \, h_(k + 1)$. It is a constant-volume jet by what was just proved. Enlarge $D_d$ to bound the degrees and inverse degrees of these models and of the regular models. Let $H_k$ be the degree-$d$ truncation of the total primary change followed by $h_k$. It has the required center derivative and inverse jet, and (8.3) follows.

For precision, on a bad step the realized input jet has coefficient bound $exp \( o \( s_k \) \)$, whereas its inverse linear part is bounded by $exp \( Delta s_k \/ 2 + o \( s_k \) \)$, by (8.6). Lemma 28 costs a fixed polynomial in these two quantities. Its polynomial exponent depends only on $n \, d$. Therefore it gives (8.4) with a coefficient $C_d$ independent of $h \, N \, M$. All endpoint and regular costs $exp \( C \( d \, h \, N \, M \) sqrt(s_k) \)$ remain in $exp \( o \( s_k \) \)$. Finally the linear part of the jet conjugacy is $G'_k \( 0 \) = H'_(k + 1) \( 0 \) F'_k \( 0 \) H'_k \( 0 \)^(- 1)$; the polynomial bounds on the endpoint linear changes give (8.4).

=== 8.6 Charging bad components to rate growth <charging-bad-components-to-rate-growth>

#thm([Lemma 8.4.])[
  (Forward degree control).  #emph[The flag threshold $M$ can be chosen so that regular macro starts occur arbitrarily late, and the polynomial models constructed above, initialized at any sufficiently late such start, satisfy (8.5).]
] <lem:degree-control>

#proof[
  Set
  $ W = 2 N + 1 \, #h(2em) D_(*) = D_d \, #h(2em) B_(*) = max { 0 \, log \( 2 \/ b_0 \) } \, #h(2em) alpha = frac(M, 3 W) . $
  Choose $M$ so large that
  #[#set math.equation(numbering: n => "(8.25)")
   $ alpha gt.eq log D_(*) + B_(*) \/ W \, #h(2em) alpha > h . $ <eq:dyn:flag-threshold>]
  A flag $f$ has expanded interval $I_f = \[ f - N \, f + 1 + N \)$, of length $W$, and growth interval $\[ f - N \, f + 1 \]$, on which $log Q$ increases by more than $M$.
  Consider a full finite bad component $\[ u \, v \)$. Choose a maximal disjoint collection of its expanded flag intervals. Their concentric triples cover the component: any unselected equal-length interval meets a selected one and is contained in its triple. Thus there are at least $\( v - u \) \/ \( 3 W \)$ selected intervals. Their growth intervals are disjoint up to endpoints and lie in $\[ u \, v - N \]$. Monotonicity gives
  #[#set math.equation(numbering: n => "(8.26)")
   $ log Q_(v - N) / Q_u gt.eq alpha \( v - u \) . $ <eq:dyn:full-bad-growth>]
  Every full component has length $L = v - u gt.eq W$, so (8.25) implies
  #[#set math.equation(numbering: n => "(8.27)")
   $ D_(*)^L Q_u lt.eq e^(- B_(*) L \/ W) Q_(v - N) lt.eq \( b_0 \/ 2 \) Q_(v - N) . $ <eq:dyn:bad-reset-cost>]
  We now track the ordinary degree of each component of the accumulated forward polynomial. At a regular start bound these degrees by the respective weights. Allowed nonlinear terms preserve that bound under composition, and (8.17) preserves it at a regular jump. If the next macro is bad, retain the last end weights; at entry to $\[ u \, v \)$ their maximum is at most $lambda_(u - 1) Q_u$. Each bad map multiplies maximum degree by at most $D_(*)$. At the next regular macro $v$, its flag test fails, and hence $Q_v lt.eq e^M Q_(v - N)$. For sufficiently large $v$ every new start weight is at least
  $ lambda_v #scale(x: 120%, y: 120%)[\(] b_0 Q_(v - N) - Q_v \/ v^2 #scale(x: 120%, y: 120%)[\)] gt.eq lambda_v \( b_0 \/ 2 \) Q_(v - N) . $
  As $lambda_v gt.eq lambda_(u - 1)$, (8.27) resets all degree bounds exactly to the new weights. There is no multiplicative loss for a completed bad component.
  Prefixes require a separate estimate. For a bad prefix $\[ u \, j \)$, the expanded flag intervals wholly contained in the prefix cover $\[ u \, j - W \)$, when this interval is nonempty. Indeed an expanded interval covering a point before $j - W$ ends before $j$, and none crosses the left endpoint $u$ of the component. The same disjoint selection gives
  #[#set math.equation(numbering: n => "(8.28)")
   $ log \( Q_j \/ Q_u \) gt.eq alpha \( j - u - W \)_(+) \, #h(2em) D_(*)^(j - u) Q_u lt.eq D_(*)^W Q_j . $ <eq:dyn:bad-prefix-growth>]
  This proof also applies to a prefix of an infinite bad component. Such a component would give $log \( Q_j \/ S_j \) gt.eq \( alpha - h \) j - O \( 1 \) arrow.r oo$. It is impossible: choose continuous-clock points $x_r arrow.r oo$ with $q \( x_r \) lt.eq 3 x_r$, and let $S_(j_r) lt.eq x_r < S_(j_r + 1)$. Then $Q_(j_r) lt.eq 3 e^h S_(j_r)$, contradicting that growth. Thus there are regular macro starts arbitrarily far out.
  Start at one of them, after every fixed-parameter threshold above, and label this grid point $k = 0$, retaining the original large macro indices $j$. The accumulated map is initially the identity and its component degrees are one, so the initial weight bound holds after the overall scaling already allowed for $lambda$. Regular propagation, the exact full-component reset, and the single prefix loss in (8.28) give, at all macro endpoints,
  $ deg G_(0 \, k \( j \)) lt.eq C max { e^M \, D_(*)^W } Q_j \, $
  where $C$ can be taken to depend on the bounded supremum of the multipliers. On a regular macro one uses $Q_(j + 1) lt.eq e^M Q_j$; inside a bad component one uses the prefix estimate. Applying the bound at the endpoints $j_r$ just selected proves (8.5). This uses only a subsequence with $Q_j = O \( S_j \)$, never an all-time bound on $q \( s \) \/ s$. ◻
]

Lemmas 28, 29, and 30, together with the homological construction, complete the proof of Proposition 27.

== 9 Convergence and surjectivity of the coordinates <sec:uniformization>

We now pass from the polynomial models to a global map. The local errors must remain small under backward polynomial iteration, and the subsequential forward degree bound must then rule out a proper image. We give both steps with their domains and parameter choices.

=== 9.1 Parameter order and local error estimates <parameter-order-and-local-error-estimates>

Decrease the common chart exponent $sigma$ of Proposition 26, if necessary, so that $0 < sigma < 1$. Choose

#[#set math.equation(numbering: n => "(9.1)")
 $ 0 < gamma < gamma' < min { sigma \/ 2 \, 1 } \, #h(2em) 0 < 10 nu < min { c gamma \, sigma \, gamma \, 1 } \, $ <eq:unif:decay-parameters>]

with $gamma$ in the range of its small-ball transition estimate; decrease its constant $c$ to at most one. Fix the jet order so large that

#[#set math.equation(numbering: n => "(9.2)")
 $ \( d + 1 \) nu > 30 . $ <eq:unif:jet-order>]

Only after this choice fix a sufficiently small $h > 0$, as specified below. Then choose $N \, M \, b \, K_0 \, lambda$ as in Section 8, and finally choose a sufficiently late regular macro start. The estimates in Proposition 27 hold for this choice.

On a fixed smaller raw transition ball, the jet conjugacy and Cauchy estimates give

#[#set math.equation(numbering: n => "(9.3)")
 $ \| H_(k + 1) F_k \( z \) - G_k H_k \( z \) \| lt.eq exp #scale(x: 120%, y: 120%)[\(] A_d Delta s_k + o \( s_k \) #scale(x: 120%, y: 120%)[\)] \| \| z^(d + 1) . $ <eq:unif:remainder>]

Here $A_d$ is independent of $h$. Indeed the degrees of the polynomials in this expression are fixed, the $F_k$ are uniformly bounded on a larger raw ball, and the coefficient estimates of Proposition 27 bound the two compositions there. They agree through degree $d$, so the Cauchy remainder has the displayed factor. This argument uses $H_(k + 1) F_k - G_k H_k$ directly; it requires no uniform analytic domain for $H_k^(- 1)$.

We shall use two sequences of raw chart coordinates:

+ $z_k = f_(s_k) \( x \)$, uniformly for $x$ in any fixed compact neighborhood in the exhaustion and all sufficiently large $k$;
+ $z_k = F_(s_a \, s_k) \( z \)$, uniformly for $\| \| z lt.eq e^(- gamma s_a)$, for any sufficiently large $a$ and all $k gt.eq a$.

In the first case the threshold may depend on the compact; in the second it is uniform in $a$. Continuation and composition of the transition germs give $z_(k + 1) = F_k \( z_k \)$ in both cases. The chart estimates and (9.1) imply, eventually,

#[#set math.equation(numbering: n => "(9.4)")
 $ \| z_k \| lt.eq e^(- 5 nu s_k) \, #h(2em) zeta_k := H_k \( z_k \) \, quad \| zeta_k \| lt.eq e^(- 2 nu s_k) . $ <eq:unif:small-orbits>]

In regime (ii), the case $k = a$ uses $F_(s_a \, s_a) = "Id"$ and $gamma > 10 nu$.

Choose $h$ so small that, with $delta = e^h - 1$,

#[#set math.equation(numbering: n => "(9.5)")
 $ delta < 1 / 10 \, #h(2em) A_d delta < 1 \, #h(2em) C_d delta < nu \/ 4 \, $ <eq:unif:macro-choice>]

enlarging $A_d \, C_d$ first to cover the finitely many fixed-degree coefficient estimates used here. By (9.2)–(9.4), after the late start the defect satisfies

#[#set math.equation(numbering: n => "(9.6)")
 $ r_k := zeta_(k + 1) - G_k \( zeta_k \) \, #h(2em) \| r_k \| lt.eq e^(- 10 s_k) . $ <eq:unif:orbit-defect>]

All constants dependent on $h \, N \, M$ multiply $o \( s_k \)$ in this argument and are absorbed only by that late start. In particular, (9.5) does not require choosing $h$ using a constant which is itself determined by $M$.

The inverse maps have the local Lipschitz bound

#[#set math.equation(numbering: n => "(9.7)")
 $ "Lip" (G_k^(- 1) \|_(B \( e^(- nu s_(k + 1)) \))) lt.eq e^(Delta s_k) $ <eq:unif:inverse-tube>]

at all sufficiently large indices. To check it, the derivative of $G_k^(- 1)$ on this ball is bounded by the sum of

$ s_k^C e^(Delta s_k \/ 2) quad upright("and") quad exp #scale(x: 120%, y: 120%)[\(] C_d Delta s_k + o \( s_k \) - nu s_(k + 1) #scale(x: 120%, y: 120%)[\)] . $

The first term is at most $e^(3 Delta s_k \/ 4)$ eventually, since $Delta s_k gt.eq c_h sqrt(s_k)$. The second tends to zero by (9.5); their sum is at most $e^(Delta s_k)$ after increasing the starting index. Integrating the derivative along segments in this convex ball gives (9.7).

=== 9.2 Backward approximation inside valid tubes <backward-approximation-inside-valid-tubes>

#thm([Lemma 9.1.])[
  (Convergence of corrected coordinates).  #emph[For either raw sequence above and every sufficiently large $k$, 
$ xi_k = lim_(l arrow.r oo) G_(k \, l)^(- 1) zeta_l $

 exists locally uniformly in the indicated variables. It is holomorphic and satisfies 
#[#set math.equation(numbering: n => "(9.8)")
 $ \| xi_k - zeta_k \| lt.eq e^(- 6 s_k) \, #h(2em) xi_(k + 1) = G_k xi_k . $ <eq:unif:shadow>]

 All applications of (9.7) take place inside its stated balls.]
] <lem:unif:backward-limit>

#proof[
  For a terminal index $l$ put $y_l^(\( l \)) = zeta_l$ and $y_i^(\( l \)) = G_i^(- 1) y_(i + 1)^(\( l \))$ for $i < l$. Simultaneously establish, by backward induction, that the comparison segments at step $i$ lie in $B \( e^(- nu s_(i + 1)) \)$ and that
  #[#set math.equation(numbering: n => "(9.9)")
   $ \| y_k^(\( l \)) - zeta_k \| lt.eq sum_(i = k)^(l - 1) e^(- 10 s_i) exp \( s_(i + 1) - s_k \) . $ <eq:unif:finite-error-sum>]
  The terminal assertion is immediate. At a backward step compare $G_i^(- 1) y_(i + 1)^(\( l \))$ with $G_i^(- 1) G_i zeta_i = zeta_i$. Both arguments are close to $zeta_(i + 1)$: the first by the inductive bound and the second by (9.6). Since $\| zeta_(i + 1) \| lt.eq e^(- 2 nu s_(i + 1))$, they and their joining segment lie in the required larger tube whenever the error sum has the bound asserted below. Applying (9.7) then gives the next error sum.
  Indeed $s_(i + 1) lt.eq \( 1 + delta \) s_i$ and the grid eventually has spacing at least one, so
  $ sum_(i gt.eq k) e^(- 10 s_i + s_(i + 1) - s_k) lt.eq e^(- s_k) sum_(i gt.eq k) e^(- \( 9 - delta \) s_i) lt.eq C e^(- \( 10 - delta \) s_k) lt.eq e^(- 6 s_k) . $
  As $nu < 1 \/ 10$, this is much smaller than the difference between the two tube radii. The estimates therefore close the simultaneous induction without evaluating an inverse outside its proved domain.
  For completeness, consecutive terminal approximations are Cauchy by the same reasoning. At level $l$ their difference is at most $e^(Delta s_l) e^(- 10 s_l)$, and propagation down to $k$ bounds it by $e^(- 10 s_l + s_(l + 1) - s_k)$. These bounds are summable in $l$. They are uniform on the compact sets in either regime, so the limits are holomorphic. The finite identities give $xi_(k + 1) = G_k xi_k$, and the infinite error sum proves (9.8). ◻
]

=== 9.3 A coherent injective map on the manifold <a-coherent-injective-map-on-the-manifold>

#thm([Proposition 9.2.])[
  (Global coordinates).  #emph[The locally uniform limit on the exhaustion 
#[#set math.equation(numbering: n => "(9.10)")
 $ Psi \( x \) = lim_(l arrow.r oo) G_(0 \, l)^(- 1) H_l f_(s_l) \( x \) $ <eq:unif:global-map>]

 defines an injective holomorphic map $M arrow.r bb(C)^n$ with $Psi \( o \) = 0$. Its image $Omega$ is open, and $Psi : M arrow.r Omega$ is a biholomorphism. Moreover, on every compact $K subset Omega$, 
#[#set math.equation(numbering: n => "(9.11)")
 $ sup_K \| G_(0 \, k) \| lt.eq e^(- \( sigma \/ 2 \) s_k) quad upright("eventually") \, $ <eq:unif:forward-smallness>]

 and, at every sufficiently large $k$, 
#[#set math.equation(numbering: n => "(9.12)")
 $ G_(0 \, k)^(- 1) #scale(x: 120%, y: 120%)[\(] B \( e^(- gamma' s_k) \) #scale(x: 120%, y: 120%)[\)] subset Omega . $ <eq:unif:inverse-ball-inclusion>]

]
] <prop:global-coordinates>

#proof[
  On a fixed exhaustion compact choose an index $k$ after which regime (i) is available. Lemma 31 gives $xi_k$ there, and composing it with the single fixed polynomial automorphism $G_(0 \, k)^(- 1)$ gives the limit (9.10). On overlaps the inverse charts agree by continuation, and (9.8) makes the limits agree. Thus these maps define a holomorphic $Psi$ on all of $M$. All maps fix zero in charts, so $Psi \( o \) = 0$.
  Suppose $Psi \( x \) = Psi \( y \)$ for two fixed points. For every large $k$, $G_(0 \, k) Psi = xi_k$ on a compact containing them, and hence (9.8) implies
  $ \| H_k f_(s_k) \( x \) - H_k f_(s_k) \( y \) \| lt.eq 2 e^(- 6 s_k) . $
  On the tiny raw-coordinate ball containing these points, write $H_k \( z \) = A_k z + E_k \( z \)$, where $A_k = H'_k \( 0 \)$ has conorm at least $s_k^(- C)$ and $lr(bar.v.double D E_k bar.v.double)$ is bounded by $exp \( o \( s_k \) \)$ times the radius. Integrating only $D E_k$ along the segment and retaining the fixed linear term $A_k$ gives
  $ \| H_k \( z \) - H_k \( w \) \| gt.eq #scale(x: 120%, y: 120%)[\(] s_k^(- C) - sup lr(bar.v.double D E_k bar.v.double) #scale(x: 120%, y: 120%)[\)] \| z - w \| . $
  The nonlinear error is eventually less than $s_k^(- C) \/ 2$, so
  #[#set math.equation(numbering: n => "(9.13)")
   $ \| f_(s_k) \( x \) - f_(s_k) \( y \) \| lt.eq e^(- 5 s_k) $ <eq:unif:raw-separation>]
  eventually.
  If $x eq.not y$, choose a small relatively compact initial metric ball about $x$ whose closure excludes $y$. Map the straight segment between the two raw coordinates by $Phi_(s_k)$, obtaining a path from $x$ to $y$. The segment stays in the uniform chart ball. Up to its first exit from the fixed ball about $x$, the compact metric comparison $e^(- 2 s_k) g lt.eq h_(t \( s_k \))$ from Proposition 23, and the uniform chart upper bound $Phi_(s_k)^(*) h_(t \( s_k \)) lt.eq C g_(upright("Eucl"))$, bound its initial-metric length by $C e^(s_k) e^(- 5 s_k)$. This tends to zero and cannot reach the boundary of that fixed ball. The contradiction proves injectivity. This argument uses immersed charts only on their indicated sheet; it requires no global injectivity of $Phi_(s_k)$.
  Nonsingularity follows directly from the same quantitative estimates. Fix a point and two coordinate neighborhoods $U subset.double V$ whose closures lie in one compact exhaustion set. The estimates of regime (i) hold uniformly on $overline(V)$ for every sufficiently large $k$. Differentiating $Phi_(s_k) f_(s_k) = "Id"$, and using (7.12) and (7.21), gives
  $ \| d f_(s_k) \( v \) \| gt.eq c e^(- s_k) \| v \|_g quad upright("on ") overline(V) . $
  The coefficient bounds on $H_k$, its polynomially bounded inverse linear part, and $\| f_(s_k) \| lt.eq e^(- sigma s_k)$ therefore imply
  $ \| d \( H_k f_(s_k) \) \( v \) \| gt.eq c s_k^(- C) e^(- s_k) \| v \|_g . $
  On the other hand, the shadow bound $\| xi_k - H_k f_(s_k) \| lt.eq e^(- 6 s_k)$ on $overline(V)$ and Cauchy’s estimate on the fixed pair $U subset.double V$ bound its differential on $U$ by $C e^(- 6 s_k) \| v \|_g$. Thus
  $ \| d xi_k \( v \) \| gt.eq #scale(x: 120%, y: 120%)[\(] c s_k^(- C) e^(- s_k) - C e^(- 6 s_k) #scale(x: 120%, y: 120%)[\)] \| v \|_g > 0 #h(2em) \( v eq.not 0 \) $
  for all sufficiently large $k$. Since $xi_k = G_(0 \, k) Psi$ and $G_(0 \, k)$ is a polynomial automorphism, $d Psi$ is nonsingular. The holomorphic inverse theorem now makes the image $Omega$ open; the local inverses agree by the proved injectivity, giving a holomorphic inverse on $Omega$. Consequently $K' = Psi^(- 1) \( K \)$ is compact whenever $K subset Omega$ is compact. On $K'$, the common chart bound $\| f_(s_k) \| lt.eq e^(- sigma s_k)$, the coefficient bound on $H_k$, and (9.8) give
  $ sup_K \| G_(0 \, k) \| lt.eq exp #scale(x: 120%, y: 120%)[\(] - sigma s_k + o \( s_k \) #scale(x: 120%, y: 120%)[\)] + e^(- 6 s_k) \, $
  which proves (9.11).
  It remains to prove the ball inclusion. Fix a sufficiently large $k$ and use regime (ii) with $a = k$. For large $l$, the inverse chart $f_(s_l)$ is defined on the compact image under $Phi_(s_k)$ of the closed ball $overline(B) \( e^(- gamma s_k) \)$. The identity $f_(s_l) Phi_(s_k) = F_(s_k \, s_l)$ holds first as a germ at zero and then throughout that ball by holomorphic continuation. Therefore Lemma 31 gives
  #[#set math.equation(numbering: n => "(9.14)")
   $ sup_(\| \| z lt.eq e^(- gamma s_k)) \| G_(0 \, k) Psi Phi_(s_k) \( z \) - H_k \( z \) \| lt.eq e^(- 6 s_k) . $ <eq:unif:chart-shadow>]
  Write $A = H'_k \( 0 \)$, $r = e^(- gamma s_k)$, and
  $ T_k = G_(0 \, k) Psi Phi_(s_k) \, #h(2em) E_k \( z \) = T_k \( z \) - A z . $
  The map $T_k$ is holomorphic on the fixed chart ball, and fixes zero. Its shadow estimate and the coefficient bound on $H_k$ give
  $ E_k \( 0 \) = 0 \, #h(2em) lr(bar.v.double A^(- 1) bar.v.double) lt.eq s_k^C \, #h(2em) sup_(\| \| z lt.eq r) \| E_k \( z \) \| lt.eq exp \( o \( s_k \) \) r^2 + e^(- 6 s_k) . $
  Cauchy’s estimate on the smaller ball then gives
  $ sup_(\| \| z lt.eq r \/ 2) lr(bar.v.double A^(- 1) D E_k \( z \) bar.v.double) lt.eq C_n s_k^C #scale(x: 120%, y: 120%)[\(] exp \( o \( s_k \) \) r + e^(- 6 s_k) \/ r #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $
  For large $k$ this supremum is at most $1 \/ 4$. Moreover, $gamma' > gamma$ implies $\| A^(- 1) w \| lt.eq r \/ 4$ whenever $\| w \| lt.eq e^(- gamma' s_k)$, after increasing the starting index once more. For such a target $w$, the map
  $ z mapsto A^(- 1) w - A^(- 1) E_k \( z \) $
  is $1 \/ 4$-Lipschitz on $overline(B) \( r \/ 2 \)$ and maps this closed ball into $B \( 3 r \/ 8 \)$, because $E_k \( 0 \) = 0$. Its successive iterates are Cauchy, stay in the closed ball, and converge to a fixed point $z$. The fixed-point identity is $T_k \( z \) = w$. Therefore $B \( e^(- gamma' s_k) \) subset G_(0 \, k) \( Omega \)$, which is precisely (9.12). ◻
]

=== 9.4 The image is all of affine space <sec:surjectivity>

We first record the polynomial growth estimate used in the final step. For a vector polynomial $P$ of degree at most $m$ and $0 < R_1 < R_2$,

#[#set math.equation(numbering: n => "(9.15)")
 $ sup_(B \( R_2 \)) \| \| P lt.eq \( R_2 \/ R_1 \)^m sup_(B \( R_1 \)) \| \| P . $ <eq:unif:polynomial-growth>]

To verify this, restrict each scalar dual pairing of $P$ to a complex line through zero. The maximum principle in the exterior of the radius-$R_1$ disc, applied to the polynomial divided by $z^m$ including its removable value at infinity, gives the scalar bound. Taking the supremum over unit dual vectors and lines proves (9.15).

#proof[
  The preceding analytic and chart constructions, followed by Propositions 27 and 32, give a biholomorphism $Psi : M arrow.r Omega$ onto an open set containing zero, with the forward smallness and inverse-ball inclusion proved above. It remains to show that $Omega = bb(C)^n$.
  Suppose $R_(*) = sup { R > 0 : B \( R \) subset Omega } < oo$. It is positive because $0 in Omega$ and $Omega$ is open. By (8.5) there is an unbounded subsequence with $deg G_(0 \, k) lt.eq D s_k$ for some finite $D$. Choose $0 < R_1 < R_(*) < R_2$ so close to $R_(*)$ that
  #[#set math.equation(numbering: n => "(9.16)")
   $ D log \( R_2 \/ R_1 \) < sigma \/ 2 - gamma' . $ <eq:unif:radii-choice>]
  The closed smaller ball lies compactly in $Omega$: it lies inside some still larger centered ball of radius below $R_(*)$. By (9.11), (9.15), and (9.16), the chosen subsequence satisfies
  $ sup_(B \( R_2 \)) \| G_(0 \, k) \| lt.eq exp [- sigma / 2 s_k + D s_k log \( R_2 \/ R_1 \)] < e^(- gamma' s_k) $
  for all sufficiently large indices. Equation (9.12) then implies $B \( R_2 \) subset Omega$, contradicting the definition of $R_(*)$. Therefore $R_(*) = oo$, and $Omega = bb(C)^n$.
  The map $Psi$ in (9.10) is consequently a biholomorphism $M arrow.r bb(C)^n$. ◻
]

The surjectivity step used the degrees of the forward compositions $G_(0 \, k)$ on their available subsequence; no degree estimate for their inverses, or uniform instantaneous contraction ratio, is required.

#heading(level: 1)[References]
#bibitem([1])[A.~D.~Aleksandrov, #emph[Almost everywhere existence of the second differential of a convex function and some properties of convex surfaces connected with it], Uchenye Zapiski Leningradskogo Gosudarstvennogo Universiteta, no.~37, Seriya Matematicheskikh Nauk #strong[6] (1939), 3--35 (Russian).]
#bibitem([2])[E.~Andersén, #emph[Volume-preserving automorphisms of $bb(C)^n$], Complex Variables Theory Appl. #strong[14] (1990), nos.~1--4, 223--235. #link("https://doi.org/10.1080/17476939008814422")[doi:10.1080/17476939008814422].]
#bibitem([3])[S.~Bera and K.~Verma, #emph[Uniform non-autonomous basins of attraction], Invent. Math. #strong[238] (2024), 995--1040. #link("https://doi.org/10.1007/s00222-024-01295-9")[doi:10.1007/s00222-024-01295-9]\; #link("https://arxiv.org/abs/2211.15169v4")[arXiv:2211.15169v4].]
#bibitem([4])[B.~Berndtsson and J.-P.~Rosay, #emph[Quasi-isometric vector bundles and bounded factorization of holomorphic matrices], Ann. Inst. Fourier (Grenoble) #strong[53] (2003), no.~3, 885--901. #link("https://doi.org/10.5802/aif.1964")[doi:10.5802/aif.1964].]
#bibitem([5])[M.~Braverman, O.~Milatovic, and M.~A.~Shubin, #emph[Essential self-adjointness of Schrödinger-type operators on manifolds], Russian Math. Surveys #strong[57] (2002), no.~4, 641--692. #link("https://doi.org/10.1070/RM2002v057n04ABEH000532")[doi:10.1070/RM2002v057n04ABEH000532]\; #link("https://arxiv.org/abs/math/0201231v3")[arXiv:math/0201231v3].]
#bibitem([6])[H.-D.~Cao, #emph[On Harnack's inequalities for the Kähler--Ricci flow], Invent. Math. #strong[109] (1992), 247--263. #link("https://doi.org/10.1007/BF01232027")[doi:10.1007/BF01232027].]
#bibitem([7])[A.~Chau and L.-F.~Tam, #emph[On the complex structure of Kähler manifolds with nonnegative curvature], J. Differential Geom. #strong[73] (2006), no.~3, 491--530. #link("https://doi.org/10.4310/jdg/1146169936")[doi:10.4310/jdg/1146169936]\; #link("https://arxiv.org/abs/math/0504422v3")[arXiv:math/0504422v3].]
#bibitem([8])[A.~Chau and L.-F.~Tam, #emph[On the simply connectedness of nonnegatively curved Kähler manifolds and applications], Trans. Amer. Math. Soc. #strong[363] (2011), no.~12, 6291--6308. #link("https://doi.org/10.1090/S0002-9947-2011-05223-2")[doi:10.1090/S0002-9947-2011-05223-2]\; #link("https://arxiv.org/abs/0806.2457v1")[arXiv:0806.2457v1].]
#bibitem([9])[A.~Chau and L.-F.~Tam, #emph[On the Steinness of a class of Kähler manifolds], J. Differential Geom. #strong[79] (2008), no.~2, 167--183. #link("https://doi.org/10.4310/jdg/1211512638")[doi:10.4310/jdg/1211512638]\; #link("https://arxiv.org/abs/math/0610535v2")[arXiv:math/0610535v2].]
#bibitem([10])[B.-L.~Chen and X.-P.~Zhu, #emph[Volume growth and curvature decay of positively curved Kähler manifolds], Pure Appl. Math. Q. #strong[1] (2005), no.~1, 68--108. #link("https://doi.org/10.4310/PAMQ.2005.v1.n1.a4")[doi:10.4310/PAMQ.2005.v1.n1.a4]\; #link("https://arxiv.org/abs/math/0211374v1")[arXiv:math/0211374v1].]
#bibitem([11])[B.-L.~Chen and X.-P.~Zhu, #emph[Positively curved complete noncompact Kähler manifolds], Acta Math. Sci. Ser. B (Engl. Ed.) #strong[29] (2009), no.~4, 829--845. #link("https://doi.org/10.1016/S0252-9602(09)60073-4")[doi:10.1016/S0252-9602(09)60073-4]\; #link("https://arxiv.org/abs/math/0211373v1")[arXiv:math/0211373v1].]
#bibitem([12])[J.~Chu, #emph[$C^(2 \, alpha)$ regularities and estimates for nonlinear elliptic and parabolic equations in geometry], Calc. Var. Partial Differential Equations #strong[55] (2016), article~8. #link("https://doi.org/10.1007/s00526-015-0948-5")[doi:10.1007/s00526-015-0948-5]\; #link("https://arxiv.org/abs/1410.3354v3")[arXiv:1410.3354v3].]
#bibitem([13])[S.~Cohn-Vossen, #emph[Kürzeste Wege und Totalkrümmung auf Flächen], Compositio Math. #strong[2] (1935), 69--133. #link("https://www.numdam.org/item/CM_1935__2__69_0/").]
#bibitem([14])[T.~Coulhon and A.~Sikora, #emph[Gaussian heat kernel upper bounds via the Phragmén--Lindelöf theorem], Proc. Lond. Math. Soc. (3) #strong[96] (2008), no.~2, 507--544. #link("https://doi.org/10.1112/plms/pdm050")[doi:10.1112/plms/pdm050]\; #link("https://arxiv.org/abs/math/0609429v1")[arXiv:math/0609429v1].]
#bibitem([15])[M.~G.~Crandall, H.~Ishii, and P.-L.~Lions, #emph[User's guide to viscosity solutions of second order partial differential equations], Bull. Amer. Math. Soc. (N.S.) #strong[27] (1992), no.~1, 1--67. #link("https://doi.org/10.1090/S0273-0979-1992-00266-5")[doi:10.1090/S0273-0979-1992-00266-5]\; #link("https://arxiv.org/abs/math/9207212v1")[arXiv:math/9207212v1].]
#bibitem([16])[Truong Dinh Dat, #emph[An $m$-Hessian approach to Yau uniformization conjecture], preprint (2026), #link("https://arxiv.org/abs/2609.18171v1")[arXiv:2609.18171v1].]
#bibitem([17])[Ved Datar, Vamsi Pritham Pingali, and Harish Seshadri, #emph[Uniformisation of complete Kähler surfaces with positive sectional curvature], preprint (2026), #link("https://arxiv.org/abs/2604.11220v1")[arXiv:2604.11220v1].]
#bibitem([18])[Ved V.~Datar, Vamsi Pritham Pingali, and Harish Seshadri, #emph[The top Yau--Yang conjecture for Kähler manifolds with positive sectional curvature], preprint (2026), #link("https://arxiv.org/abs/2606.19806v1")[arXiv:2606.19806v1].]
#bibitem([19])[J.-P.~Demailly, #emph[Estimations $L^2$ pour l'opérateur $macron(partial)$ d'un fibré vectoriel holomorphe semi-positif au-dessus d'une variété kählérienne complète], Ann. Sci. École Norm. Sup. (4) #strong[15] (1982), no.~3, 457--511. #link("https://doi.org/10.24033/asens.1434")[doi:10.24033/asens.1434].]
#bibitem([20])[J.-P.~Demailly, #emph[Complex Analytic and Differential Geometry], Open Content Book, version of June~21, 2012. #link("https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf").]
#bibitem([21])[L.~C.~Evans, #emph[Partial Differential Equations], second edition, Graduate Studies in Mathematics, vol.~19, American Mathematical Society, Providence, RI, 2010.]
#bibitem([22])[F.~Forstnerič and F.~Lárusson, #emph[Oka properties of groups of holomorphic and algebraic automorphisms of complex affine space], Math. Res. Lett. #strong[21] (2014), no.~5, 1047--1067. #link("https://doi.org/10.4310/MRL.2014.v21.n5.a7")[doi:10.4310/MRL.2014.v21.n5.a7]\; #link("https://arxiv.org/abs/1402.4342v3")[arXiv:1402.4342v3].]
#bibitem([23])[D.~Gilbarg and N.~S.~Trudinger, #emph[Elliptic Partial Differential Equations of Second Order], second edition, reprint of the 1998 edition, Classics in Mathematics, Springer-Verlag, Berlin, 2001. #link("https://doi.org/10.1007/978-3-642-61798-0")[doi:10.1007/978-3-642-61798-0].]
#bibitem([24])[R.~E.~Greene and H.~Wu, #emph[$C^oo$ approximations of convex, subharmonic, and plurisubharmonic functions], Ann. Sci. École Norm. Sup. (4) #strong[12] (1979), no.~1, 47--84. #link("https://doi.org/10.24033/asens.1361")[doi:10.24033/asens.1361].]
#bibitem([25])[R.~E.~Greene and H.~Wu, #emph[$C^oo$ convex functions and manifolds of positive curvature], Acta Math. #strong[137] (1976), 209--245. #link("https://doi.org/10.1007/BF02392418")[doi:10.1007/BF02392418].]
#bibitem([26])[M.~Gromov, #emph[Curvature, diameter and Betti numbers], Comment. Math. Helv. #strong[56] (1981), 179--195. #link("https://doi.org/10.1007/BF02566208")[doi:10.1007/BF02566208].]
#bibitem([27])[C.~D.~Hill and M.~Taylor, #emph[Integrability of rough almost complex structures], J. Geom. Anal. #strong[13] (2003), no.~1, 163--172. #link("https://doi.org/10.1007/BF02931002")[doi:10.1007/BF02931002]\; #link("https://arxiv.org/abs/0710.2310v2")[arXiv:0710.2310v2].]
#bibitem([28])[L.~Hörmander, #emph[$L^2$ estimates and existence theorems for the $macron(partial)$ operator], Acta Math. #strong[113] (1965), 89--152. #link("https://doi.org/10.1007/BF02391775")[doi:10.1007/BF02391775].]
#bibitem([29])[A.~Huber, #emph[On subharmonic functions and differential geometry in the large], Comment. Math. Helv. #strong[32] (1957/58), 13--72. #link("https://doi.org/10.1007/BF02564570")[doi:10.1007/BF02564570].]
#bibitem([30])[F.~John, #emph[Extremum problems with inequalities as subsidiary conditions], in #emph[Studies and Essays Presented to R.~Courant on his 60th Birthday, January 8, 1948], Interscience, New York, 1948, pp.~187--204. #link("https://doi.org/10.1007/978-3-0348-0439-4_9")[Publisher's later reprint].]
#bibitem([31])[B.~L.~Kotschwar, #emph[A local version of Bando's theorem on the real-analyticity of solutions to the Ricci flow], Bull. Lond. Math. Soc. #strong[45] (2013), no.~1, 153--158. #link("https://doi.org/10.1112/blms/bds074")[doi:10.1112/blms/bds074]\; #link("https://arxiv.org/abs/1111.0355v1")[arXiv:1111.0355v1].]
#bibitem([32])[O.~A.~Ladyzhenskaya, V.~A.~Solonnikov, and N.~N.~Ural'tseva, #emph[Linear and Quasi-linear Equations of Parabolic Type], translated by S.~Smith, Translations of Mathematical Monographs, vol.~23, American Mathematical Society, Providence, RI, 1968; reprinted with corrections, 1988.]
#bibitem([33])[F.~Lárusson and R.~Sigurdsson, #emph[Plurisubharmonicity of envelopes of disc functionals on manifolds], J. reine angew. Math. #strong[555] (2003), 27--38. #link("https://doi.org/10.1515/crll.2003.013")[doi:10.1515/crll.2003.013]\; #link("https://arxiv.org/abs/math/0111251v2")[arXiv:math/0111251v2].]
#bibitem([34])[M.-C.~Lee and L.-F.~Tam, #emph[Chern--Ricci flows on noncompact complex manifolds], J. Differential Geom. #strong[115] (2020), no.~3, 529--564. #link("https://doi.org/10.4310/jdg/1594260018")[doi:10.4310/jdg/1594260018]\; #link("https://arxiv.org/abs/1708.00141v2")[arXiv:1708.00141v2].]
#bibitem([35])[P.~Li and R.~Schoen, #emph[$L^p$ and mean value properties of subharmonic functions on Riemannian manifolds], Acta Math. #strong[153] (1984), 279--301. #link("https://doi.org/10.1007/BF02392380")[doi:10.1007/BF02392380].]
#bibitem([36])[P.~Li and S.-T.~Yau, #emph[On the parabolic kernel of the Schrödinger operator], Acta Math. #strong[156] (1986), 153--201. #link("https://doi.org/10.1007/BF02399203")[doi:10.1007/BF02399203].]
#bibitem([37])[G.~Liu, #emph[Three circle theorems on Kähler manifolds and applications], preprint (2013; version~3, 2014), #link("https://arxiv.org/abs/1308.0710v3")[arXiv:1308.0710v3]. The cited plurisubharmonic Liouville theorem is Theorem~9 of this version.]
#bibitem([38])[G.~Liu, #emph[On Yau's uniformization conjecture], Camb. J. Math. #strong[7] (2019), nos.~1--2, 33--70. #link("https://doi.org/10.4310/CJM.2019.v7.n1.a2")[doi:10.4310/CJM.2019.v7.n1.a2]\; #link("https://arxiv.org/abs/1606.08958v2")[arXiv:1606.08958v2].]
#bibitem([39])[A.~McIntosh and A.~J.~Morris, #emph[Finite propagation speed for first order systems and Huygens' principle for hyperbolic equations], Proc. Amer. Math. Soc. #strong[141] (2013), no.~10, 3515--3527. #link("https://doi.org/10.1090/S0002-9939-2013-11661-8")[doi:10.1090/S0002-9939-2013-11661-8]\; #link("https://arxiv.org/abs/1201.1818v2")[arXiv:1201.1818v2].]
#bibitem([40])[N.~Mok, #emph[An embedding theorem of complete Kähler manifolds of positive bisectional curvature onto affine algebraic varieties], Bull. Soc. Math. France #strong[112] (1984), 197--258. #link("https://doi.org/10.24033/bsmf.2005")[doi:10.24033/bsmf.2005].]
#bibitem([41])[S.~Mori, #emph[Projective manifolds with ample tangent bundles], Ann. of Math. (2) #strong[110] (1979), no.~3, 593--606. #link("https://doi.org/10.2307/1971241")[doi:10.2307/1971241].]
#bibitem([42])[A.~Newlander and L.~Nirenberg, #emph[Complex analytic coordinates in almost complex manifolds], Ann. of Math. (2) #strong[65] (1957), no.~3, 391--404. #link("https://doi.org/10.2307/1970051")[doi:10.2307/1970051].]
#bibitem([43])[L.~Ni and L.-F.~Tam, #emph[Poincaré--Lelong equation via the Hodge--Laplace heat equation], Compos. Math. #strong[149] (2013), 1856--1870. #link("https://doi.org/10.1112/S0010437X12000322")[doi:10.1112/S0010437X12000322]\; #link("https://arxiv.org/abs/1109.6102v2")[arXiv:1109.6102v2].]
#bibitem([44])[L.~Ni and L.-F.~Tam, #emph[Plurisubharmonic functions and the structure of complete Kähler manifolds with nonnegative curvature], J. Differential Geom. #strong[64] (2003), no.~3, 457--524. #link("https://doi.org/10.4310/jdg/1090427001")[doi:10.4310/jdg/1090427001]\; #link("https://arxiv.org/abs/math/0304096v1")[arXiv:math/0304096v1].]
#bibitem([45])[E.~A.~Poletsky, #emph[Plurisubharmonic functions as solutions of variational problems], in #emph[Several Complex Variables and Complex Geometry], Part~1 (Santa Cruz, CA, 1989), Proc. Sympos. Pure Math., vol.~52, Part~1, American Mathematical Society, Providence, RI, 1991, pp.~163--171. #link("https://doi.org/10.1090/pspum/052.1/1128523")[doi:10.1090/pspum/052.1/1128523].]
#bibitem([46])[R.~Richberg, #emph[Stetige streng pseudokonvexe Funktionen], Math. Ann. #strong[175] (1968), 257--286. #link("https://doi.org/10.1007/BF02063212")[doi:10.1007/BF02063212].]
#bibitem([47])[J.-P.~Rosay, #emph[Poletsky theory of disks on holomorphic manifolds], Indiana Univ. Math. J. #strong[52] (2003), no.~1, 157--170. #link("https://doi.org/10.1512/iumj.2003.52.2170")[doi:10.1512/iumj.2003.52.2170].]
#bibitem([48])[J.-P.~Rosay and W.~Rudin, #emph[Holomorphic maps from $bb(C)^n$ to $bb(C)^n$], Trans. Amer. Math. Soc. #strong[310] (1988), no.~1, 47--86. #link("https://doi.org/10.2307/2001110")[doi:10.2307/2001110].]
#bibitem([49])[W.-X.~Shi, #emph[Deforming the metric on complete Riemannian manifolds], J. Differential Geom. #strong[30] (1989), no.~1, 223--301. #link("https://doi.org/10.4310/jdg/1214443292")[doi:10.4310/jdg/1214443292].]
#bibitem([50])[Yuang Shi, #emph[Minimal degrees, volume growth, and curvature decay on complete Kähler manifolds], Int. Math. Res. Not. IMRN #strong[2026], article~rnag080; #link("https://arxiv.org/abs/2511.01263v3")[arXiv:2511.01263v3].]
#bibitem([51])[Y.-T.~Siu and S.-T.~Yau, #emph[Compact Kähler manifolds of positive bisectional curvature], Invent. Math. #strong[59] (1980), no.~2, 189--204. #link("https://doi.org/10.1007/BF01390043")[doi:10.1007/BF01390043].]
#bibitem([52])[P.~Souplet and Q.~S.~Zhang, #emph[Sharp gradient estimate and Yau's Liouville theorem for the heat equation on noncompact manifolds], Bull. London Math. Soc. #strong[38] (2006), no.~6, 1045--1053. #link("https://doi.org/10.1112/S0024609306018947")[doi:10.1112/S0024609306018947]\; #link("https://arxiv.org/abs/math/0502079v1")[arXiv:math/0502079v1].]
#bibitem([53])[The Stacks Project Authors, #emph[The Stacks Project], Lemma~10.51.4, "Krull's intersection theorem," Tag~00IP. #link("https://stacks.math.columbia.edu/tag/00IP") (accessed September~23, 2026).]
#bibitem([54])[G.~Teschl, #emph[Mathematical Methods in Quantum Mechanics: With Applications to Schrödinger Operators], Graduate Studies in Mathematics, vol.~99, American Mathematical Society, Providence, RI, 2009. #link("https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf")[Author's first-edition PDF, version 12 February 2009].]
#bibitem([55])[N.~Wiener and P.~Masani, #emph[The prediction theory of multivariate stochastic processes. I. The regularity condition], Acta Math. #strong[98] (1957), 111--150. #link("https://doi.org/10.1007/BF02404472")[doi:10.1007/BF02404472].]
#bibitem([56])[Jingcao Wu, #emph[Conditional uniformization of Kähler surfaces], preprint (2026), #link("https://arxiv.org/abs/2609.18506v1")[arXiv:2609.18506v1].]
#bibitem([57])[S.-T.~Yau, #emph[Survey on partial differential equations in differential geometry], in #emph[Seminar on Differential Geometry] (S.-T.~Yau, ed.), Ann. of Math. Stud., vol.~102, Princeton University Press, Princeton, NJ, and University of Tokyo Press, Tokyo, 1982, pp.~3--71. #link("https://doi.org/10.1515/9781400881918-002")[doi:10.1515/9781400881918-002] (digital reprint).]


