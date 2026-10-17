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

#align(center)[#text(size: 16pt, weight: "bold")[The logarithmic Brunn--Minkowski conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A convex body in $bb(R)^n$ is a compact convex set with nonempty interior. If $K = - K$, then $0$ lies in its interior. Its support function is

$ h_K \( u \) = max_(x in K) chevron.l x \, u chevron.r \, #h(2em) u in S^(n - 1) . $

For an origin-symmetric body this function is strictly positive. For a positive continuous function $f$ on the unit sphere, its #emph[Wulff body] is

$ cal(W) \[ f \] = ⋂_(u in S^(n - 1)) { x in bb(R)^n : chevron.l x \, u chevron.r lt.eq f \( u \) } . $

It is a convex body: it contains the ball of radius $min f > 0$ and is contained in the ball of radius $max f$. Write $\| K \|$ for $n$-dimensional Lebesgue measure. Our main result is the following.

#thm([Theorem 1.1.])[
  (Even logarithmic Brunn–Minkowski inequality).  #emph[Let $n gt.eq 1$ and let $K \, L subset bb(R)^n$ be convex bodies satisfying $K = - K$ and $L = - L$. For every $0 lt.eq lambda lt.eq 1$, 
#[#set math.equation(numbering: n => "(1.1)")
 $ lr(|cal(W) \[ h_K^(1 - lambda) h_L^lambda \]|) gt.eq \| K \|^(1 - lambda) \| L \|^lambda . $ <eq:main>]

]
] <thm:main>

The interpolation in (1.1) takes the geometric mean of the support bounds before intersecting the half-spaces. This gives a strengthening, in the symmetric setting, of the multiplicative form of the classical Brunn–Minkowski inequality: the arithmetic–geometric mean inequality gives

$ cal(W) \[ h_K^(1 - lambda) h_L^lambda \] subset \( 1 - lambda \) K + lambda L . $

In general $h_K^(1 - lambda) h_L^lambda$ need not itself be a support function. The intersection defining $cal(W)$ is essential throughout the argument.

For $0 < p < 1$, the $L_p$ interpolation replaces the geometric mean of the support bounds by the weighted power mean $\( \( 1 - lambda \) h_K^p + lambda h_L^p \)^(1 \/ p)$, still taking the Wulff body. The logarithmic endpoint implies the full symmetric volume inequality in this intermediate range. Böröczky, Lutwak, Yang and Zhang record this monotone implication #cite(label("BLZY2012")) equation (1.10) and the following paragraph, p. 1977. The additive volume-power form below follows by normalizing the bodies and reweighting the interpolation parameter.

#thm([Corollary 1.2.])[
  (Symmetric $L_p$ Brunn–Minkowski inequality).  #emph[Let $n gt.eq 1$, let $K \, L subset bb(R)^n$ be full-dimensional origin-symmetric convex bodies, and let $0 < p < 1$. For every $0 lt.eq lambda lt.eq 1$, 
#[#set math.equation(numbering: n => "(1.2)")
 $ lr(|cal(W) #h(-0.16667em) [#scale(x: 120%, y: 120%)[\(] \( 1 - lambda \) h_K^p + lambda h_L^p #scale(x: 120%, y: 120%)[\)]^(1 \/ p)]|)^(p \/ n) gt.eq \( 1 - lambda \) \| K \|^(p \/ n) + lambda \| L \|^(p \/ n) . $ <eq:lp>]

]
] <cor:lp>

The proof of Corollary 2 is given in Section 8.1.

The logarithmic volume theorem has a separate measure-theoretic consequence. An even log-concave density has the form $e^(- V)$, where $V$ is an even convex function with values in $bb(R) union { + oo }$; no probability normalization is required. Saroglou proved that the Lebesgue inequality in dimension $n$ implies the same Wulff inequality for every such density in that same dimension #cite(label("Saroglou2016")) Theorem 3.1. Taking two scalar dilates of a single body then gives the $\( B \)$-conjecture: for the measure $d mu = e^(- V \( x \)) thin d x$ and every origin-symmetric convex body $K$, the function $t mapsto mu \( e^t K \)$ is log-concave on $bb(R)$ #cite(label("Saroglou2016")) Corollary 3.2. Section 8.2 applies this transfer and also treats even log-concave Radon measures supported on proper subspaces.

=== Context and prior work <context-and-prior-work>

Theorem 1 resolves the origin-symmetric logarithmic Brunn–Minkowski conjecture of Böröczky, Lutwak, Yang and Zhang #cite(label("BLZY2012")) Problem 1.1. Stancu #cite(label("Stancu2018")) Theorem 2, p. 3264 announced the all-dimensional logarithmic Minkowski inequality and explicitly concluded the equivalent logarithmic Brunn–Minkowski inequality; the report deferred details of the flow asymptotics. The conjecture belongs to the $L_p$ Brunn–Minkowski theory initiated by Firey’s $p$-means of convex bodies #cite(label("Firey1962")) and developed by Lutwak through $L_p$ mixed volumes and the $L_p$ Minkowski problem #cite(label("Lutwak1993")). For $p > 0$, the support bounds are interpolated by the weighted power mean appearing in Corollary 2; the geometric mean is its limit as $p arrow.b 0$. This endpoint has a particularly close connection with cone-volume measures and the logarithmic Minkowski problem. The cone-volume measure records the volumes of cones from the origin to boundary patches, indexed by their outer normals. Böröczky, Lutwak, Yang and Zhang established the equivalence between the corresponding logarithmic volume and mixed-volume inequalities #cite(label("BLZY2012")) Lemma 3.2; their subsequent work characterized which even measures arise as cone-volume measures #cite(label("BLYZ2013")) Theorem 1.1. The latter is an existence result, separate from the volume inequality proved here.

Several important classes were established in earlier work. Böröczky, Lutwak, Yang and Zhang proved the planar case #cite(label("BLZY2012")) Theorem 1.3. Saroglou established the inequality and studied its equality cases for bodies unconditional with respect to the same orthonormal basis, meaning that both bodies are invariant under every coordinate sign change in that basis #cite(label("Saroglou2015")) Theorem 1.2. The underlying volume inequality for coordinatewise products has antecedents in Uhrin, Bollobás–Leader, and Cordero-Erausquin–Fradelizi–Maurey #cite(label("Uhrin1994")) #cite(label("BollobasLeader1995")) #cite(label("CFM2004")); Saroglou connected this product to the logarithmic combination. This argument uses the multiplicative form of the Prékopa–Leindler inequality. Böröczky and Kalantzopoulos extended the symmetry method to bodies invariant under the same $n$ linear reflections whose fixed hyperplanes intersect only at the origin #cite(label("BK2022")) Theorem 2. For unit balls of complex norms, Rotem derived the inequality from Cordero-Erausquin’s volume inequality for complex interpolation #cite(label("Rotem2014")) #cite(label("Cordero2002")).

A complementary approach studies the second variation of volume. Colesanti, Livshyts and Marsiglietti established a local result near Euclidean balls and developed infinitesimal formulations #cite(label("CLM2017")). Kolesnikov and Milman expressed the local $L_p$ inequality as a lower bound for the first nonconstant even eigenvalue of the Hilbert–Brunn–Minkowski operator, and proved it for $p gt.eq 1 - c n^(- 3 \/ 2)$ with a universal $c > 0$ #cite(label("KM2022")). Their spectral formulation explains why symmetry matters: the translation eigenmodes are odd and hence disappear in the even subspace. Chen, Huang, Li and Liu obtained the corresponding global inequalities for $p$ sufficiently close to $1$ by a PDE argument #cite(label("CHLL2020")). Putterman proved the equivalence of local and global $L_p$ inequalities for every $p in \[ 0 \, 1 \)$ by studying strongly isomorphic polytopes #cite(label("Putterman2021")) Theorem 1.7. Van Handel proved the local logarithmic inequality for origin-symmetric zonoids, that is, Hausdorff limits of sums of segments, against arbitrary origin-symmetric comparison bodies #cite(label("vanHandel2023")) Theorem 1.4 of the cited arXiv version. Milman’s centro-affine interpretation of the operator led to further curvature-dependent results and an isomorphic logarithmic Minkowski theorem: every symmetric body has a suitable replacement within a universal geometric factor #cite(label("Milman2025")). These developments identify the analytic obstruction without imposing a common normal fan on the global conjecture.

Iffland gave another spectral proof of the local logarithmic inequality for origin-symmetric bodies of revolution and extended it to nonsymmetric comparison bodies under a weighted centering condition #cite(label("Iffland2026")) Theorem A. Lu proved the global inequality for origin-symmetric pairs sharing $n - 2$ orthogonal reflection symmetries #cite(label("Lu2026")) Theorems 1.2 and 1.3. Xi #cite(label("Xi2026")) Theorem 1.1 gives a new planar proof that also treats Dar’s conjecture. These results illustrate the different roles of local variation and additional symmetries in the problem.

=== Proof strategy <proof-strategy>

For finitely many spanning unit vectors $p_i$ and positive numbers $h_i$, the constraints $\| chevron.l p_i \, x chevron.r \| lt.eq h_i$ define a symmetric polytope. Replace its indicator by the smooth weight

$ exp (- epsilon / 2 \| x \|^2 - sum_i (frac(chevron.l p_i \, x chevron.r, h_i))^q) \, #h(2em) epsilon > 0 \, quad q gt.eq 2 upright(" even") . $

As $q$ tends to infinity, this weight becomes the Gaussian weight restricted to the polytope. Letting $epsilon$ tend to zero recovers its volume. Thus it suffices to prove that the integral of the smooth weight is log-concave when each $h_i$ varies geometrically. Section 2 makes this reduction precise, including the passage from finitely many directions to all directions.

Geometric changes of slab widths are also related to the $\( B \)$-property, which asks for log-concavity of measure under exponential dilations. Saroglou showed that the diagonal $\( B \)$-property for uniform measures on cubes in every dimension is equivalent to the logarithmic Brunn–Minkowski conjecture in every dimension #cite(label("Saroglou2015")) Theorem 1.5. This relates the geometric reduction to an earlier measure-theoretic formulation. The diagonal statement here is restricted to uniform measures on cubes; the consequence for general even log-concave measures concerns scalar dilations. The summandwise variance estimate below supplies the required concavity directly.

The second derivative of the logarithm of that integral is a variance minus an expected second derivative. The analytic task is therefore a variance bound for sums of even powers of linear forms (Proposition 3). We prove it in moment coordinates: the probability with density proportional to the displayed weight is the image of $e^(- phi \( z \)) thin d z$ under $x = nabla phi \( z \)$. Section 3 constructs these coordinates with a bounded, everywhere positive Hessian, starting from the compact moment theorem of Berman and Berndtsson #cite(label("BermanBerndtsson2013")) and Klartag’s Hessian estimate #cite(label("KlartagArxiv2013")). The general moment-measure theory is due to Cordero-Erausquin and Klartag #cite(label("CEK2015")).

Two steps complete the analytic argument. First, a differential operator associated with the moment Hessian produces a dense class of centered even test functions (Sections 4 and 5). The only obstructions to density are affine functions: centering removes constants, and evenness removes linear functions. Second, a tensor calculation for these tests has a remainder that is the sum of explicit squares (Section 6). This supplies the variance bound by two Cauchy–Schwarz inequalities (Section 7).

The analytic setting belongs to the tradition of Brascamp–Lieb variance inequalities for log-concave measures #cite(label("BrascampLieb1976")). Kolesnikov, Livshyts and Rotem #cite(label("KLR2026")) Theorem 1.4 and Corollaries 1.5–1.6 relate strengthened Brascamp–Lieb inequalities for homogeneous density potentials to local $p$-Brunn–Minkowski inequalities and obtain the local logarithmic inequality for $ell_q$ balls, $q gt.eq 1$. Their homogeneous variance formulation uses the Hessian of the density potential; our summandwise estimate uses the separately constructed moment potential. The transport-Hessian diffusion and curvature formulas were studied earlier by Kolesnikov #cite(label("Kolesnikov2014")); the Bochner identities in #cite(label("KLR2026")) Section 4.3 build on this framework.

The ingredient here is a tensor estimate in moment coordinates that controls each homogeneous summand separately. The accompanying density argument uses a global upper Hessian bound and local strict positivity; it does not require a global lower Hessian bound. We state these two steps separately so that their hypotheses and their possible use for other variance estimates are explicit.

== 2 From a variance bound to volume <sec:reduction>

We first deduce Theorem 1 from the variance bound below. For a probability measure $mu$, write $bb(E)_mu f = integral f thin d mu$ and $"Var"_mu \( f \) = bb(E)_mu \( f - bb(E)_mu f \)^2$.

#thm([Proposition 2.1.])[
  (Variance bound).  #emph[Let $n gt.eq 2$, $N gt.eq 1$, $q gt.eq 2$ be an even integer, and $epsilon > 0$. Let $p_1 \, dots.h \, p_N in bb(R)^n \\ { 0 }$ and $h_1 \, dots.h \, h_N > 0$. Set 
#[#set math.equation(numbering: n => "(2.1)")
 $ psi_i \( x \) = (frac(chevron.l p_i \, x chevron.r, h_i))^q \, #h(2em) V \( x \) = epsilon / 2 \| x \|^2 + sum_(i = 1)^N psi_i \( x \) \, #h(2em) d mu = Z^(- 1) e^(- V \( x \)) thin d x \, $ <eq:potential>]

 where $Z = integral_(bb(R)^n) e^(- V \( x \)) thin d x$. For all real $b_1 \, dots.h \, b_N$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ "Var"_mu (sum_(i = 1)^N b_i psi_i) lt.eq sum_(i = 1)^N b_i^2 bb(E)_mu psi_i . $ <eq:variance>]

]
] <prop:variance>

Here the Gaussian term makes $Z$ finite, even if the vectors $p_i$ do not span $bb(R)^n$. All polynomial moments are finite. The proof of Proposition 3 occupies Sections 3–7.

The proof will establish the dual estimate

$ sum_(i = 1)^N frac(\( bb(E)_mu u psi_i \)^2, bb(E)_mu psi_i) lt.eq bb(E)_mu u^2 #h(2em) upright("for every centered even ") u in L^2 \( mu \) . $

Here centered means $bb(E)_mu u = 0$, and the denominators are positive because each $p_i eq.not 0$ and $mu$ has a positive density. Applied to $u = sum_i b_i psi_i - bb(E)_mu sum_i b_i psi_i$, this gives (2.2) by Cauchy–Schwarz. We first prove the dual estimate on a class of smooth compactly supported tests, then use density to reach every such $u$. This explains the roles of the density and tensor lemmas in the analytic proof.

#proof[
  Suppose first that $n gt.eq 2$. Fix nonzero spanning vectors $p_1 \, dots.h \, p_N$ and positive endpoint widths $h_i^0 \, h_i^1$. For $t in \[ 0 \, 1 \]$, define
  $ h_i \( t \) = \( h_i^0 \)^(1 - t) \( h_i^1 \)^t \, #h(2em) P \( t \) = { x : \| chevron.l p_i \, x chevron.r \| lt.eq h_i \( t \) upright(" for all ") i } . $
  The spanning condition makes each $P \( t \)$ bounded; positivity of the widths gives nonempty interior. Use these widths in (2.1) and denote the resulting integral by $Z_(q \, epsilon) \( t \)$. For fixed $q \, epsilon$, its first two derivatives may be taken under the integral: on a compact interval of $t$, the differentiated integrands are bounded by a polynomial times $e^(- epsilon \| x \|^2 \/ 2)$. With $b_i = - q log \( h_i^1 \/ h_i^0 \)$ one has
  $ dot(V) = sum_i b_i psi_i \, #h(2em) dot.double(V) = sum_i b_i^2 psi_i \, $
  and hence
  $ frac(d^2, d t^2) log Z_(q \, epsilon) \( t \) = "Var"_(mu_t) \( dot(V) \) - bb(E)_(mu_t) dot.double(V) lt.eq 0 $
  by Proposition 3. Therefore
  #[#set math.equation(numbering: n => "(2.3)")
   $ Z_(q \, epsilon) \( lambda \) gt.eq Z_(q \, epsilon) \( 0 \)^(1 - lambda) Z_(q \, epsilon) \( 1 \)^lambda . $ <eq:partition-concavity>]
  Keep $epsilon > 0$ fixed and let $q$ tend to infinity through even integers. For each fixed $t$, the integrands converge almost everywhere to $e^(- epsilon \| x \|^2 \/ 2) upright(bold(1))_(P \( t \))$. The exceptional set lies in the finitely many hyperplanes $chevron.l p_i \, x chevron.r = plus.minus h_i \( t \)$ and has measure zero. The common integrable bound $e^(- epsilon \| x \|^2 \/ 2)$ gives
  $ Z_(q \, epsilon) \( t \) arrow.r integral_(P \( t \)) e^(- epsilon \| x \|^2 \/ 2) thin d x . $
  Apply this at $t = 0 \, lambda \, 1$ in (2.3), then let $epsilon arrow.b 0$. Monotone convergence gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ \| P \( lambda \) \| gt.eq \| P \( 0 \) \|^(1 - lambda) \| P \( 1 \) \|^lambda . $ <eq:slabs>]
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((-4.4, -1), (-1.2, 1), fill: rgb("#deedf5"), stroke: (paint: rgb("#22648b"), thickness: 0.8pt, join: "round"))
  circle((-2.8, 0), radius: (1.6, 1), fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.6pt, join: "round"))
  content((-2.8, 0), [$E$])
  content((-2.8, -1.22), [$P_2$], anchor: "north", padding: 0.1176cm)
  content((-2.8, -1.62), [#text(size: 9pt)[Two slab directions]], anchor: "north", padding: 0.1176cm)
  line((4.4, 0.4142), (3.463, 1), (2.137, 1), (1.2, 0.4142), (1.2, -0.4142), (2.137, -1), (3.463, -1), (4.4, -0.4142), close: true, fill: rgb("#deedf5"), stroke: (paint: rgb("#22648b"), thickness: 0.8pt, join: "round"))
  circle((2.8, 0), radius: (1.6, 1), fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.6pt, join: "round"))
  content((2.8, 0), [$E$])
  content((2.8, -1.22), [$P_4$], anchor: "north", padding: 0.1176cm)
  content((2.8, -1.62), [#text(size: 9pt)[Four slab directions]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: Finite outer approximations of an ellipse $E$. Adding slab directions gives $P_2 supset P_4 supset E$; the subscripts here count slab directions. Using nested finite spanning direction sets with dense union, the same construction recovers $cal(W) \[ f \]$ from any positive continuous even function $f$ on the sphere; $f$ need not be a support function. ],
  ) <fig:slab-exhaustion>
  Figure 1 illustrates how additional slab directions refine an outer approximation. To pass to all directions, let $K \, L$ be as in Theorem 1. Choose nested finite sets $D_m subset S^(n - 1)$ that contain the coordinate vectors and whose union is dense in the sphere. Define
  $ P_m \( t \) = ⋂_(p in D_m) { x : \| chevron.l p \, x chevron.r \| lt.eq h_K \( p \)^(1 - t) h_L \( p \)^t } . $
  The bodies $P_m \( t \)$ decrease with $m$ and are all contained in the bounded body $P_1 \( t \)$. By continuity of the support functions and their evenness,
  $ ⋂_m P_m \( t \) = cal(W) \[ h_K^(1 - t) h_L^t \] . $
  Indeed any point satisfying the dense set of inequalities satisfies all of them by continuity in the direction. Conversely, the Wulff inequalities imply the absolute-value constraints by evenness. At $t = 0 \, 1$ these intersections are $K \, L$, respectively, by the supporting-half-space characterization of a convex body. Continuity of measure from above, applied at $0 \, lambda \, 1$ in (2.4), proves (1.1).
  Finally, in dimension one write $K = \[ - a \, a \]$ and $L = \[ - b \, b \]$ with $a \, b > 0$. Their Wulff interpolation is the interval with radius $a^(1 - lambda) b^lambda$, whose length is $\( 2 a \)^(1 - lambda) \( 2 b \)^lambda$. Thus (1.1) is equality. The endpoints $lambda = 0 \, 1$ are equality in every dimension. ◻
]

== 3 Moment coordinates on the whole space <sec:moment>

The variance argument uses a change of variables whose Jacobian is a positive Hessian. The following lemma supplies this change of variables and the uniform upper bound needed for the later cutoff arguments.

#thm([Lemma 3.1.])[
  (Moment coordinates).  #emph[Let $n gt.eq 2$, $epsilon > 0$, and let $V in C^oo \( bb(R)^n \)$ be even with $D^2 V gt.eq epsilon I$. Set 
$ Z = integral_(bb(R)^n) e^(- V \( x \)) thin d x \, #h(2em) d mu \( x \) = Z^(- 1) e^(- V \( x \)) thin d x . $

 There is an even $phi in C^oo \( bb(R)^n \)$ such that $d nu \( z \) = e^(- phi \( z \)) thin d z$ is a probability measure, $nabla phi$ is a diffeomorphism of $bb(R)^n$ onto $bb(R)^n$, and 
#[#set math.equation(numbering: n => "(3.1)")
 $ \( nabla phi \)_(\#) nu = mu \, #h(2em) 0 < D^2 phi lt.eq 4 / epsilon I \, #h(2em) log det D^2 phi = V \( nabla phi \) + log Z - phi . $ <eq:moment>]

 Moreover, $phi \( z \) gt.eq c \| z \| - b$ for some $c > 0$ and $b < oo$. The lower Hessian bound in (3.1) means positive definiteness at every point; it need not be uniform on $bb(R)^n$.]
] <lem:moment>

#proof[
  Evenness and uniform convexity give $V \( x \) gt.eq V \( 0 \) + epsilon \| x \|^2 \/ 2$, so $0 < Z < oo$. For $R gt.eq 2$, write $B_R = { x : \| x \| < R }$ and set
  $ Z_R = integral_(B_R) e^(- V \( x \)) thin d x \, #h(2em) d mu_R = Z_R^(- 1) upright(bold(1))_(B_R) e^(- V \( x \)) thin d x . $
  We first use two compact-support results. The moment theorem of Berman–Berndtsson #cite(label("BermanBerndtsson2013")) Theorem 1.1, applied to the body $overline(B)_R$ and the positive smooth density $e^(- V) \/ Z_R$, gives a smooth convex potential $phi_R$, unique up to translation, for which $nabla phi_R : bb(R)^n arrow.r B_R$ is a diffeomorphism and
  #[#set math.equation(numbering: n => "(3.2)")
   $ det D^2 phi_R = Z_R exp { V \( nabla phi_R \) - phi_R } . $ <eq:moment-truncated>]
  The centering hypothesis holds by evenness. Integrating the equation through this diffeomorphism shows that $d nu_R = e^(- phi_R) thin d z$ is a probability and $\( nabla phi_R \)_(\#) nu_R = mu_R$. Klartag’s estimate #cite(label("KlartagArxiv2013")) Proposition 3.1 and Remark 3.5 gives
  $ 0 < D^2 phi_R lt.eq C I \, #h(2em) C = 4 \/ epsilon . $
  Indeed, the ball has smooth positively curved boundary, and $rho_R = V + log Z_R$ is convex and smooth, with itself and all its derivatives bounded on $B_R$, and $D^2 rho_R gt.eq epsilon I$. The constant $C$ is independent of $R$.
  Translate the unique preimage of $0$ to $0$. It is the unique minimum of $phi_R$. Reflection gives a second potential for the same target with its minimum at $0$; uniqueness up to translation therefore makes $phi_R$ even. For each fixed $R$, take the preimages of the slopes $plus.minus \( R \/ 2 \) e_i$. Their supporting planes give
  $ phi_R \( z \) gt.eq frac(R, 2 sqrt(n)) \| z \| - b_R $
  with a finite, possibly $R$-dependent constant $b_R$. Thus $nu_R$ has an exponential tail. In particular, since $\| nabla phi_R \| lt.eq R$, integration of $"div" \( z e^(- phi_R) \)$ with expanding compact cutoffs is justified and yields
  #[#set math.equation(numbering: n => "(3.3)")
   $ bb(E)_(nu_R) thin z dot.op nabla phi_R \( z \) = n . $ <eq:moment-source-identity>]
  We now obtain bounds independent of $R$. Put $m_R = phi_R \( 0 \)$ and $g_R = phi_R - m_R gt.eq 0$. The Hessian bound implies $g_R \( y \) lt.eq C \| y \|^2 \/ 2$ and $\| nabla phi_R \( y \) \| lt.eq C \| y \|$. For arbitrary $y \, z$, set $x = nabla phi_R \( z \)$. Supporting planes at $z$ and $- z$ give the single pointwise inequality
  $ g_R \( y \) gt.eq g_R \( z \) + \| x dot.op y \| - x dot.op z . $
  Integrate with respect to $nu_R$, discard the nonnegative $bb(E)_(nu_R) g_R$, and use (3.3):
  $ g_R \( y \) gt.eq integral \| x dot.op y \| thin d mu_R \( x \) - n . $
  On $B_1$ the density of $mu_R$ is at least $d_0 = Z^(- 1) exp \( - max_(overline(B)_1) V \) > 0$. Rotational symmetry of the ball therefore bounds the integral below by $c \| y \|$, where $c = d_0 integral_(B_1) \| x_1 \| thin d x > 0$. Hence
  #[#set math.equation(numbering: n => "(3.4)")
   $ c \| y \| - n lt.eq g_R \( y \) lt.eq C / 2 \| y \|^2 \, #h(2em) (frac(2 pi, C))^(n \/ 2) lt.eq e^(m_R) = integral e^(- g_R \( y \)) thin d y lt.eq e^n integral e^(- c \| y \|) thin d y . $ <eq:moment-coercivity>]
  This bounds $m_R$ on both sides and gives one integrable exponential majorant for all the densities $e^(- phi_R)$.
  It remains to obtain a smooth limit and to verify that its gradient reaches every point. On each fixed ball, the preceding estimates bound $phi_R$ and $nabla phi_R$ uniformly. Since $Z_2 lt.eq Z_R lt.eq Z$, equation (3.2) bounds $det D^2 phi_R$ below by a positive constant there. Together with $D^2 phi_R lt.eq C I$, this gives a uniform local bound $delta I lt.eq D^2 phi_R lt.eq C I$: if the determinant is at least $d > 0$, every eigenvalue is at least $d \/ C^(n - 1)$. The right-hand sides
  $ f_R = V \( nabla phi_R \) + log Z_R - phi_R $
  of the logarithmic equations are uniformly Lipschitz on that ball, because $nabla f_R = D^2 phi_R nabla V \( nabla phi_R \) - nabla phi_R$ is uniformly bounded.
  To apply an interior uniformly elliptic estimate, choose a smooth concave scalar function $s$ equal to $log$ on a slightly larger interval than $\[ delta \, C \]$, with $s'$ bounded above and bounded below by positive constants on $bb(R)$. Such an extension is obtained by smoothly continuing the decreasing derivative $1 \/ t$ to positive constant tails. For symmetric matrices $Q$, the spectral function $cal(F) \( Q \) = "tr" s \( Q \)$ is smooth, concave and uniformly elliptic: its derivative has eigenvalues $s' \( lambda_i \( Q \) \)$, and its second variation has coefficients $s'' \( lambda_i \)$ and the nonpositive divided differences of $s'$. It agrees with $log det$ on the Hessians under consideration. The nonhomogeneous Evans–Krylov estimate #cite(label("Wang2012")) Corollary 2.3 applied to $cal(F) \( D^2 phi_R \) = f_R$ gives uniform interior $C^(2 \, alpha)$ bounds for some $alpha > 0$.
  Each $phi_R$ is already smooth. Its derivative $w_(R \, k) = partial_k phi_R$ satisfies
  $ \( D^2 phi_R \)^(- 1) : D^2 w_(R \, k) = nabla V \( nabla phi_R \) dot.op nabla w_(R \, k) - w_(R \, k) \, $
  where $Q : N = "tr" \( Q^T N \)$. The principal coefficients and the right-hand side are uniformly $C^alpha$ on smaller balls. Interior Schauder estimates #cite(label("FernandezRealRosOton2023")) Theorem 2.20 and Corollary 2.21 give uniform $C^(3 \, alpha)$ bounds for $phi_R$, and iteration gives bounds for every derivative on compact sets. A diagonal subsequence, still indexed by $R$, converges locally smoothly to an even $phi$ with positive definite Hessian, the same upper cap, and the logarithmic equation in (3.1). The bound $phi_R \( z \) gt.eq c \| z \| - b$, with $b$ independent of $R$, also passes to $phi$.
  The common exponential majorant from (3.4) proves $integral e^(- phi) = 1$ by dominated convergence. For each bounded continuous $h$, it also gives
  $ integral h \( nabla phi \) e^(- phi) = lim_(R arrow.r oo) integral h \( nabla phi_R \) e^(- phi_R) = lim_(R arrow.r oo) integral h thin d mu_R = integral h thin d mu . $
  Thus $\( nabla phi \)_(\#) nu = mu$. Positive definite Hessian makes the gradient locally invertible and injective, since for $z eq.not w$,
  $ \( nabla phi \( z \) - nabla phi \( w \) \) dot.op \( z - w \) = integral_0^1 D^2 phi \( w + t \( z - w \) \) \[ z - w \, z - w \] thin d t > 0 . $
  Its image is dense: an open ball missed by the image would have zero pushforward mass, contrary to the everywhere positive density of $mu$. Fix $x_0 in bb(R)^n$. Density permits finitely many image points $y_j = nabla phi \( z_j \)$ whose convex hull contains a ball $B_r \( x_0 \)$ with $r > 0$; one may take small perturbations of the points $x_0 plus.minus e_i$. Their supporting planes imply
  $ phi \( z \) - x_0 dot.op z gt.eq max_j { \( y_j - x_0 \) dot.op z + phi \( z_j \) - y_j dot.op z_j } gt.eq r \| z \| - b_(x_0) . $
  This function attains a minimum, at which $nabla phi = x_0$. The gradient is therefore onto, and its local smooth inverses combine to a global smooth inverse. ◻
]

We will write $x = nabla phi \( z \)$ and $tau = D_z^2 phi$, evaluating $tau$ at the corresponding point when using $x$ coordinates. Thus $tau \( x \) = D_z^2 phi \( \( nabla phi \)^(- 1) \( x \) \)$ is smooth, even, positive definite and bounded above by $\( 4 \/ epsilon \) I$. The gradient is odd, as is its inverse. Finally, a compactly supported smooth function of $x$ is compactly supported after composition with $nabla phi$: its support lies in the image of a compact set under the continuous inverse map. Consequently the compact integrations by parts below are valid in either coordinate system.

== 4 Adjoints in moment coordinates <sec:identities>

We retain the probability measures

$ d mu \( x \) = Z^(- 1) e^(- V \( x \)) thin d x \, #h(2em) d nu \( z \) = e^(- phi \( z \)) thin d z \, #h(2em) x = nabla phi \( z \) \, $

and the smooth diffeomorphism constructed above. Put

$ tau = D_z^2 phi \, #h(2em) M = tau^(- 1) . $

In target coordinates, these symbols denote the same matrix fields evaluated at $z = \( nabla phi \)^(- 1) \( x \)$. Expectation under either measure, with functions identified by this map, is denoted by $bb(E)$. Throughout the coordinate calculations, repeated indices are summed from $1$ to $n$, and $Q : L = "tr" \( Q^T L \)$ denotes matrix contraction.

We first construct the compact test functions used in the variance argument and establish an identity that will also identify the obstruction to their density. Write

$ partial_k = partial_(z_k) \, #h(2em) partial_k^(*) = x_k - partial_k . $

The latter is the adjoint of $partial_k$ in $L^2 \( nu \)$ because $partial_k phi = x_k$. In target coordinates, write $delta_mu$ for negative weighted divergence:

$ delta_mu W = sum_j #scale(x: 120%, y: 120%)[\(] V_(x_j) W_j - partial_(x_j) W_j #scale(x: 120%, y: 120%)[\)] . $

On a matrix, $delta_mu$ acts on each row, producing a vector. For a smooth row field $P_(a k)$ and a compact test $g$, the chain rule and adjunction give

$ bb(E) g thin partial_k^(*) P_(a k) = bb(E) \( partial_k g \) P_(a k) = bb(E) g_(x_i) tau_(i k) P_(a k) . $

Consequently

#[#set math.equation(numbering: n => "(4.1)")
 $ partial_k^(*) P_(a k) = \( delta_mu \( P tau \) \)_a . $ <eq:row-adjoint>]

Taking $P$ to be the identity matrix also gives $delta_mu tau = x$. This is Fathi’s moment-map construction of a Stein kernel #cite(label("Fathi2019")) Theorem 2.3 of the cited arXiv version: the matrix field $tau$ expresses integration by parts against $x$ through $bb(E) x_j g = bb(E) tau_(j k) g_(x_k)$.

Thus the differential operator

#[#set math.equation(numbering: n => "(4.2)")
 $ A f = delta_mu \( tau nabla_x f \) = partial_k^(*) f_(x_k) = x dot.op nabla_x f - tau : D_x^2 f $ <eq:operator-A>]

is formally symmetric, with

#[#set math.equation(numbering: n => "(4.3)")
 $ bb(E) g A f = bb(E) nabla_x g dot.op tau nabla_x f $ <eq:A-form>]

for compact smooth tests. These formulas involve no operator-domain assertion. This is the negative of the moment-Hessian diffusion generator studied by Klartag #cite(label("KlartagArxiv2013")) Section 6; for our sign convention, $A x_j = x_j$.

For $f in C_c^oo \( bb(R)_x^n \)$, define

#[#set math.equation(numbering: n => "(4.4)")
 $ h = D_x^2 f \, #h(2em) P = tau h \, #h(2em) B = tau h tau \, #h(2em) W_a = partial_k^(*) P_(a k) \, #h(2em) u = delta_mu W . $ <eq:test-fields>]

All these fields have compact support in both coordinates: the inverse image of a compact target set is its compact image under the continuous inverse diffeomorphism. By (4.1), $W = delta_mu B$. For every smooth function $F$ in target coordinates, two adjunctions give

#[#set math.equation(numbering: n => "(4.5)")
 $ bb(E) u F = bb(E) W dot.op nabla_x F = bb(E) B : D_x^2 F . $ <eq:test-pairing>]

The fields are compactly supported, so $F$ need not be. Thus the same pairing can be estimated through either the first or the second derivatives of $F$. To identify the range of these tests, we also use the gradient identity

#[#set math.equation(numbering: n => "(4.6)")
 $ W = nabla_z #scale(x: 120%, y: 120%)[\[] \( \( A - 1 \) f \) \( x \( z \) \) #scale(x: 120%, y: 120%)[\]] = tau nabla_x \( A - 1 \) f \, #h(2em) u = A \( A - 1 \) f . $ <eq:W-gradient>]

To check it directly, put $C_(i j k) = partial_(z_i) partial_(z_j) partial_(z_k) phi$. This tensor is fully symmetric, and expansion gives

$ W_a = x_k tau_(a i) f_(x_i x_k) - C_(a i k) f_(x_i x_k) - tau_(a i) tau_(j k) f_(x_i x_k x_j) . $

Differentiating $\( A - 1 \) f$ in $z_a$ gives exactly these terms: the first-gradient terms from $x dot.op nabla_x f$ and $- f$ cancel. The formula for $u$ follows from (4.2). In particular, $D_z W$ is symmetric.

The following identity is the moment-coordinate specialization of the transport-Hessian Bochner formula of Kolesnikov, Livshyts and Rotem #cite(label("KLR2026")) Proposition 4.8. We give its direct derivation in the present notation. Two compact integrations by parts give

#[#set math.equation(numbering: n => "(4.7)")
 $ bb(E) \( A f \) \( A - 1 \) f & = bb(E) nabla_x f dot.op tau nabla_x \( A - 1 \) f = bb(E) nabla_x f dot.op W\
 & = bb(E) h : B = bb(E) parallel tau^(1 \/ 2) D_x^2 f thin tau^(1 \/ 2) #scale(x: 120%, y: 120%)[parallel]_(upright("HS"))^2 . $ <eq:hessian>]

Here $parallel Q parallel_(upright("HS"))^2 = "tr" \( Q^T Q \)$. The differential expression $A$ satisfies $A 1 = 0$ and $A x_j = x_j$, so $A \( A - 1 \)$ annihilates every affine function. Section 5 uses (4.7) to prove that these are the only $L^2$ obstructions to density. Centering removes constants, and evenness removes linear functions.

== 5 Density of the even tests <sec:density>

The Hessian identity identifies affine functions as the possible obstructions to density. We now show that these are the only obstructions, using cutoffs in the $x$ coordinates.

#thm([Lemma 5.1.])[
  (Density of even tests).  #emph[Let $d mu = rho \( x \) thin d x$ be a probability measure on $bb(R)^n$ with a smooth, strictly positive, even density. Let $tau$ be a smooth even symmetric matrix field with $0 < tau \( x \) lt.eq Lambda I$ for some finite $Lambda$, and set 
$ A f = x dot.op nabla f - tau : D^2 f . $

 Suppose that $A$ has the integration formula 
$ bb(E) \[ h A f \] = bb(E) \[ nabla h dot.op tau nabla f \] #h(2em) \( f \, h in C_c^oo \( bb(R)^n \) \) $

 and satisfies the compact Hessian identity (4.7). Then 
$ overline({ A \( A - 1 \) f : f in C_c^oo \( bb(R)^n \) \, med f upright(" even") })^(thin L^2 \( mu \)) = { g in L^2 \( mu \) : g upright(" even") \, med bb(E) g = 0 } . $

]
] <lem:density>

#proof[
  Write $Gamma \( f \, h \) = nabla f dot.op tau nabla h$ and $Gamma \( f \) = Gamma \( f \, f \)$. The integration formula also holds when one factor is smooth and the other has compact support, by inserting a cutoff around that support. In particular $bb(E) A k = 0$ for compactly supported smooth $k$. Since $A$ preserves parity, the displayed range consists of centered even functions.
  Let $g$ be a centered even $L^2 \( mu \)$ function orthogonal to this range. It also annihilates $A \( A - 1 \) f$ for odd $f$, because that image is odd. Formal symmetry therefore gives
  $ cal(P) g = 0 quad upright("in distributions") \, #h(2em) cal(P) = A \( A - 1 \) . $
  Indeed, if $cal(P)^t$ denotes the transpose with respect to Lebesgue measure and $d mu = rho thin d x$, weighted formal symmetry gives $cal(P)^t \( rho g \) = rho cal(P) g$ in distributions. Orthogonality makes the left side zero, and smooth positivity of $rho$ gives the displayed equation. The principal symbol of $cal(P)$ is $\( xi dot.op tau \( x \) xi \)^2$, which is positive for every $xi eq.not 0$. Interior elliptic regularity consequently gives $g in C^oo$ #cite(label("Dyatlov2026")) Theorem 14.2. Only positivity on compact sets is needed here.
  #emph[Splitting the equation in $L^2$.] Choose $0 lt.eq eta_r lt.eq 1$ smooth, equal to one on $B_r$, zero outside $B_(2 r)$, with $\| nabla eta_r \| lt.eq C \/ r$ and $\| D^2 eta_r \| lt.eq C \/ r^2$, where $r gt.eq 1$. The upper bound on $tau$ gives constants $B \, K$, independent of $r$, such that
  #[#set math.equation(numbering: n => "(5.1)")
   $ Gamma \( eta_r \)^(1 \/ 2) lt.eq B \/ r \, #h(2em) \| A eta_r \| lt.eq K . $ <eq:density-cutoff>]
  For the second estimate, use $\| x \| lt.eq 2 r$ on the support of the cutoff derivatives. Those derivatives, including $A eta_r$, vanish outside $B_(2 r) \\ B_r$.
  Put $v = A g$, initially just a smooth function, and write
  $ G = parallel g parallel_2 \, #h(2em) X_r = parallel eta_r^2 v parallel_2 \, #h(2em) Y_r^2 = bb(E) \[ eta_r^2 Gamma \( g \) \] . $
  Here $G$ is finite by hypothesis, while $X_r \, Y_r$ are finite by compact support. Testing $cal(P) g = 0$ against $eta_r^4 g$ gives $bb(E) \[ v \( A - 1 \) \( eta_r^4 g \) \] = 0$. The product rule $A \( a b \) = a A b + b A a - 2 Gamma \( a \, b \)$ yields the exact expansion
  $ \( A - 1 \) \( eta_r^4 g \) =  & eta_r^4 v + g #scale(x: 120%, y: 120%)[\(] 4 eta_r^3 A eta_r - 12 eta_r^2 Gamma \( eta_r \) - eta_r^4 #scale(x: 120%, y: 120%)[\)]\
 & - 8 eta_r^3 Gamma \( eta_r \, g \) . $
  Thus Cauchy–Schwarz and (5.1) imply
  #[#set math.equation(numbering: n => "(5.2)")
   $ X_r lt.eq a G + frac(8 B, r) Y_r \, #h(2em) Y_r^2 lt.eq G X_r + frac(2 B, r) G Y_r \, #h(2em) a = 1 + 4 K + 12 B^2 . $ <eq:density-two-estimates>]
  The first inequality is immediate if $X_r = 0$; otherwise divide the resulting estimate for $X_r^2$ by $X_r$. For the second, integrate by parts in $bb(E) \[ eta_r^2 g A g \]$:
  $ Y_r^2 = bb(E) \[ eta_r^2 g v \] - 2 bb(E) \[ eta_r g Gamma \( eta_r \, g \) \] . $
  Combining (5.2) gives $Y_r^2 lt.eq a G^2 + 10 B G Y_r$, so both $Y_r$ and $X_r$ are bounded uniformly in $r$. Exhaustion by balls proves $v = A g in L^2 \( mu \)$. We may now set
  $ w = g - v in L^2 \( mu \) \, #h(2em) A w = 0 \, #h(2em) A v = v . $
  #emph[The harmonic part is constant.] Testing $A w = 0$ with $eta_r^2 w$ and using (5.1) gives
  $ #scale(x: 120%, y: 120%)[\(] bb(E) \[ eta_r^2 Gamma \( w \) \] #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq frac(2 B, r) parallel w parallel_2 . $
  On any fixed ball, let $r arrow.r oo$. Then $Gamma \( w \) = 0$ there; strict positivity of $tau$ shows that $w$ is constant.
  #emph[The eigenvalue-one part is linear.] The analogous test of $A v = v$ gives, with $Z_r^2 = bb(E) \[ eta_r^2 Gamma \( v \) \]$,
  $ Z_r^2 lt.eq parallel v parallel_2^2 + frac(2 B, r) parallel v parallel_2 Z_r . $
  Hence $bb(E) Gamma \( v \) < oo$. For $f_r = eta_r v in C_c^oo$, the product rule now proves directly that
  #[#set math.equation(numbering: n => "(5.3)")
   $ f_r arrow.r v \, #h(2em) A f_r arrow.r v quad upright("in ") L^2 \( mu \) . $ <eq:density-approximation>]
  Indeed,
  $ A f_r = eta_r v + v A eta_r - 2 Gamma \( eta_r \, v \) . $
  The middle term has norm at most $K parallel v upright(bold(1))_(B_(2 r) \\ B_r) parallel_2 arrow.r 0$. For the last term, use
  $ parallel Gamma \( eta_r \, v \) parallel_2 lt.eq B / r \( bb(E) Gamma \( v \) \)^(1 \/ 2) arrow.r 0 . $
  Apply (4.7) to these compactly supported functions:
  $ bb(E) #scale(x: 120%, y: 120%)[\[] parallel tau^(1 \/ 2) D^2 f_r thin tau^(1 \/ 2) parallel_(upright("HS"))^2 #scale(x: 120%, y: 120%)[\]] = parallel A f_r parallel_2^2 - bb(E) \[ f_r A f_r \] arrow.r 0 . $
  On each fixed ball, $f_r = v$ for all sufficiently large $r$. Positivity of the density and of $tau$ therefore forces $D^2 v = 0$ on that ball. Thus $v$ is affine, and $A v = v$ removes its constant term.
  We have proved that every $L^2$ distributional solution of $cal(P) g = 0$ is affine. Our $g = w + v$ is even, so it is constant, and its mean is zero. Hence $g = 0$. Taking the orthogonal complement in the centered even subspace proves the lemma. ◻
]

== 6 A tensor estimate for the divergence tests <sec:tensor>

The gradient and Hessian pairings in (4.5) will be estimated using two quadratic energies, one for $W$ and one for $B$. The following lemma bounds their sum by $bb(E) u^2$. Its proof uses weighted integration by parts and the moment equation; homogeneity enters only when the lemma is applied to the summands $psi_i$ in Section 7.

#thm([Lemma 6.1.])[
  (Moment-coordinate tensor estimate).  #emph[Let $d mu = Z^(- 1) e^(- V) d x$ and $d nu = e^(- phi) d z$ be smooth probability measures on $bb(R)^n$. Suppose $D_z^2 phi$ is positive definite and $x = nabla phi \( z \)$ is a smooth diffeomorphism pushing $nu$ to $mu$. For a real $f in C_c^oo \( bb(R)_x^n \)$, put 
$ tau = D_z^2 phi \, quad M = tau^(- 1) \, quad H = D_x^2 V \, quad B = tau \( D_x^2 f \) tau \, quad W = delta_mu B \, quad u = delta_mu W . $

 View source fields in target coordinates by the inverse moment map. Then 
#[#set math.equation(numbering: n => "(6.1)")
 $ bb(E) "tr" #scale(x: 120%, y: 120%)[\(] \( D_x W \)^2 #scale(x: 120%, y: 120%)[\)] gt.eq bb(E) "tr" \( M B H B \) \, $ <eq:tensor-estimate>]

 and 
#[#set math.equation(numbering: n => "(6.2)")
 $ bb(E) u^2 gt.eq bb(E) "tr" \( M B H B \) + bb(E) W^T H W . $ <eq:tensor-energy>]

 Here $\( D_x W \)_(i j) = partial_(x_j) W_i$, and the square in (6.1) is a matrix square.]
] <lem:tensor>

#proof[
  All test fields used in the integrations by parts below have compact support. Weighted Bochner calculations underlie many variance estimates; see Bakry–Émery #cite(label("BakryEmery1985")) Proposition 3 and the transport-Hessian formulas in #cite(label("KLR2026")) Section 4.3. Here the required identity is for a vector field, so we derive it explicitly and retain the matrix trace $"tr" \( \( D_x W \)^2 \)$. First, for any such vector field $W$ and $u = delta_mu W$,
  $ partial_(x_i) u = H_(i j) W_j + \( V_(x_j) - partial_(x_j) \) partial_(x_i) W_j . $
  Pairing with $W_i$ and using adjunction gives the weighted identity
  #[#set math.equation(numbering: n => "(6.3)")
   $ bb(E) u^2 = bb(E) W_i partial_(x_i) u = bb(E) W^T H W + bb(E) \( partial_(x_j) W_i \) \( partial_(x_i) W_j \) = bb(E) W^T H W + bb(E) "tr" #scale(x: 120%, y: 120%)[\(] \( D_x W \)^2 #scale(x: 120%, y: 120%)[\)] . $ <eq:bochner>]
  Thus it remains to prove (6.1). Its proof compares two expansions, integrates their derivative terms by parts, and writes the resulting difference as a sum of squares.
  Recall $h = D_x^2 f$ and $P = tau h$ from (4.4), and let $\( C_i \)_(k l) = C_(i k l)$, where $C = D_z^3 phi$. The moment equation (3.1) reads
  $ V \( x \( z \) \) = phi \( z \) + log det tau \( z \) - log Z . $
  Its first derivative gives
  $ tau_(i k) V_(x_k) = x_i + c_i \, #h(2em) c_i = "tr" \( M C_i \) . $
  Since $partial_j M = - M C_j M$, differentiating once more gives
  $ \( tau H tau \)_(i j) = tau_(i j) + M_(k l) phi_(k l i j) - "tr" \( M C_i M C_j \) - C_(i j k) V_(x_k) . $
  To combine the fourth-derivative term and the term involving $nabla_x V$ into a weighted divergence, note that
  $ partial_d M_(d k) = - M_(d a) C_(a b d) M_(b k) = - c_b M_(b k) \, #h(2em) partial_d M_(d k) - x_d M_(d k) = - V_(x_k) . $
  Full symmetry of $D_z^4 phi$ therefore yields
  #[#set math.equation(numbering: n => "(6.4)")
   $ \( tau H tau - tau \)_(i j) = \( partial_d - x_d \) \( M_(d k) C_(i j k) \) - "tr" \( M C_i M C_j \) . $ <eq:twice-moment>]
  For the other expansion, the commutator $\[ partial_l \, partial_k^(*) \] = tau_(k l)$ gives
  $ D_z W = B + R \, #h(2em) R_(a l) = partial_k^(*) partial_l P_(a k) . $
  Both $D_z W$ and $B$ are symmetric, so $R$ is symmetric. Since $D_x W = \( B + R \) M$ and $M B M = h$, expansion followed by one integration by parts gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ bb(E) "tr" #scale(x: 120%, y: 120%)[\(] \( D_x W \)^2 #scale(x: 120%, y: 120%)[\)] = bb(E) "tr" \( M B M B \) + 2 bb(E) \( partial_k h_(a l) \) \( partial_l P_(a k) \) + bb(E) "tr" \( M R M R \) . $ <eq:trace-expansion>]
  The last term is nonnegative: $"tr" \( M R M R \) = parallel M^(1 \/ 2) R M^(1 \/ 2) parallel_(upright("HS"))^2$. On the right side of (6.1), the coefficient of $tau H tau$ in the trace contraction is
  $ Q = M B M B M = h tau h . $
  Substituting (6.4) and integrating its divergence term by parts gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ bb(E) "tr" \( M B H B \) = bb(E) "tr" \( M B M B \) - bb(E) \( partial_d Q_(i j) \) M_(d k) C_(i j k) - bb(E) Q_(i j) "tr" \( M C_i M C_j \) . $ <eq:H-expansion>]
  The common first term cancels. We now evaluate the three remaining contracted terms in coordinates where $tau = I$ at the point under consideration.
  This normalization uses a constant dual change of coordinates. For an invertible constant matrix $T$, set
  $ z = T z' \, #h(2em) x' = T^T x \, #h(2em) f' \( x' \) = f \( T^(- T) x' \) . $
  The corresponding normalized potentials and partition function are
  $ phi' \( z' \) = phi \( T z' \) - log \| det T \| \, #h(2em) V' \( x' \) = V \( T^(- T) x' \) \, #h(2em) Z' = \| det T \| Z . $
  They preserve both probability measures by change of variables, $x' = nabla_(z') phi'$, and the moment equation. The chain rule gives
  $ tau' = T^T tau T \, & B' = T^T B T \, & R' = T^T R T \,\
M' = T^(- 1) M T^(- T) \, & h' = T^(- 1) h T^(- T) \, & H' = T^(- 1) H T^(- T) \,\
Q' = T^(- 1) Q T^(- T) \, & P' = T^T P T^(- T) \, & W' = T^T W . $
  Each $z$-derivative index, including all three indices of $C$, transforms covariantly with $T$; the same law holds for $partial_k^(*)$. Also $D_(x') W' = T^T \( D_x W \) T^(- T)$. It follows that every contracted scalar in (6.5) and (6.6) is invariant. For example, in $\( partial_k h_(a l) \) \( partial_l P_(a k) \)$ each index pairs one covariant and one contravariant factor. At a fixed point we may therefore take $T = tau^(- 1 \/ 2)$, using the value of $tau$ at that point. All derivatives are computed under this constant transformation. No moving frame is differentiated; the integrations by parts have already been completed.
  In these normalized coordinates, put
  $ S_(i j k) = f_(x_i x_j x_k) \, #h(2em) J_(i j k) = h_(i a) C_(a j k) . $
  The tensor $S$ is fully symmetric, and $J$ is symmetric in its last two indices. Write $J_(i j k)^(\( 12 \)) = J_(j i k)$, and use the Euclidean tensor norm and inner product in this frame. The three contractions are
  #[#set math.equation(numbering: n => "(6.7)")
   $ 2 \( partial_k h_(a l) \) \( partial_l P_(a k) \) & = 2 parallel S parallel^2 + 2 chevron.l S \, J chevron.r \,\
\( partial_d Q_(i j) \) C_(i j d) & = 2 chevron.l S \, J chevron.r + chevron.l J \, J^(\( 12 \)) chevron.r \,\
Q_(i j) "tr" \( C_i C_j \) & = parallel J parallel^2 . $ <eq:normalized-cross>]
  For (6.7), use $partial_k h_(a l) = S_(a l k)$ and $partial_l P_(a k) = C_(a i l) h_(i k) + S_(a k l)$. For (6.7), differentiating the two factors $h$ in $Q = h tau h$ gives the two copies of $chevron.l S \, J chevron.r$. Differentiating its middle factor gives
  $ sum_(i a b j d) h_(i a) C_(a b d) h_(b j) C_(i j d) = sum_d "tr" \( h C_d h C_d \) = chevron.l J \, J^(\( 12 \)) chevron.r . $
  Finally, (6.7) follows by expanding $Q = h^2$ and the trace, using the full symmetry of $C$.
  Thus, apart from the nonnegative $R$ term, the integrand of (6.5) minus (6.6) is
  $ 2 parallel S parallel^2 + 4 chevron.l S \, J chevron.r + parallel J parallel^2 + chevron.l J \, J^(\( 12 \)) chevron.r . $
  Full symmetrization of $J$ is
  $ \( "Sym" J \)_(i j k) = frac(J_(i j k) + J_(j i k) + J_(k i j), 3) . $
  Its norm satisfies
  $ parallel "Sym" J parallel^2 = frac(parallel J parallel^2 + 2 chevron.l J \, J^(\( 12 \)) chevron.r, 3) \, #h(2em) chevron.l S \, "Sym" J chevron.r = chevron.l S \, J chevron.r . $
  Consequently the preceding integrand equals
  #[#set math.equation(numbering: n => "(6.8)")
   $ 2 parallel S + "Sym" J parallel^2 + 1 / 6 parallel J - J^(\( 12 \)) parallel^2 gt.eq 0 . $ <eq:tensor-squares>]
  This pointwise calculation proves (6.1); combining it with (6.3) proves (6.2). ◻
]

For the soft slab potentials, $H$ is the sum of a positive quadratic part and the positive semidefinite Hessians of the homogeneous summands. Lemma 6 will control each summand through the two terms on the right side of (6.2).

== 7 The variance inequality <sec:variance>

We now apply the moment-coordinate estimates to the potential (2.1). In this section all expectations are with respect to its probability $mu$.

#proof[
  The potential is smooth and even, and $D^2 V gt.eq epsilon I$. Lemma 4 therefore supplies the moment coordinates, with $0 < tau lt.eq \( 4 \/ epsilon \) I$. Put
  $ H_i = D_x^2 psi_i \, #h(2em) a_i = bb(E) psi_i . $
  Each $H_i$ is positive semidefinite, and $a_i > 0$ since $p_i eq.not 0$ and $mu$ has positive density everywhere. Homogeneity gives
  #[#set math.equation(numbering: n => "(7.1)")
   $ x dot.op nabla psi_i = q psi_i \, #h(2em) H_i x = \( q - 1 \) nabla psi_i . $ <eq:homogeneity>]
  The adjunction identity of Section 4 also gives
  #[#set math.equation(numbering: n => "(7.2)")
   $ m_i := bb(E) "tr" \( tau H_i \) = bb(E) x dot.op nabla psi_i = q a_i . $ <eq:mi>]
  To justify it for these noncompact functions, apply $bb(E) x_j k = bb(E) tau_(j k) partial_(x_k) k$ to $k = eta_R partial_(x_j) psi_i$ and sum in $j$, where $eta_R$ is a smooth cutoff equal to one on $B_R$ and zero outside $B_(2 R)$. The extra term is bounded in absolute value by $C R^(- 1) bb(E) \[ \| nabla psi_i \| upright(bold(1))_({ \| x \| gt.eq R }) \]$, which tends to zero. The other terms converge because $tau$ is bounded and all polynomial moments are finite.
  Take an even $f in C_c^oo \( bb(R)^n \)$ and use
  $ B = tau D_x^2 f thin tau \, #h(2em) W = delta_mu B \, #h(2em) u = delta_mu W = A \( A - 1 \) f \, #h(2em) M = tau^(- 1) . $
  Applying (4.5) to $F = psi_i$ gives, for each $i$,
  #[#set math.equation(numbering: n => "(7.3)")
   $ d_i := bb(E) u psi_i = bb(E) W dot.op nabla psi_i = bb(E) "tr" \( B H_i \) . $ <eq:di>]
  Two Cauchy–Schwarz estimates will give complementary bounds for these same numbers $d_i$.
  First apply the Hilbert–Schmidt Cauchy–Schwarz inequality, including integration, to the matrix fields $H_i^(1 \/ 2) tau^(1 \/ 2)$ and $H_i^(1 \/ 2) B tau^(- 1 \/ 2)$. Their pairing is $"tr" \( H_i B \)$, so
  #[#set math.equation(numbering: n => "(7.4)")
   $ d_i^2 lt.eq m_i thin bb(E) "tr" \( M B H_i B \) . $ <eq:first-cs>]
  This does not require $B$ to be positive semidefinite. Second, (7.1)–(7.3) give
  $ bb(E) x^T H_i x = \( q - 1 \) m_i \, #h(2em) bb(E) x^T H_i W = \( q - 1 \) d_i . $
  Cauchy–Schwarz for the positive semidefinite form $\( X \, Y \) mapsto bb(E) X^T H_i Y$ therefore yields
  #[#set math.equation(numbering: n => "(7.5)")
   $ bb(E) W^T H_i W gt.eq \( q - 1 \) d_i^2 / m_i . $ <eq:second-cs>]
  Since $H = D^2 V = epsilon I + sum_i H_i$, Lemma 6 and the weighted Bochner identity (6.3) imply
  #[#set math.equation(numbering: n => "(7.6)")
   $ bb(E) u^2 & gt.eq bb(E) "tr" \( M B H B \) + bb(E) W^T H W\
 & gt.eq sum_i (bb(E) "tr" \( M B H_i B \) + bb(E) W^T H_i W) gt.eq sum_i frac(q d_i^2, m_i) = sum_i d_i^2 / a_i . $ <eq:dual-bound>]
  The discarded terms are nonnegative, since $M$ is positive definite and $B$ is symmetric. This is the required estimate on the dense class of double divergences.
  By Lemma 5, such $u$ are dense in the centered even subspace of $L^2 \( mu \)$. Each $psi_i in L^2 \( mu \)$, so all pairings $u mapsto bb(E) u psi_i$ are continuous. Thus (7.6) holds for every centered even $u in L^2 \( mu \)$. For $F = sum_i b_i psi_i$, choose $u = F - bb(E) F$. Then
  $ parallel u parallel_2^2 = sum_i b_i d_i lt.eq (sum_i b_i^2 a_i)^(1 \/ 2) (sum_i d_i^2 \/ a_i)^(1 \/ 2) lt.eq (sum_i b_i^2 a_i)^(1 \/ 2) parallel u parallel_2 . $
  If $parallel u parallel_2 = 0$, the conclusion is immediate; otherwise division and squaring prove (2.2). This completes the analytic assertion and, by Section 2, Theorem 1. ◻
]

== 8 Volume and measure consequences <sec:consequences>

With Theorem 1 proved, we derive the additive volume inequality stated in the introduction and then apply Saroglou’s transfer theorem to even log-concave measures.

=== 8.1 The symmetric $L_p$ volume inequality <subsec:lp-proof>

#proof[
  At $lambda = 0 \, 1$, the assertion follows from $cal(W) \[ h_K \] = K$ and $cal(W) \[ h_L \] = L$. Suppose $0 < lambda < 1$. Set
  $ a = \| K \|^(1 \/ n) > 0 \, #h(2em) b = \| L \|^(1 \/ n) > 0 \, #h(2em) K_0 = a^(- 1) K \, #h(2em) L_0 = b^(- 1) L \, $
  so that $\| K_0 \| = \| L_0 \| = 1$. Define
  $ c = #scale(x: 120%, y: 120%)[\(] \( 1 - lambda \) a^p + lambda b^p #scale(x: 120%, y: 120%)[\)]^(1 \/ p) > 0 \, #h(2em) theta = frac(lambda b^p, c^p) in \( 0 \, 1 \) . $
  Then $1 - theta = \( 1 - lambda \) a^p \/ c^p$. For every $u in S^(n - 1)$, the support identities $h_K = a h_(K_0)$ and $h_L = b h_(L_0)$, followed by the weighted arithmetic–geometric mean inequality, give
  $ #scale(x: 120%, y: 120%)[\(] \( 1 - lambda \) h_K \( u \)^p + lambda h_L \( u \)^p #scale(x: 120%, y: 120%)[\)]^(1 \/ p) & = c #scale(x: 120%, y: 120%)[\(] \( 1 - theta \) h_(K_0) \( u \)^p + theta h_(L_0) \( u \)^p #scale(x: 120%, y: 120%)[\)]^(1 \/ p)\
 & gt.eq c h_(K_0) \( u \)^(1 - theta) h_(L_0) \( u \)^theta . $
  All support values here are positive. The Wulff definition is monotone in its support bound and satisfies $cal(W) \[ c f \] = c cal(W) \[ f \]$ for $c > 0$. Hence
  $ c cal(W) \[ h_(K_0)^(1 - theta) h_(L_0)^theta \] subset cal(W) #h(-0.16667em) [#scale(x: 120%, y: 120%)[\(] \( 1 - lambda \) h_K^p + lambda h_L^p #scale(x: 120%, y: 120%)[\)]^(1 \/ p)] . $
  By Theorem 1, the unscaled body on the left has volume at least $1$, because $K_0 \, L_0$ are origin-symmetric and have unit volume. The body on the right therefore has volume at least $c^n$. Raising this bound to the positive power $p \/ n$ gives (1.2), since $c^p = \( 1 - lambda \) \| K \|^(p \/ n) + lambda \| L \|^(p \/ n)$. ◻
]

=== 8.2 Even log-concave measures and the $\( B \)$-conjecture <sec:measure>

We now pass from volume to integration against even log-concave measures. A nonnegative Radon measure $mu$ on $bb(R)^n$ is #emph[log-concave] if

$ mu \( \( 1 - theta \) A + theta B \) gt.eq mu \( A \)^(1 - theta) mu \( B \)^theta #h(2em) \( 0 < theta < 1 \) $

for all compact sets $A \, B subset bb(R)^n$; it is #emph[even] if $mu \( A \) = mu \( - A \)$ for every Borel set $A$. Radon measures are finite on compact sets, but their total mass need not be finite. We use the analogous multiplicative definition of log-concavity for nonnegative functions, so the identically zero function is included. Endpoint products in an interpolation inequality are understood as the corresponding endpoint values.

Saroglou’s transfer theorem states that the logarithmic Brunn–Minkowski inequality for Lebesgue measure in a dimension $d$ implies the same inequality in dimension $d$ for every even log-concave density #cite(label("Saroglou2016")) Theorem 3.1. The density may vanish and need not be normalized. This theorem is stated for densities with respect to $d$-dimensional Lebesgue measure. The reduction below makes explicit how it also gives the measure statement when the measure has lower-dimensional support.

#thm([Corollary 8.1.])[
  (Measure inequality and scalar $\( B \)$-conjecture).  #emph[Let $n gt.eq 1$, let $mu$ be an even log-concave Radon measure on $bb(R)^n$, and let $K \, L subset bb(R)^n$ be origin-symmetric convex bodies. Then, for every $0 lt.eq lambda lt.eq 1$, 
#[#set math.equation(numbering: n => "(8.1)")
 $ mu #scale(x: 120%, y: 120%)[\(] cal(W) \[ h_K^(1 - lambda) h_L^lambda \] #scale(x: 120%, y: 120%)[\)] gt.eq mu \( K \)^(1 - lambda) mu \( L \)^lambda . $ <eq:measure-logbm>]

 Consequently, for every origin-symmetric convex body $K subset bb(R)^n$, the function 
#[#set math.equation(numbering: n => "(8.2)")
 $ bb(R) in.rev t mapsto mu \( e^t K \) $ <eq:b-function>]

 is log-concave.]
] <cor:measure>

#proof[
  Fix $0 < lambda < 1$ and write $D = cal(W) \[ h_K^(1 - lambda) h_L^lambda \]$. The assertion is immediate when $mu$ is the zero measure. Otherwise, choose a closed ball $C$ centered at the origin large enough that $K union L union D subset C$ and $0 < mu \( C \) < oo$. This is possible because the three bodies are compact and $mu$ is a nonzero Radon measure. The probability measure
  $ nu \( A \) = frac(mu \( A ∩ C \), mu \( C \)) $
  is even and log-concave: for compact $A \, B$, convexity of $C$ gives
  $ \( 1 - theta \) \( A ∩ C \) + theta \( B ∩ C \) subset \( \( 1 - theta \) A + theta B \) ∩ C \, $
  and the defining inequality for $mu$ applies. Since $K \, L \, D subset C$, the common factor $mu \( C \)$ cancels from (8.1). It therefore suffices to prove that inequality for $nu$.
  Let $E$ be the affine hull of $"supp" nu$. Evenness gives $E = - E$, so $E$ is a linear subspace. If $dim E = 0$, then $nu = delta_0$; all three bodies contain $0$, and equality holds. Suppose $d = dim E gt.eq 1$ and identify $E$ isometrically with $bb(R)^d$. By inner regularity, the compact-set definition of log-concavity for $nu$ is equivalent to the Borel-set formulation using inner measure. Borell’s characterization #cite(label("Borell1974")) Theorem 1.1, with $s = 0$, applied to $nu$ on $E$, represents it as an affine image of a log-concave density in a dimension $k lt.eq d$. Since its support spans $E$, the affine map has rank $d$. Thus $k = d$, the map is invertible, and $nu$ has a log-concave density $f$ with respect to Lebesgue measure on $E$. Evenness of $nu$ gives $f \( x \) = f \( - x \)$ almost everywhere; replacing $f \( x \)$ by $sqrt(f \( x \) f \( - x \))$ gives an even log-concave representative of the same density.
  Set $K_E = K ∩ E$ and $L_E = L ∩ E$. These are origin-symmetric convex bodies in $E$, since $K$ and $L$ contain neighborhoods of $0$. Define their relative support functions for every $v in E$ by
  $ h_(K_E)^E \( v \) = max_(y in K_E) chevron.l y \, v chevron.r \, #h(2em) h_(L_E)^E \( v \) = max_(y in L_E) chevron.l y \, v chevron.r . $
  The relative Wulff body in $E$ is
  $ D_E = ⋂_(v in E) {x in E : chevron.l x \, v chevron.r lt.eq h_(K_E)^E \( v \)^(1 - lambda) h_(L_E)^E \( v \)^lambda} . $
  Using all $v in E$ rather than only unit vectors gives the same body by homogeneity. Let $P_E$ be the orthogonal projection onto $E$. For $x in D_E$ and $u in S^(n - 1)$,
  $ chevron.l x \, u chevron.r & = chevron.l x \, P_E u chevron.r\
 & lt.eq h_(K_E)^E \( P_E u \)^(1 - lambda) h_(L_E)^E \( P_E u \)^lambda\
 & lt.eq h_K \( u \)^(1 - lambda) h_L \( u \)^lambda . $
  Indeed, $h_(K_E)^E \( P_E u \) = max_(y in K ∩ E) chevron.l y \, u chevron.r lt.eq h_K \( u \)$, and likewise for $L$; if $P_E u = 0$, the middle product is $0$. Thus
  #[#set math.equation(numbering: n => "(8.3)")
   $ D_E subset D ∩ E . $ <eq:relative-wulff-inclusion>]
  Theorem 1 in dimension $d$, followed by Saroglou’s transfer theorem #cite(label("Saroglou2016")) Theorem 3.1 in that same dimension, gives
  $ nu \( D_E \) gt.eq nu \( K_E \)^(1 - lambda) nu \( L_E \)^lambda . $
  Since $nu$ is supported on $E$, inclusion (8.3) yields
  $ nu \( D \) = nu \( D ∩ E \) gt.eq nu \( D_E \) gt.eq nu \( K \)^(1 - lambda) nu \( L \)^lambda \, $
  as required. At $lambda = 0 \, 1$, the Wulff bodies are $K \, L$, respectively, and the endpoint convention gives equality.
  Finally, for $s \, t in bb(R)$, the support identity $h_(e^s K) = e^s h_K$ gives
  $ cal(W) #h(-0.16667em) [h_(e^s K)^(1 - lambda) h_(e^t K)^lambda] = cal(W) #h(-0.16667em) [e^(\( 1 - lambda \) s + lambda t) h_K] = e^(\( 1 - lambda \) s + lambda t) K . $
  Applying (8.1) to $e^s K$ and $e^t K$ proves
  $ mu #scale(x: 120%, y: 120%)[\(] e^(\( 1 - lambda \) s + lambda t) K #scale(x: 120%, y: 120%)[\)] gt.eq mu \( e^s K \)^(1 - lambda) mu \( e^t K \)^lambda . $
  This is exactly the log-concavity in (8.2), and is the scalar-dilation argument of Saroglou #cite(label("Saroglou2016")) Corollary 3.2. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
