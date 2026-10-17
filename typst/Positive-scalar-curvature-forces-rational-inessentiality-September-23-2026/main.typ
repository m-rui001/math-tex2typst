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

#align(center)[#text(size: 16pt, weight: "bold")[Positive scalar curvature forces rational inessentiality]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $M^n$ be a closed connected oriented smooth manifold, let $Gamma = pi_1 \( M \)$, and let $c_M : M arrow.r B Gamma$ be a classifying map for its universal cover. Here $B Gamma$ is a CW $K \( Gamma \, 1 \)$: a connected CW complex with fundamental group $Gamma$ and contractible universal cover. The manifold is #emph[rationally essential] if

$ \( c_M \)_(*) \[ M \] eq.not 0 quad upright("in ") H_n \( B Gamma \; bb(Q) \) \, $

and #emph[rationally inessential] otherwise. The fundamental class in this definition has rational coefficients. The condition is independent of the choice of classifying map. It records whether the fundamental class remains visible after passing from the manifold to the topology of its fundamental group.

We prove the rational-essentiality obstruction to positive scalar curvature formulated in #cite(label("Hanke2011")) Conjecture 2.9.

#thm([Theorem 1.1.])[
  (Rational inessentiality).  #emph[Let $M^n$ be a closed connected oriented smooth manifold of dimension $n gt.eq 2$. If $M$ admits a Riemannian metric of strictly positive scalar curvature, then 
$ \( c_M \)_(*) \[ M \] = 0 #h(2em) upright("in ") H_n \( B pi_1 \( M \) \; bb(Q) \) . $

]
] <thm:main>

The theorem has no spin, universal-cover spin, or fundamental-group hypothesis, and no upper dimension bound. In particular, the group may have torsion and its classifying space need not have a finite-dimensional model.

A manifold is #emph[aspherical] if its universal cover is contractible.

=== 1.1 From a detected class to contracting maps <from-a-detected-class-to-contracting-maps>

In the later geometric convention, a closed oriented Riemannian $n$-manifold is #emph[enlargeable] if, for every $epsilon > 0$, some cover with the lifted metric admits an $epsilon$-Lipschitz map of nonzero degree to the unit sphere $S^n$ that is constant outside a compact set. This definition imposes no spin condition. Rational essentiality supplies a group-cohomology class whose pullback pairs nontrivially with $\[ M \]$, but it does not guarantee these contracting maps. Brunnbauer and Hanke construct rationally essential manifolds which are not enlargeable, as well as enlargeable manifolds whose universal covers alone do not admit such maps at every scale, that is, are not hyperspherical #cite(label("BrunnbauerHanke2010")) Theorems 1.4–1.5. Their examples are not aspherical.

Guth and Braun–Sauer give a different comparison between topology and metric largeness: at every radius, they guarantee a ball in the universal cover whose volume is at least a dimensional multiple of the radius to the $n$th power, for closed aspherical and rationally essential manifolds, respectively #cite(label("Guth2011")) #cite(label("BraunSauer2021")). These bounds do not have the sharp Euclidean leading constant, so they do not determine the scalar-curvature term in the small-ball volume expansion.

Our proof converts the cohomology pairing into a local degree by adding a parameter manifold, then changes the metric to contract the resulting map while retaining positive scalar curvature. The main estimate makes the scalar cost grow only logarithmically with the number of comparison coordinates. Suppose for contradiction that $"Scal"_M gt.eq kappa > 0$ and that $M$ is rationally essential. The construction has four stages.

===== 1.1.1 Finite comparison and local degree. <finite-comparison-and-local-degree.>

At each sufficiently large finite word-metric comparison scale $R$, an auxiliary closed oriented manifold $C$ with a principal left $Gamma$-cover $hat(C) arrow.r C$ gives the cover $X = \( tilde(M) times hat(C) \) \/ Gamma arrow.r M times C$. The detecting cocycle yields a compactly supported cohomology class on $X$ that evaluates nontrivially on its locally finite fundamental class. Distance profiles supply a preliminary map $cal(V) : X arrow.r bb(R)^q$, for a finite integer $q > n$. Together with the parameter projection $macron(o) : X arrow.r C$, it defines the map $x mapsto \( macron(o) \( x \) \, cal(V) \( x \) \)$ into $C times bb(R)^q$.

The construction transfers the compact pairing to a relative cohomology class on a compact region of this product, evaluated nontrivially on a relative cycle carried by the preceding map. Relative duality gives a complementary relative rational homology class, and rational realization represents a nonzero multiple by a compact oriented $\( q - n \)$-manifold with boundary mapped to $C times bb(R)^q$. Its transverse intersections with the preceding map have nonzero signed count. Doubling the parameter manifold and reflecting its map gives a closed oriented manifold $A$ with a map $\( o_0 \, y_0 \) : A arrow.r C times bb(R)^q$. Pulling back $hat(C) arrow.r C$ along $o_0$ gives a principal cover $hat(A) arrow.r A$ and the fibre product

$ Z = X times_C A = \( tilde(M) times hat(A) \) \/ Gamma arrow.r M times A . $

This cover has dimension $q = n + dim A$, and both $cal(V)$ and $y_0$ pull back to $bb(R)^q$-valued maps on it. On a precompact open set $Omega$ over one half of $A$, the zeros of their scaled difference $\( cal(V) - y_0 \) \/ R$ are precisely the preceding intersections. A cutoff equal to one on $Omega$ makes this difference a smooth compactly supported map $G : Z arrow.r bb(R)^q$ satisfying

$ deg \( G \, Omega \, 0 \) eq.not 0 \, #h(2em) parallel G parallel_oo > 3 quad upright("on ") partial Omega \, $

where $parallel dot.op parallel_oo$ is the maximum of the absolute target coordinates. The scalar coordinates satisfy

#[#set math.equation(numbering: n => "(1.1)")
 $ max_i \| d_(tilde(M)) G_i \| lt.eq J \/ R \, #h(2em) log q lt.eq J R \, $ <eq:introduction-data>]

with $J$ independent of $R$. Here $d_(tilde(M))$ differentiates in the fibre directions, holding the parameter in $A$ fixed, and its norm uses the lifted metric of $M$. Parameter derivatives are bounded at each fixed $R$ and are controlled later by metric enlargement. 3 constructs these data without assuming that $tilde(M)$ is contractible or that the cocycle is bounded.

===== 1.1.2 A graph and one warped circle per coordinate. <a-graph-and-one-warped-circle-per-coordinate.>

A graph change increases the fibre metric in the direction of one function’s differential, and a reciprocal warped circle supplies favorable scalar terms. A nonlinear elliptic equation chooses a replacement coordinate close to the old one while shortening its differential. Processing all $q$ coordinates once is called a #emph[pass]. Paying an independent worst-case scalar cost for every coordinate would introduce a factor $q$ and destroy the scalar lower bound. Instead, the decreases of the inverse metric telescope on the $n$-dimensional fibre cotangent space. Their sum has trace at most $n$ in the metric at the start of the pass, independently of the numbers of coordinates and circles. The scalar identity in 4, the graph solution in 5, and the summation in 6 bound the fibre scalar-curvature loss by $C \( n + 1 \) \( 2 + log q \) L^2 \/ w^2$, for an absolute constant $C$, when the input row norms are at most $L$ and each replacement is allowed coordinate error $pi w \/ 2$.

===== 1.1.3 Finite shortening with a summable cost. <finite-shortening-with-a-summable-cost.>

Successive passes divide $L$ by four and $w$ by two, so their coordinate errors and fibre scalar losses form summable series. The initial error allowance makes the uniform total error in each coordinate less than $pi \/ 10$, preserving the maximum-norm boundary gap. Composing the shortened coordinate map on $Omega$ with a degree-one map $bb(R)^q arrow.r S^q$ that is constant outside the unit ball, and extending constantly outside $Omega$, preserves this degree. By (1.1), the total fibre scalar loss is $O \( \( 2 + log q \) R^(- 2) \) = O \( R^(- 1) \)$. At each fixed finite stage, enlarging the metric on $A$ makes the parameter part of the differential small and makes the assembled scalar curvature uniformly close to the fibre scalar curvature. For $R$ sufficiently large and every finite integer $k gt.eq 1$, there are a metric $g_k$ on $Z$, positive warps $m_(k \, nu)$, and a smooth map $F_k : Z arrow.r S^q$, constant outside a compact set and of nonzero degree, such that

$ "Scal"_(g_k + sum_(nu = 1)^(k q) m_(k \, nu)^2 d theta_nu^2) gt.eq kappa \/ 2 \, #h(2em) \| d F_k \|_(g_k \, upright("op")) lt.eq C \( q \) 4^(- k) J \/ R . $

The scalar bound concerns $Z times bb(T)^(k q)$, while the differential bound uses all the base directions in $Z$. 1 distinguishes these directions from the stabilizing circles.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 3.2cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Original fibre directions#linebreak()$tilde(M)$, dimension $n$]]])])
  content((3.65, 0), [#box(width: 3.3cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#fff6ed"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Parameter directions#linebreak()$A$, dimension $q-n$]]])])
  content((7.2, 0), [#box(width: 3cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f9f2f9"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Stabilizing circles#linebreak()$bb(T)^(k q)$, dimension $"kq"$]]])])
  line((-1.6, -0.8), (-1.6, -0.95), (5.3, -0.95), (5.3, -0.8), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((1.85, -1.45), [#text(size: 9pt)[Base $Z$, dimension $q$]])
  line((1.85, -1.716), (1.85, -2.65), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1.85, -2.183), [#text(size: 9pt)[$F_k$, nonzero degree]], anchor: "west", padding: 0.1176cm)
  content((1.85, -2.9), [#text(size: 9pt)[$S^q$]])
  content((7.2, -1.6), [#text(size: 9pt)[Scalar curvature is controlled#linebreak()on $Z times bb(T)^(k q)$]])
})],
  caption: [Figure 1: The local direction splitting after $k$ finite passes. The base $Z$ is locally a product of original and parameter directions; no global product decomposition is asserted. The inverse-metric trace uses only the $n$ original directions. The sphere map uses the full base of dimension $q$, which is fixed before the number $k q$ of circles is chosen. ],
) <fig:direction-splitting>

===== 1.1.4 An obstruction independent of the circle count. <an-obstruction-independent-of-the-circle-count.>

Pulling back a torus tube in $S^q$ gives a compact band $W subset Z$ carrying the degree. Doubling $W$ and retaining the circle factors gives a closed oriented manifold $"dbl" \( W \) times bb(T)^(k q)$ mapped with nonzero degree to $S^1 times bb(T)^(q - 1) times bb(T)^(k q)$. The local torical theorem of Cecchini–Schick requires a scalar lower bound and a bound on the full differential only on the full preimage of one connected open target arc. The doubled metric therefore needs to agree with the constructed metric only there. Constant enlargement of the stabilizing circles controls their joint projection without scalar loss. 7 derives an obstruction threshold depending on $q$ and $kappa$, but not on the number $k q$ of circles. We first choose $R$ large enough to control the total fibre scalar loss, thereby fixing $q$ and all comparison data, and then choose a sufficiently large finite $k$ to contradict this obstruction.

=== 1.2 Consequences <consequences>

For a connected aspherical manifold, the classifying map is a homotopy equivalence. Thus every closed connected oriented aspherical manifold is rationally essential. The main theorem gives the following consequence, with the nonorientable case obtained from the orientation double cover.

#thm([Corollary 1.2.])[
  (The Gromov–Lawson aspherical conjecture).  #emph[No closed smooth aspherical manifold, whether orientable or not, admits a Riemannian metric of strictly positive scalar curvature.]
] <cor:aspherical>

For nonnegative scalar curvature, the corresponding statement determines the given metric.

#thm([Corollary 1.3.])[
  (Aspherical nonnegative-scalar-curvature rigidity).  #emph[Let $g$ be a Riemannian metric of nonnegative scalar curvature on a closed smooth aspherical manifold $M$, not necessarily oriented. Then $g$ is flat.]
] <cor:aspherical-flat>

Both aspherical statements apply componentwise and have no spin assumption. In dimensions zero and one scalar curvature vanishes identically, and every metric is flat. Gromov already noted the rigidity implication conditionally on the aspherical positive-scalar-curvature obstruction #cite(label("GromovDozen2018")) Section 3, following Conjecture B. Here the proof combines 7 with the compact-manifold consequence of the Cheeger–Gromoll splitting theorem.

A nonzero-degree map to an aspherical target forces rational essentiality by naturality of classifying maps; no injectivity or surjectivity condition on the induced map of fundamental groups is needed. The following is the oriented form of the target-map conjecture recorded by Chodosh and Li #cite(label("ChodoshLiSurvey2023")) Conjecture 18. Their survey also states the connected-sum obstruction in dimensions four and five as a consequence of Gromov’s work #cite(label("ChodoshLiSurvey2023")) Theorem 17.

#thm([Corollary 1.4.])[
  (Oriented target-map obstruction).  #emph[Let $M^n$ and $N^n$ be closed connected oriented smooth manifolds of dimension $n gt.eq 2$, with $N$ aspherical. If a continuous map $f : M arrow.r N$ has nonzero ordinary oriented degree $d in bb(Z) \\ { 0 }$, then $M$ admits no Riemannian metric whose scalar curvature is strictly positive everywhere.]
  #emph[In particular, if $P^n$ is any closed connected oriented smooth manifold, the oriented connected sum $N \# P$ admits no such metric.]
] <cor:degree-aspherical>

For a closed connected oriented $n$-manifold, its #emph[real simplicial volume] is

$ parallel M parallel = inf {sum_i \| a_i \| : sum_i a_i sigma_i upright(" is a real singular cycle representing ") \[ M \]} . $

Positive simplicial volume implies rational essentiality, by the bounded-cohomology mapping theorem and duality for this seminorm (6). Therefore rational inessentiality implies zero simplicial volume. The converse fails: a positive-dimensional torus is rationally essential but has zero simplicial volume, as follows from its self-covers of degree greater than one. Its flat metric also shows why strict positivity in 1 cannot be replaced by nonnegative scalar curvature. For simplicial volume the nonnegative hypothesis does suffice.

#thm([Corollary 1.5.])[
  (Simplicial-volume vanishing).  #emph[Every closed oriented smooth manifold of positive dimension admitting a Riemannian metric of nonnegative scalar curvature has zero real simplicial volume.]
] <cor:simplicial>

On each connected component, 2 reduces a nonnegative-scalar-curvature metric to either a positive-scalar-curvature metric or a Ricci-flat metric. The positive branch uses 1; the Ricci-flat branch uses volume comparison and amenability, without requiring rational inessentiality in that case.

=== 1.3 The obstruction problem and earlier work <the-obstruction-problem-and-earlier-work>

Two approaches have shaped scalar-curvature obstructions. Schoen and Yau used stable two-sided minimal hypersurfaces and conformal deformation to transfer positive scalar curvature to lower dimensions #cite(label("SchoenYauStructure1979")) #cite(label("SchoenYauIncompressible1979")). Their original obstructions requiring no spin assumption apply in dimensions at most seven, including to manifolds mapping with nonzero degree to tori. Gromov and Lawson developed Dirac-operator obstructions using enlargeability and relative indices on complete manifolds #cite(label("GromovLawson1983")). Their 1983 enlargeability convention requires oriented spin coverings, and their compact obstruction has no upper dimension bound. The later geometric convention used above omits this spin requirement. The spin condition in geometric index applications and the regularity of minimizing hypersurfaces are thus different constraints.

More recently, Chodosh and Li established the aspherical obstruction in dimensions four and five using generalized soap bubbles #cite(label("ChodoshLi2024")). Gromov independently treated the closed five-dimensional case, and also complete-manifold domination problems under properness and uniform-positivity or decay hypotheses #cite(label("GromovAsphericalFive2020")). 2 establishes the closed-aspherical statement in every dimension.

The homological formulation in 1 concerns more manifolds than the aspherical class. Hanke explicitly formulates the conjecture that rationally essential manifolds do not admit positive scalar curvature #cite(label("Hanke2011")) Definition 2.8 and Conjecture 2.9. It is also the classifying-map form, for closed oriented sources, of Gromov’s conjecture that a nontorsion homology class in the classifying space of a countable group cannot be the image of the fundamental class of a positive-scalar-curvature manifold #cite(label("Gromov2023")) Section 1.5, $\[ upright("Sc") gt.not 0 \]$, p. 19. The numbered sections cited from that work refer throughout to the author’s arXiv version 6. Yau also posed this homological obstruction in his survey #cite(label("Yau2000")) p. 265.

Gromov introduced simplicial volume and its bounded-cohomology description in #cite(label("Gromov1982")). His quantitative scalar-curvature/simplicial-volume conjecture asks for a dimension-dependent upper bound on simplicial volume in terms of Riemannian volume under a fixed scalar-curvature lower bound #cite(label("Gromov2023")) Section 3.13. Rescaling a nonnegative-scalar-curvature metric in such a comparison would force zero simplicial volume. 5 proves this qualitative vanishing consequence. The quantitative comparison remains a separate question.

Recent work of Ma, Wang, Xie, Yu and Zhu proves that nonnegative scalar curvature forces zero real simplicial volume for closed oriented manifolds with spin universal cover #cite(label("MaWangXieYuZhu2026")) Corollary 1.2. Their stated version has no further group-decay assumption. This conclusion controls the simplicial norm, rather than the rational classifying image. Bi and Zhu develop singular hypersurface descent and rule out positive scalar curvature on closed oriented enlargeable and overtorical manifolds, where an $n$-manifold is overtorical if it admits a nonzero-degree map to $bb(T)^n$ #cite(label("BiZhu2026")) Theorems A and B. Their theorem for complete oriented sources and complete oriented enlargeable targets retains properness, nonzero-degree and Lipschitz hypotheses and rules out a uniform positive scalar lower bound. Under strict positive scalar curvature, 1 gives rational classifying-image vanishing without these geometric-largeness or spin-cover hypotheses.

The terminal geometric input here is the local torical theorem of Cecchini and Schick #cite(label("CecchiniSchick2021")) Theorem 1.14(1). It has no spin assumption or upper dimension bound, and requires both the scalar lower bound and the full differential bound only on the full preimage of one connected open target arc. Its higher-dimensional proof uses the minimal-slicing theory of Schoen and Yau #cite(label("SchoenYau2017")).

2 records the degree conventions and the nonnegative scalar-curvature reduction. 3 constructs the comparison data, and Section 4, Section 5, Section 6 establish the graph stabilization and shortening estimates. 7 supplies the stabilized obstruction. Finally, 8 combines these results and proves the four corollaries.

== 2 Conventions and the nonnegative scalar-curvature reduction <sec:reductions>

We record the degree conventions for the comparison construction and reduce nonnegative scalar curvature to the positive and Ricci-flat cases used in the corollaries. All manifolds and metrics are smooth. A closed manifold is compact and has no boundary. Unless stated otherwise, manifolds are oriented. Fundamental classes are taken with the indicated coefficients; we use the same symbol $\[ M \]$ for an integral fundamental class and its images under extension of coefficients. The Laplacian is $Delta = "div" nabla$, and a round sphere has positive scalar curvature. For a hypersurface with unit normal $nu$, our second fundamental form is $upright("II") \( X \, Y \) = chevron.l nabla_X nu \, Y chevron.r$ and its mean curvature is its trace. These conventions fix the signs in the graph calculations below. We give $S^d$ its unit round metric and write $bb(T)^b = \( bb(R) \/ 2 pi bb(Z) \)^b$ for the standard flat torus.

=== 2.1 Fundamental classes and degree <fundamental-classes-and-degree>

Throughout the proof, $Gamma = pi_1 \( M \)$ and $c_M : M arrow.r B Gamma$ have the meaning fixed in 1. No finite-dimensional model for $B Gamma$ is assumed. Disconnected closed manifolds are treated one component at a time; compactness leaves only finitely many components.

For a possibly noncompact oriented $d$-manifold $Y$, a smooth map $F : Y arrow.r S^d$ that is equal to one value $* in S^d$ outside a compact set has a well-defined degree. One may compute it as the signed number of preimages of any regular value different from $*$. Those preimages are contained in a compact set. Equivalently, pull back a compactly supported top-degree class on $S^d \\ { * }$ and evaluate it on the locally finite fundamental class of $Y$. This definition also permits disconnected $Y$: only finitely many components can meet the compact region on which $F$ is nonconstant. We use #emph[constant outside a compact set] in this sense, rather than assigning a linear meaning to compact support for a sphere-valued map.

We also use the ordinary oriented local degree $deg \( G \, Omega \, 0 \)$ for a smooth map from an oriented $q$-manifold to $bb(R)^q$, where $Omega$ is a precompact open set and $0 in.not G \( partial Omega \)$. Smoothness of $partial Omega$ is unnecessary. A homotopy whose boundary values avoid zero preserves this degree. More generally, if they avoid a fixed ball, composition with a degree-one map $bb(R)^q arrow.r S^q$ constant outside that ball gives a sphere-valued map of the same degree, extending constantly across the boundary of $Omega$.

#thm([Lemma 2.1.])[
  (Simplicial volume detects rational essentiality).  #emph[If a closed connected oriented manifold $M^n$ has positive real simplicial volume, then $\( c_M \)_(*) \[ M \] eq.not 0$ in $H_n \( B Gamma \; bb(Q) \)$.]
] <lem:essentiality>

#proof[
  The bounded-cohomology mapping theorem identifies real bounded cohomology of $M$ with that of $B Gamma$ by pullback along $c_M$. The duality between bounded cohomology and the $ell^1$-seminorm implies that $parallel M parallel > 0$ supplies a bounded class whose ordinary cohomology image evaluates nontrivially on $\[ M \]$. These are the mapping and duality results of #cite(label("Gromov1982")); neither requires a spin structure.
  If $\( c_M \)_(*) \[ M \]$ vanished rationally, its real image would vanish. Every bounded class pulled back from $B Gamma$ would then evaluate trivially on $\[ M \]$, a contradiction. In dimension one, real bounded cohomology already vanishes and the assertion is vacuous; the direct circle argument below also suffices. ◻
]

=== 2.2 The scalar-flat alternative <the-scalar-flat-alternative>

#thm([Lemma 2.2.])[
  (Positive scalar curvature or Ricci flatness).  #emph[Let $M$ be closed and connected, not necessarily oriented, and suppose that $g$ has nonnegative scalar curvature. Either $M$ admits a metric of strictly positive scalar curvature, or $g$ is Ricci-flat. In the Ricci-flat case, if $M$ is oriented and has positive dimension, then $parallel M parallel = 0$.]
] <lem:scalar-reduction>

#proof[
  Run the short-time Ricci flow starting at $g$. Short-time existence on closed manifolds and the scalar evolution equation give
  #[#set math.equation(numbering: n => "(2.1)")
   $ partial_t "Scal" = Delta "Scal" + 2 \| "Ric" \|^2 . $ <eq:scalar-evolution>]
  See #cite(label("Topping2006")) Theorem 5.2.1 and Proposition 2.5.4 for these statements in arbitrary dimension, and #cite(label("Hamilton1982")) for the Ricci-flow framework. The maximum principle preserves nonnegativity. If the initial scalar curvature is positive at one point, the strong maximum principle makes it positive everywhere at any sufficiently small later time. If it is initially identically zero but the Ricci tensor is nonzero at a point, (2.1) gives a strictly positive initial time derivative there. At a sufficiently small positive time $t_1$, scalar curvature is therefore positive at that point. Applying the strong maximum principle from $t_1$ produces a metric of positive scalar curvature everywhere at a later time. Thus failure of this alternative forces $"Ric"_g = 0$.
  For the final assertion, suppose that $g$ is Ricci-flat, that $M$ is oriented, and that $n = dim M > 0$. We use the orbit-packing argument of Milnor #cite(label("Milnor1968")) Theorem 1. Its complete universal Riemannian cover $\( tilde(M) \, tilde(g) \)$ has nonnegative Ricci curvature. Fix $x in tilde(M)$ and a finite generating set of $Gamma$. There is a constant $D$ such that
  $ d \( x \, gamma x \) lt.eq D \| gamma \| #h(2em) \( gamma in Gamma \) \, $
  where $\| gamma \|$ is word length. Choose a positive radius $r$ for which the balls $B \( gamma x \, r \)$, $gamma in Gamma$, are disjoint. To choose $r$, take a sufficiently small metric ball about the image of $x$ contained in an evenly covered neighborhood. The radius-$r$ balls about its lifts lie in distinct sheets and are therefore disjoint. All these balls have the same positive volume, say $v_r$. The orbit balls with $\| gamma \| lt.eq k$ lie in $B \( x \, D k + r \)$. Bishop–Gromov comparison #cite(label("Wei2007")) Theorem 4.1 therefore gives
  $ \# { gamma : \| gamma \| lt.eq k } thin v_r lt.eq "Vol" B \( x \, D k + r \) lt.eq omega_n \( D k + r \)^n . $
  Thus $Gamma$ has polynomial word growth. Write $b \( k \) = \# B_Gamma \( 1 \, k \)$. There are integers $k_j arrow.r oo$ such that $b \( k_j + 1 \) \/ b \( k_j \) arrow.r 1$. Otherwise, some $epsilon > 0$ would satisfy $b \( k + 1 \) \/ b \( k \) gt.eq 1 + epsilon$ for all sufficiently large $k$, forcing exponential growth. For each generator $s$,
  $ \# #scale(x: 120%, y: 120%)[\(] s B_Gamma \( 1 \, k_j \) triangle.stroked.t B_Gamma \( 1 \, k_j \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 #scale(x: 120%, y: 120%)[\(] b \( k_j + 1 \) - b \( k_j \) #scale(x: 120%, y: 120%)[\)] . $
  These balls form a Følner sequence, so $Gamma$ is amenable. This uses only the growth bound, without a structural classification of groups of polynomial growth. Real bounded cohomology of an amenable group vanishes in positive degrees #cite(label("Gromov1982")) Sections 3.0–3.1. The mapping theorem and duality used in 6 now imply $parallel M parallel = 0$. ◻
]

Every closed connected oriented one-manifold is a circle. Its self-cover of degree two and functoriality of the simplicial seminorm give $2 parallel S^1 parallel lt.eq parallel S^1 parallel$, hence $parallel S^1 parallel = 0$. Consequently, to prove the simplicial-volume theorem in every positive dimension, it remains to show that a positive-scalar-curvature manifold of dimension at least two is rationally inessential. Compactness lets us write its scalar lower bound as $"Scal"_M gt.eq kappa > 0$.

== 3 Compact pairings and comparison coordinates <sec:comparison>

The construction in this section is topological. A Riemannian metric is used only to measure derivatives in the direction of the original manifold. In particular, no curvature hypothesis enters the following statement. For a vector, $∥dot.op∥_oo$ is the maximum of the absolute coordinate values. Bounds asserted on a set are pointwise; uniform norms take the supremum over the domain.

#thm([Theorem 3.1.])[
  (Comparison data from rational essentiality).  #emph[Let $\( M^n \, g_M \)$ be a closed connected oriented Riemannian manifold, $n gt.eq 2$, let $Gamma = pi_1 \( M \)$, and suppose that its classifying map $c_M : M arrow.r B Gamma$ satisfies 
$ \( c_M \)_(*) \[ M \] eq.not 0 quad upright("in ") H_n \( B Gamma \; bb(Q) \) . $

 There are constants $J > 0$ and $R_0 gt.eq 1$ such that, for every real $R gt.eq R_0$, there exist a closed oriented smooth manifold $A$, a principal left $Gamma$-cover $hat(A) arrow.r A$, and an integer $q = n + dim A > n$ with the following properties. The diagonal cover 
$ Z = \( tilde(M) times hat(A) \) \/ Gamma arrow.r M times A $

 is oriented and has dimension $q$. There are a smooth compactly supported map $G : Z arrow.r bb(R)^q$ and a relatively compact open set $Omega subset Z$ such that 
#[#set math.equation(numbering: n => "(3.1)")
 $ deg \( G \, Omega \, 0 \) eq.not 0 \, #h(2em) ∥G∥_oo > 3 quad upright("on ") partial Omega \, $ <eq:comparison-degree>]

 and 
#[#set math.equation(numbering: n => "(3.2)")
 $ max_(1 lt.eq i lt.eq q) sup_Z lr(|d_(tilde(M)) G_i|)_(g_M) lt.eq J / R \, #h(2em) log q lt.eq J R . $ <eq:comparison-bounds>]

 Write $pi_Z : Z arrow.r M times A$ for the covering projection. Its differential gives a global splitting 
$ T Z = E_M xor E_A \, #h(2em) E_M = \( d pi_Z \)^(- 1) \( T M xor 0 \) \, #h(2em) E_A = \( d pi_Z \)^(- 1) \( 0 xor T A \) . $

 The bundle $E_M$ is tangent to the $tilde(M)$ fibres of $Z arrow.r A$, and $E_A$ is the flat lift of the parameter directions. We write $d_(tilde(M)) G_i = d G_i \|_(E_M)$. For each fixed $R$, after choosing any smooth metric on $A$, all derivatives of $G$ in the lifted product geometry are bounded. No bound uniform in $R$ is asserted for parameter derivatives or for derivatives of order greater than one. The covers and the parameter manifolds need not be connected.]
] <thm:comparison-data>

We use rational coefficients for the chain constructions in this section. A principal left $Gamma$-cover is a covering on which $Gamma$ acts freely by deck transformations and transitively on each fibre. Every diagonal quotient below uses left actions in both factors. Orientations on covers are lifted from the base, so all deck transformations preserve them.

The construction proceeds as follows. An auxiliary closed manifold $C$ provides a finite parameter space for a compactly supported group-cohomology pairing. Distance profiles then supply $q$ scalar coordinates, with $q$ initially only a row count. Relative duality produces a complementary rational class of degree $q - n$. Oriented realization of a nonzero multiple, followed by doubling, gives the parameter manifold $A$. Thus the final cover has exactly the dimension needed for a local degree, $n + dim A = q$; the topology of the realized $A$ does not alter the previously chosen row count.

=== 3.1 Probability maps and a finite parameter manifold <probability-maps-and-a-finite-parameter-manifold>

Fix a finite symmetric generating set of $Gamma$, and write $d_Gamma$ for its left-invariant word metric. For $a gt.eq 0$, let $cal(K)_a$ be the Rips complex realized as finite probability vectors $t = \( t_gamma \)_(gamma in Gamma)$ whose nonempty support has diameter at most $a$. This complex is locally finite, finite dimensional, and cocompact under left translation. The action is proper, although it need not be free when $Gamma$ has torsion.

#thm([Lemma 3.2.])[
  (A proper probability map).  #emph[There are $s gt.eq 1$, $H < oo$, a smooth equivariant probability map $h : tilde(M) arrow.r cal(K)_s$, and an equivariant simplicial map $h_0 : tilde(M) arrow.r cal(K)_s$ such that]
  + #emph[the coordinate functions of $h$ are smooth and locally supported on finitely many labels, and $lr(|d h|)_(ell^1) lt.eq H$;]
  + #emph[$h$ and $h_0$ are joined by an equivariant homotopy that is proper as a map $tilde(M) times \[ 0 \, 1 \] arrow.r cal(K)_s$;]
  + #emph[there is an invariant alternating homogeneous rational group $n$-cocycle $omega$ whose evaluation on the labelled fundamental simplices of $M$ is nonzero.]
] <lem:probability-map>

#proof[
  Choose a finite smooth triangulation of $M$ by the Cairns–Whitehead theorem #cite(label("Cairns1934")) #cite(label("Whitehead1940")); see also #cite(label("Munkres1966")) Theorem 10.6. Label the vertex lifts equivariantly by elements of $Gamma$, making one arbitrary choice for each vertex downstairs. Barycentric coordinates define the labelled simplicial map $h_0$. A smooth partition of unity subordinate to the open vertex stars, lifted equivariantly, gives $h$; weights with the same label are added. At each point the labels that occur belong to the vertices of one lifted simplex. Cocompactness bounds their word diameters by a fixed $s$, and it also bounds the $ell^1$-operator norm of $d h$ by a fixed $H$. Linear interpolation of the weights stays in $cal(K)_s$.
  For completeness, this entire homotopy is proper. If $Q subset tilde(M)$ is compact with $Gamma Q = tilde(M)$, its image during the homotopy is compact. Given a compact $B subset cal(K)_s$, properness of the $Gamma$-action allows only finitely many translates of that image to meet $B$. The inverse image of $B$ is therefore a closed subset of finitely many translates of $Q times \[ 0 \, 1 \]$.
  Choose a class in $H^n \( B Gamma \; bb(Q) \)$ pairing nontrivially with $\( c_M \)_(*) \[ M \]$, and represent it on the homogeneous bar resolution. On tuple chains, signed permutation averaging is an equivariant chain map lifting the identity of the augmentation. It is equivariantly chain homotopic to the identity on this free resolution. Antisymmetrizing the representative thus gives a cocycle $omega$ in the same class. It vanishes on repeated labels and restricts to a simplicial cocycle on every $cal(K)_a$.
  Give the vertices of $M$ a global order. Sending an ordered lifted simplex to its tuple of labels gives an augmentation-preserving equivariant chain map into the bar resolution. Such a map is unique up to equivariant chain homotopy: inductively, the difference in each degree is a cycle in the exact target resolution, and freeness of the source chains permits equivariant fillings. Comparison with the chain map induced by a classifying map shows that evaluation of $omega$ on these labelled fundamental simplices is precisely its pairing with $\( c_M \)_(*) \[ M \]$, and hence is nonzero. ◻
]

The detecting cocycle is now fixed. To construct a finite smooth parameter space carrying its compact pairing, we need a free auxiliary group action. The ordinary Rips action may have torsion stabilizers; keeping the order of every simplex removes them without requiring contractibility.

Fix henceforth $R gt.eq s + 1$ and set

#[#set math.equation(numbering: n => "(3.3)")
 $ L = 100 R . $ <eq:comparison-scales>]

All auxiliary spaces constructed at this scale may depend on $L$. Let $cal(O)_L$ be the semisimplicial complex with one simplex for each ordered tuple of distinct group elements of diameter at most $L$; faces are obtained by deleting slots, and different orderings are not identified. Projection of a tuple to its probability simplex gives $pi : cal(O)_L arrow.r cal(K)_L$. On chains it has the equivariant section

#[#set math.equation(numbering: n => "(3.4)")
 $ sigma \[ v_0 \, dots.h \, v_j \] = frac(1, \( j + 1 \) !) sum_(pi.alt in S_(j + 1)) "sgn" \( pi.alt \) \( v_(pi.alt \( 0 \)) \, dots.h \, v_(pi.alt \( j \)) \) . $ <eq:ordered-section>]

Counting the positions of a deleted entry verifies that $sigma$ is a chain map, and $pi_(\#) sigma = "id"$.

#thm([Lemma 3.3.])[
  (A parameter thickening).  #emph[Put $v_0 = dim cal(O)_L$. There are a closed oriented smooth $d$-manifold $C$, with $d lt.eq 2 v_0 + 2$, a principal left $Gamma$-cover $hat(C) arrow.r C$, and equivariant maps 
$ cal(O)_L arrow.r^i hat(C) arrow.r^r cal(K)_L \, #h(2em) r i = pi . $

 Moreover $v_0 lt.eq lr(|B_Gamma \( 1 \, L \)|)$.]
] <lem:parameter-thickening>

#proof[
  A point in the realization of $cal(O)_L$ belongs to the interior of a unique minimal-dimensional ordered simplex. A group element fixing the point must preserve that ordered simplex, hence must fix its labels slot by slot. It is therefore the identity. This also proves freeness at points represented on faces; face identifications do not identify distinct orderings of the minimal simplex. Local finiteness and the word-metric bound make the action proper and its quotient finite. Thus $cal(O)_L arrow.r cal(O)_L \/ Gamma$ is a principal cover, including when $Gamma$ has torsion. The quotient has a finite polyhedral subdivision. A simplex has at most $lr(|B_Gamma \( 1 \, L \)|)$ vertices after one of its vertices is translated to the identity, proving the dimension bound.
  Embed the finite polyhedron $cal(O)_L \/ Gamma$ in $bb(R)^(2 v_0 + 1)$ and choose an open neighborhood retracting onto it. Choose a compact smooth domain inside that neighborhood containing the polyhedron in its interior, and double the domain. Folding the double to the domain followed by the neighborhood retraction gives a retraction from a closed oriented manifold $C$ onto $cal(O)_L \/ Gamma$. Its dimension satisfies the stated bound. Pull back the principal cover along this retraction. The inclusion of the polyhedron lifts to $i$, while the pullback projection followed by $pi$ gives $r$. Their composition has the required value. ◻
]

Fix a smooth metric on $C$ and lift it to $hat(C)$. A useful consequence of continuity and cocompactness is the following uniform common-label property: sufficiently small subsets of $hat(C)$ have images under $r$ with a label common to every positive support. Indeed, at any point a positive coordinate remains positive on a neighborhood; a finite cover downstairs gives a uniform neighborhood size upstairs.

#thm([Lemma 3.4.])[
  (A controlled map to dual chains).  #emph[One can triangulate $C$ so finely that the lifted triangulation has the following properties:]
  + #emph[the union of the supports of $r \( o \)$ over any closed primal simplex has diameter at most $2 L$;]
  + #emph[there is an augmentation-preserving equivariant chain map 
$ cal(F) : C_(*) \( cal(O)_L \) arrow.r C_(*)^(upright("dual")) \( hat(C) \) $

 with finite output, such that if a dual cell to a primal simplex $tau$ occurs in $cal(F) \( e \)$, then every label of every $r \( o \)$, $o in tau$, is within $2 L$ of every vertex of $e$.]
] <lem:dual-carrier>

#proof[
  Use a sufficiently fine smooth triangulation, so that both primal simplices and closed dual blocks have arbitrarily small mesh. If all images over a primal simplex share a label, every pair of labels in their union is within $2 L$. This gives the first assertion.
  We describe the chain construction explicitly. The regular dual-cell decomposition has closed cells that are balls and cellular subcomplexes. Subdivide it barycentrically. A simplex $s'$ of this subdivision is a flag of dual cells; let $B \( s' \)$ be the closure of its largest cell. This is the unique minimal closed dual cell containing $s'$. For a face $t'$ of $s'$ we have $B \( t' \) subset B \( s' \)$, so these closed balls form a face-compatible acyclic carrier.
  There is an augmentation-preserving chain map from the subdivision chains to dual-cell chains carried by $B$. To construct it, send a vertex to a dual zero-cell in its carrier with coefficient one. If the map has been defined below dimension $j$, the image of the boundary of a $j$-simplex is an augmented cellular cycle in its carrier, because all face carriers are contained there. Fill the cycle within this contractible cellular subcomplex. Make all choices on simplex orbits and translate. The deck action on the subdivision is free, so this is equivariant. Each carrier is finite, and hence each output is finite.
  Now subdivide $cal(O)_L$ equivariantly and approximate the actual map $i$ closely by a simplicial map into the subdivision of the dual decomposition. Choose the target stars inside sufficiently small evenly covered balls. Simplicial approximation on the finite quotients can then be joined to the original map by a homotopy staying in those stars. Lifting that homotopy from $i$ gives an equivariant simplicial endpoint that remains uniformly close to $i$ upstairs. Equivalently, one may choose the stars directly on free vertex orbits. Compose source subdivision, this simplicial chain map, and the carrier map just constructed. This defines $cal(F)$. Contractibility of $cal(O)_L$ is not needed: the only fillings take place inside the target carrier balls.
  Consider a dual cell occurring on an original simplex $e$. Its carrier lies within a small mesh error of $i \( z \)$ for some $z in e$. The primal simplex $tau$ dual to that cell meets it at its barycenter; small primal mesh therefore puts every $o in tau$ within another small error of such an $i \( z \)$. Choose all meshes and the approximation close enough to apply the common-label property to the pair $o \, i \( z \)$. A common label $v$ belongs both to $r \( o \)$ and to $r \( i \( z \) \)$. Since $r i = pi$, the latter support consists of vertices of $e$. For a label $gamma$ of $r \( o \)$ and a vertex $w$ of $e$, we obtain
  $ d_Gamma \( gamma \, w \) lt.eq d_Gamma \( gamma \, v \) + d_Gamma \( v \, w \) lt.eq L + L . $
  This proves the second assertion. ◻
]

=== 3.2 A compactly supported pairing <a-compactly-supported-pairing>

For $0 lt.eq a lt.eq L$ define

$ D_a = \( cal(K)_a times hat(C) \) \/ Gamma \, #h(2em) X = \( tilde(M) times hat(C) \) \/ Gamma . $

Both spaces project to $C$. The oriented manifold $X$ has dimension $n + d$, and the probability map induces the graph map

$ X & arrow.r^(Phi_h) & D_L\
arrow.b &  & arrow.b\
C & = & C #h(2em) Phi_h \( \[ tilde(x) \, o \] \) = \[ h \( tilde(x) \) \, o \] . $

This map is proper, as is the graph homotopy induced by the homotopy in 9. To see joint properness, cover compact $C$ by finitely many compact subsets contained in trivializing charts of $hat(C)$. In each chart a compact subset of $D_L$ has compact first-factor projection. Joint properness of the probability homotopy controls the preimage in the $tilde(M)$ factor, and the parameter subset is compact. A finite union gives the assertion.

The chain construction has a specific target: cap each simplex with the detecting cocycle, retain the correct augmentation in degree $n$, and keep the complementary dual cells close to the original labels. The following lemma packages these properties before cellular duality is applied.

#thm([Lemma 3.5.])[
  (A controlled cap operation).  #emph[There are equivariant linear maps with finite output 
#[#set math.equation(numbering: n => "(3.5)")
 $ T_j : C_j \( cal(K)_L \; bb(Q) \) arrow.r C_(j - n)^(upright("dual")) \( hat(C) \; bb(Q) \) \, #h(2em) j gt.eq 0 \,\
partial T_j = \( - 1 \)^n T_(j - 1) partial \, #h(2em) j gt.eq 1 \, $ <eq:cap-chain-map>]

 where chain groups in negative degrees are zero. For every oriented $n$-simplex $e$, the augmentation of $T_n \( e \)$ is $omega \( e \)$. For every oriented $j$-simplex $e$, if a dual cell to a primal simplex $tau$ occurs in $T_j \( e \)$, then every label of $r \( o \)$, for every $o in tau$, is within $3 L$ of every vertex of $e$.]
] <lem:controlled-cap>

#proof[
  On an oriented $j$-simplex $e = \[ v_0 \, dots.h \, v_j \]$ define the averaged Alexander–Whitney diagonal by
  $ Delta_(upright("AW")) e = frac(1, \( j + 1 \) !) sum_(pi.alt in S_(j + 1)) "sgn" \( pi.alt \) sum_(k = 0)^j \[ v_(pi.alt \( 0 \)) \, dots.h \, v_(pi.alt \( k \)) \] ⊗ \[ v_(pi.alt \( k \)) \, dots.h \, v_(pi.alt \( j \)) \] . $
  Each ordering gives the usual diagonal on that simplex and its faces. Restriction of a uniformly chosen ordering to a face is again uniformly distributed, so the average commutes with the boundary. It is equivariant, and both factors in every term are faces of $e$.
  Apply $omega$ to the first factor of degree $n$ and $cal(F) sigma$ to the second factor, and call the resulting graded map $T$. Its outputs are finite. In the tensor boundary, the sum of terms from the first factor vanishes after evaluation by $omega$ because $delta omega = 0$. The boundary in the second factor carries the sign $\( - 1 \)^n$, proving (3.5). When $j = n$, each contributing second factor is a vertex. Its image under $cal(F) sigma$ has augmentation one, while alternation makes every signed first-factor evaluation equal to $omega \( e \)$. Thus the augmentation of $T_n \( e \)$ is exactly $omega \( e \)$.
  Finally, every output of $T_j \( e \)$ comes from a face of $e$. By 11, labels over its corresponding primal simplex are within $2 L$ of every vertex of that face. Since $e$ has diameter at most $L$, they are within $3 L$ of every vertex of $e$. ◻
]

Cellular duality will turn the finite output of $T$ in dual chains into primal cochains. Its support bound will make the resulting product class compactly supported, and its augmentation will recover the original cocycle pairing.

#thm([Proposition 3.6.])[
  (Compact diagonal pairing).  #emph[There are a compact set $K_(*) subset D_L$ and a class 
$ u in H^(n + d) \( D_L \, D_L \\ K_(*) \; bb(Q) \) $

 such that]
  + #emph[if $\[ t \, o \] in K_(*)$, every label of $t$ is within $7 L$ of every label of $r \( o \)$;]
  + #emph[the compactly supported evaluation 
#[#set math.equation(numbering: n => "(3.6)")
 $ ⟨Phi_h^(*) u \, \[ X \]_(upright("lf"))⟩ eq.not 0 $ <eq:compact-pairing-nonzero>]

 is nonzero.]
  #emph[Here $\[ X \]_(upright("lf"))$ is the locally finite fundamental class.]
] <prop:compact-pairing>

#proof[
  Cellular duality on the oriented cover identifies finite dual chains of degree $k$ with compactly supported primal cochains of degree $d - k$. Write this identification as $I$, choosing the degree signs so that $delta I = I partial$. At degree zero choose the sign for which evaluation on the oriented locally finite fundamental cycle is the augmentation; the remaining degree signs are then determined successively by the boundary–coboundary identity. On product cells, define a cochain $U$ of degree $n + d$ by
  #[#set math.equation(numbering: n => "(3.7)")
   $ U \( e^j \, e' ""^(thin n + d - j) \) & = a_j I \( T \( e \) \) \( e' \) \,\
a_n & = 1 \, #h(2em) a_j = \( - 1 \)^(j + n + 1) a_(j - 1) quad \( j > n \) \, $ <eq:product-cocycle>]
  and set it to zero outside the indicated chain degrees. The cochain is invariant under simultaneous translation and thus descends to $D_L$. The product-cell structure is valid even if the action on $cal(K)_L$ has inversions: the freely lifted second-factor cells give trivial stabilizers of product cells.
  On a product cell of bidegree $\( j \, n + d + 1 - j \)$, the two terms in $delta U$ are $a_(j - 1) I T \( partial e \)$ and $\( - 1 \)^j a_j I partial T \( e \)$. By (3.5), their coefficients relative to $I T \( partial e \)$ are $a_(j - 1)$ and $\( - 1 \)^(j + n) a_j$, which cancel. Thus $U$ is a cocycle.
  Call a product cell #emph[far] if all distances between vertices of its first simplex and labels of $r$ over its closed second simplex are greater than $4 L$. This condition is inherited by faces and is translation invariant, so the far cells form a subcomplex $D_(upright("far")) subset D_L$. The support bound in 12 shows that $U$ vanishes on it. Let $K_(*)$ be the union of the closures of all non-far cells in the quotient. There are only finitely many such cells: after fixing a second-factor simplex from finitely many orbit representatives, non-farness puts some first-factor vertex within $4 L$ of a label in a fixed finite set; the other vertices lie within $L$ of that vertex. Local finiteness of the word metric gives only finitely many choices.
  The same argument gives the required support bound. One pair of labels in a non-far product is within $4 L$, the first simplex has diameter at most $L$, and the union of second-factor labels has diameter at most $2 L$. Every pair in its closure is consequently within $4 L + L + 2 L = 7 L$. Furthermore $D_L \\ K_(*) subset D_(upright("far"))$, so the relative cellular class of $U$ induces the required class $u$.
  It remains to compute the pairing. By proper homotopy invariance of compactly supported cohomology, replace $h$ by $h_0$ and write $Phi_0$ for the resulting graph map. On the product cell structure of $X$, each open cell maps to an open product cell, possibly of smaller dimension. Thus $X_(upright("far")) = Phi_0^(- 1) \( D_(upright("far")) \)$ is a subcomplex. Every cell not in it lies in the compact set $Phi_0^(- 1) \( K_(*) \)$, and there are finitely many such cells by local finiteness. The locally finite fundamental class maps successively to
  $ H_(n + d) \( X \, X \\ Phi_0^(- 1) \( K_(*) \) \; bb(Q) \) arrow.r H_(n + d) \( X \, X_(upright("far")) \; bb(Q) \) . $
  In the latter group it is represented by the finite product fundamental cellular chain modulo $X_(upright("far"))$. Its coefficient on each remaining top cell is the local orientation coefficient, as follows by restricting further to local homology at an interior point. Hence evaluation by the relative cellular cocycle computes the desired compact pairing.
  Only bidegree $\( n \, d \)$ contributes. For each oriented fundamental top simplex of $M$, choose one lift and sum over all oriented fundamental top simplices of $hat(C)$. The latter sum evaluates $I T \( e \)$ on the locally finite parameter fundamental cycle and equals the augmentation of $T \( e \)$, namely $omega \( e \)$. Collapsed labelled top simplices contribute zero. The total is exactly the nonzero evaluation from 9, proving (3.6). ◻
]

=== 3.3 Distance profiles <distance-profiles>

The compact pairing detects the original fundamental class. We next encode its supporting region by finitely many scalar coordinates whose fibre derivatives have a scale-independent bound. Their row count will determine the dimension of the final parameter manifold only after these estimates have been fixed.

Choose a finite cover of $C$ by small trivializing charts $U_lambda$, with $d + 1$ colors and with charts of each color pairwise disjoint. One obtains this by taking open stars of the vertices of a sufficiently fine barycentric subdivision and coloring them by the dimensions of the original simplices. Shrink this finite cover and choose smooth functions $0 lt.eq w_lambda lt.eq 1$, supported in $U_lambda$, so that at least one equals one at each point of $C$. On every sheet over a chart choose an anchor $g_lambda \( o \) in Gamma$, constant on the sheet and equivariant under left translation, which is a common label of $r$ over that sheet. Thus it is within $L$ of every label of every $r \( o \)$ there.

For each color and each $b in B_Gamma \( 1 \, 1000 L \)$ use one row of a vector $V_o \( t \)$. Outside the charts of that color its value is zero; on the sheet of a chart $U_lambda$ it is

#[#set math.equation(numbering: n => "(3.8)")
 $ w_lambda \( macron(o) \) sum_(gamma in Gamma) t_gamma #scale(x: 120%, y: 120%)[\(] d_Gamma \( gamma \, g_lambda \( o \) b \) - d_Gamma \( g_lambda \( o \) \, g_lambda \( o \) b \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) macron(o) = \[ o \] . $ <eq:distance-profile-row>]

The disjointness within each color makes this definition unambiguous. Compact support of each cutoff inside its chart makes it smooth in the parameter wherever the probability coordinates are fixed. Left invariance of the word metric makes the vector invariant under simultaneous translation, and hence it is defined on $D_L$.

Pad the vector by zero rows if necessary so that its number $q$ of coordinates exceeds $n$. Since the word balls have at most exponential growth and $d lt.eq 2 lr(|B_Gamma \( 1 \, L \)|) + 2$, there is a constant $J_1$, independent of $R$, such that

#[#set math.equation(numbering: n => "(3.9)")
 $ log q lt.eq J_1 R . $ <eq:profile-count>]

Choose an even integer $p_R gt.eq 2$ with $q^(1 \/ p_R) lt.eq 3$. The norm $∥dot.op∥_(p_R)$ is smooth off zero and satisfies

#[#set math.equation(numbering: n => "(3.10)")
 $ ∥z∥_oo lt.eq ∥z∥_(p_R) lt.eq 3 ∥z∥_oo . $ <eq:profile-norms>]

#thm([Lemma 3.7.])[
  (Profile estimates).  #emph[The map $V : D_L arrow.r bb(R)^q$ has the following properties.]
  + #emph[It is continuous and proper, and $∥V∥_(p_R) lt.eq 24 L$ on $K_(*)$.]
  + #emph[If $t \, t' in cal(K)_s$ satisfy 
$ max { ∥V_o \( t \)∥_oo \, ∥V_o \( t' \)∥_oo } lt.eq 110 L \, #h(2em) ∥V_o \( t \) - V_o \( t' \)∥_oo lt.eq 14 R \, $

 then the union of their supports has diameter at most $L$.]
  + #emph[The map $cal(V) = V Phi_h : X arrow.r bb(R)^q$ is smooth. With $K_0 = s H$, each of its rows satisfies 
$ sup_X lr(|d_(tilde(M)) cal(V)_i|) lt.eq K_0 \, $

 where $K_0$ is independent of $R$.]
] <lem:distance-profiles>

#proof[
  Continuity follows from the coordinate definition and local finiteness. At any point choose a chart whose cutoff equals one, and use its $b = 1$ row. This row is the nonnegative average distance to its anchor $g$. For $t in cal(K)_L$ and any $gamma in "supp" t$, the triangle inequality gives
  $ d_Gamma \( gamma \, g \) lt.eq sum_(gamma') t_(gamma') d_Gamma \( gamma' \, g \) + L lt.eq ∥V_o \( t \)∥_oo + L . $
  Over finitely many trivializing charts, a bound on $V$ therefore restricts the first-factor labels to finitely many possibilities. Closed inverse images of compact subsets are consequently compact. On $K_(*)$, every input label is within $7 L + L = 8 L$ of the active anchor. Each distance difference in (3.8) is bounded by that distance to the anchor, giving $∥V∥_oo lt.eq 8 L$, and hence the stated $24 L$ bound.
  For the second assertion, use a chart of weight one common to both probabilities and let $g$ be its anchor. Every label of either probability is within $110 L + s$ of $g$. In particular a label $gamma in "supp" t$ equals $g b$ for one of the rows being used. In this row the average of $d_Gamma \( thin dot.op thin \, gamma \)$ over $t$ is at most $s$. The row comparison implies that the average over $t'$ is at most $s + 14 R$. Since $"supp" t'$ has diameter at most $s$, every $gamma' in "supp" t'$ satisfies
  $ d_Gamma \( gamma' \, gamma \) lt.eq 14 R + 2 s < L . $
  This applies to every label of $t$; the within-support distances already satisfy the bound.
  Finally, each row of $cal(V)$ is locally a finite smooth sum. In a $tilde(M)$ direction $sum_gamma d h_gamma = 0$. Choose one label from the current support and subtract its distance profile before differentiating. The remaining profile values have oscillation at most $s$, because the distance function to any fixed label is $1$-Lipschitz for $d_Gamma$. The derivative is thus bounded by $s lr(|d h|)_(ell^1) lt.eq s H$. A smooth nonnegative coordinate that vanishes at the point has zero differential, so zero probability coordinates introduce no additional labels into this estimate. ◻
]

=== 3.4 From a relative pairing to local degree <from-a-relative-pairing-to-local-degree>

We now have the row count $q$ and its logarithmic bound. Relative duality will turn the compact pairing into a transverse parameter cycle of dimension $q - n$. Its intersections with the graph of the coordinate map will supply the local degree, with different boundary pieces protecting the two cycles.

Let $E = C times bb(R)^q$. The set $V_o \( cal(K)_s \)$ depends only on $macron(o) = \[ o \]$, and we define

$ rho \( macron(o) \, y \) = "dist"_oo #scale(x: 120%, y: 120%)[\(] y \, V_o \( cal(K)_s \) #scale(x: 120%, y: 120%)[\)] . $

This is continuous. In a trivialization, fixed witnesses give upper semicontinuity. For the reverse inequality, a sequence of almost minimizing witnesses for bounded $y$ has bounded $V$-values; properness in 14 gives a convergent subsequence. Its limit is still in the closed subcomplex $cal(K)_s$, and gives lower semicontinuity.

Smooth $rho$ within error $R \/ 10$ on a neighborhood of $∥y∥_(p_R) lt.eq 110 L$, obtaining $rho_(upright("sm"))$. By Sard’s theorem #cite(label("Sard1942")), choose regular transverse levels

#[#set math.equation(numbering: n => "(3.11)")
 $ 100 L < T_0 < 101 L \, #h(2em) 5 R < d_0 < 6 R \, $ <eq:triad-levels>]

also choosing $T_0$ regular for $∥cal(V)∥_(p_R)$ on $X$. The latter function is smooth at these positive levels. Then

#[#set math.equation(numbering: n => "(3.12)")
 $ P = { \( macron(o) \, y \) : ∥y∥_(p_R) lt.eq T_0 \, med rho_(upright("sm")) \( macron(o) \, y \) lt.eq d_0 } $ <eq:compact-triad>]

is a compact oriented manifold with corners. Its radial and angular sides are denoted by $E_R$ and $E_B$, respectively. They satisfy

#[#set math.equation(numbering: n => "(3.13)")
 $ rho > 4 R med upright("on ") E_B \, #h(2em) rho < 7 R med upright("throughout ") P . $ <eq:triad-gaps>]

There is a map $psi : P arrow.r D_L$ over $C$ with

#[#set math.equation(numbering: n => "(3.14)")
 $ ∥V psi \( macron(o) \, y \) - y∥_oo < 7 R . $ <eq:witness-approximation>]

Indeed, at each point choose a witness in $cal(K)_s$ satisfying this inequality, and continue it as a constant probability vector in a small sheet trivialization. It remains a witness on a neighborhood. A finite partition of unity gives a convex mixture of these local witnesses, interpreted in the common fiber. Each witness has profile norm at most $T_0 + 7 R < 110 L$, and two witnesses at the same point have profiles differing by less than $14 R$. By 14, all labels in their union have pairwise distance at most $L$. Thus every mixture belongs to $cal(K)_L$. Linearity of $V$ in probability coordinates proves (3.14).

On $E_R$ its image satisfies

$ ∥V psi∥_(p_R) gt.eq T_0 - 21 R > 24 L \, $

so $psi \( E_R \)$ avoids $K_(*)$. Consequently

$ u_P = psi^(*) u in H^(n + d) \( P \, E_R \; bb(Q) \) $

is defined. The compact domain

$ N = { x in X : ∥cal(V) \( x \)∥_(p_R) lt.eq T_0 } $

has smooth boundary and maps by

$ j = \( macron(o) \, cal(V) \) : \( N \, partial N \) arrow.r \( P \, E_R \) . $

Its image is disjoint from $E_B$, since $rho$ is zero there. At a point of $N$, add $h \( tilde(x) \)$ to the family of witnesses used by $psi j$. The same support test shows that linear interpolation between $psi j$ and $Phi_h \|_N$ stays in $D_L$. On $partial N$, the profile norm throughout this homotopy is at least $T_0 - 21 R > 24 L$. Since $Phi_h^(- 1) \( K_(*) \)$ is in the interior of $N$, restriction and excision, followed by this homotopy, give

#[#set math.equation(numbering: n => "(3.15)")
 $ ⟨u_P \, j_(*) \[ N \, partial N \]⟩ eq.not 0 . $ <eq:relative-pairing>]

2 records the complementary boundary conditions used in the following duality argument.

#thm([Lemma 3.8.])[
  (A transverse parameter cycle).  #emph[There is a compact oriented smooth $\( q - n \)$-manifold $A_(+)$ with boundary, together with a smooth map 
$ \( o_0 \, y_0 \) : A_(+) arrow.r C times bb(R)^q \, $

 such that $∥y_0∥_(p_R) < T_0$ everywhere, $rho \( o_0 \, y_0 \) > 4 R$ on $partial A_(+)$, and its intersections with $j : N arrow.r C times bb(R)^q$ are transverse, interior, and have nonzero total oriented count. The component maps may be taken constant in the inward collar coordinate near $partial A_(+)$.]
] <lem:relative-degree>

#proof[
  Poincaré–Lefschetz duality for the triad $\( P \; E_R \, E_B \)$ #cite(label("Hatcher2002")) Theorem 3.43 sends $u_P$ to a class
  $ alpha in H_(q - n) \( P \, E_B \; bb(Q) \) \, $
  because $dim P = d + q$. Its relative intersection with $j_(*) \[ N \, partial N \]$ is, up to the fixed orientation convention, (3.15).
  We spell out the relative realization using the absolute theorem of Thom #cite(label("Thom1954")) Theorem III.4. Write $k = q - n$ and clear denominators in $alpha$. Choose an integral relative cycle $z$ in $\( P \, E_B \)$ representing the resulting class. Form the double $D = P union_(E_B) P'$ along the angular face. Compatible product collars at $E_R ∩ E_B$ give $D$ the structure of a smooth compact manifold with boundary; the seam $E_B$ is a separating hypersurface meeting the remaining boundary neatly. If the seam is empty, this double is the disjoint union of the two copies. Write $z'$ for the reflected chain. Because the boundary chains on the seam agree, $z - z'$ is an absolute cycle in $D$. The restriction and excision map
  $ H_k \( D \; bb(Z) \) arrow.r H_k \( D \, P' \; bb(Z) \) tilde.equiv H_k \( P \, E_B \; bb(Z) \) $
  sends $\[ z - z' \]$ to $\[ z \]$.
  The compact manifold $D$ has finite polyhedral type. Transfer the doubled class to a finite polyhedron homotopy equivalent to $D$, apply Thom’s theorem there, and compose back to $D$. This supplies a closed oriented smooth $k$-manifold $B$ and a map $f : B arrow.r D$ whose fundamental class maps to a nonzero integer multiple of $\[ z - z' \]$. Reverse the orientation if necessary to make this multiple positive. Push $f$ away from the remaining boundary of $D$ by an inward collar deformation, chosen tangent to the seam. Smooth $f$ and perturb it transversely to the seam. These operations are homotopies in $D$, and compactness keeps the image away from the boundary of the seam. Thus $Q = f^(- 1) \( E_B \)$ is a closed smooth hypersurface, and $B_(+) = f^(- 1) \( P \)$ and $B_(-) = f^(- 1) \( P' \)$ are compact oriented smooth manifolds with common boundary $Q$. Give $B_(+)$ the orientation restricted from $B$. The map $H_k \( B \; bb(Z) \) arrow.r H_k \( B \, B_(-) \; bb(Z) \) tilde.equiv H_k \( B_(+) \, Q \; bb(Z) \)$ sends $\[ B \]$ to $\[ B_(+) \, Q \]$: collar excision and the local orientation classes on the interior of $B_(+)$ characterize this restriction. Components wholly in $B_(-)$ vanish in the relative group. Naturality for the map of pairs $\( B \, B_(-) \) arrow.r \( D \, P' \)$, followed by the displayed target excision map, therefore gives
  $ \( f \|_(B_(+)) \)_(*) \[ B_(+) \, partial B_(+) \] = upright("a positive integer multiple of ") alpha quad upright("in ") H_k \( P \, E_B \; bb(Q) \) . $
  This proves the required relative realization without prescribing boundary data or requiring the representing map to be an embedding.
  Write $a_(+) : B_(+) arrow.r P$ for this representative and push its image off $E_R$ by a collar deformation respecting $E_B$. At a corner one uses a field pointing inward from the radial side and tangent to the angular side; transversality of the two defining functions supplies such a field. Compactness now separates $a_(+) \( B_(+) \)$ from $E_R$, and already separates $j \( N \)$ from $E_B$. Consequently all coincidences of $a_(+)$ and $j$ lie in a compact subset of the source interiors, with target values in $"int" P$.
  Perturb $a_(+)$ only near this compact coincidence set. More precisely, choose finitely many target coordinate neighborhoods with closures in $"int" P$ and use small flows of vector fields supported there to make $a_(+) times j$ transverse to the diagonal in $P times P$. Compactness permits the perturbation to be small enough that it creates no coincidences outside these neighborhoods. The whole homotopy remains a map of pairs $\( B_(+) \, partial B_(+) \) arrow.r \( P \, E_B \)$, is fixed near $partial B_(+)$, and keeps the image separated from $E_R$. Thus it preserves the relative class and its pairing with $j_(*) \[ N \, partial N \]$. The dimension sum is $\( q - n \) + \( n + d \) = q + d$, so the transverse intersections are isolated and have the asserted nonzero signed count. Set $A_(+) = B_(+)$ and write $\( o_0 \, y_0 \)$ for the perturbed map into $E = C times bb(R)^q$.
  Finally take a sufficiently small boundary collar, free of intersections, and precompose the map there by a smooth collar retraction that is constant in the inward collar coordinate near the boundary and is the identity away from a slightly larger collar. The image on that collar stays in a region where the strict separation inequalities hold. The resulting map is smooth, has the same interior intersections, and has the claimed collar form. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-3, -1.55), (3, 1.55), fill: rgb("#f7f7ff"), stroke: none)
  line((-3, -1.55), (-3, 1.55), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((3, -1.55), (3, 1.55), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((-3, -1.55), (3, -1.55), stroke: (paint: rgb("#bf6000"), thickness: 1.2pt, miter-limit: 10))
  line((-3, 1.55), (3, 1.55), stroke: (paint: rgb("#bf6000"), thickness: 1.2pt, miter-limit: 10))
  bezier((-3, -0.35), (3, 0.35), (-1.8, 0.5), (1.8, -0.5), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  bezier((-0.45, -1.55), (0.45, 1.55), (0.8, -0.5), (-0.8, 0.5), stroke: (paint: rgb("#600060"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#600060"))))
  circle((0, 0), radius: 0.07056, fill: black, stroke: none)
  content((0.15, 0.1), [#text(size: 9pt)[intersection]], anchor: "south-west", padding: 0.1176cm)
  content((-1.9, -0.03), [#text(size: 9pt)[$j(N)$]], anchor: "north", padding: 0.1176cm)
  content((-0.45, -1), [#text(fill: rgb("#600060"))[#text(size: 9pt)[$A_+$]]], anchor: "east", padding: 0.1176cm)
  content((-3, 0), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$E_R$]]], anchor: "east", padding: 0.1176cm)
  content((3, 0), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$E_R$]]], anchor: "west", padding: 0.1176cm)
  content((1.9, 1.55), [#text(fill: rgb("#bf6000"))[#text(size: 9pt)[$E_B$]]], anchor: "south", padding: 0.1176cm)
  content((1.9, -1.55), [#text(fill: rgb("#bf6000"))[#text(size: 9pt)[$E_B$]]], anchor: "north", padding: 0.1176cm)
  content((-2.1, 1.05), [#text(size: 9pt)[$P$]])
})],
  caption: [Figure 2: A schematic transverse section of the compact triad. The relative cycle $j \( N \)$ has boundary on the radial side $E_R$ and avoids $E_B$. Its dual representative $A_(+)$ has boundary on $E_B$ and is pushed off $E_R$. Their nonzero intersection becomes a local degree after the parameter is pulled back and doubled. The drawing records incidence and boundary conditions, not the dimensions of the cycles. ],
) <fig:degree-triad>

#proof[
  Double $A_(+)$ along its boundary, reversing the orientation on the second copy, to obtain a closed oriented manifold $A$. Reflect both component maps $o_0 \, y_0$ across the seam. The collar conclusion of 15 makes the resulting maps smooth. Pull back $hat(C) arrow.r C$ by $o_0 : A arrow.r C$, obtaining $hat(A) arrow.r A$, and form
  $ Z = X times_C A = \( tilde(M) times hat(A) \) \/ Gamma . $
  The projection $X arrow.r C$ is a submersion, so $Z$ is a smooth $q$-manifold even though $o_0$ need not be a submersion. Local sheet trivializations identify it with a product of the $tilde(M)$ fibre directions and the $A$ directions, with their product orientation. This also exhibits it as the stated cover of $M times A$. Continue to write $cal(V)$ for the pulled-back profile map.
  Choose once and for all a smooth function $eta : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$ equal to one on $\[ 0 \, 2 \]$ and zero on $\[ 3 \, oo \)$, and define
  #[#set math.equation(numbering: n => "(3.16)")
   $ G = eta #scale(x: 120%, y: 120%)[\(] ∥cal(V)∥_(p_R) \/ T_0 #scale(x: 120%, y: 120%)[\)] frac(cal(V) - y_0, R) . $ <eq:comparison-map>]
  Properness of the profile map and compactness of $A$ imply that its support is compact. It is smooth, including at $cal(V) = 0$, because the cutoff is constant in a neighborhood of that locus. Write $a : Z arrow.r A$ for the parameter projection, and let
  $ Omega = { z in Z : med a \( z \) in "int" A_(+) \, ∥cal(V) \( z \)∥_(p_R) < 2 T_0 } . $
  This is relatively compact. On its angular boundary the defining boundary inequality for $A_(+)$ gives $∥cal(V) - y_0∥_oo > 4 R$. On its other boundary,
  $ ∥cal(V) - y_0∥_(p_R) gt.eq 2 T_0 - ∥y_0∥_(p_R) > T_0 \, $
  and hence $∥cal(V) - y_0∥_oo > T_0 \/ 3$. The cutoff equals one on both parts of the boundary. In view of $T_0 > 100 L = 10000 R$, these bounds prove the boundary assertion in (3.1).
  The zeros in $Omega$ are exactly the intersections furnished by 15: if $cal(V) = y_0$, their common $p_R$-norm is less than $T_0$, so the point belongs to $N$. We check orientations to identify their signed count. In oriented local lifts, the difference of the two map differentials, in tangent variables $\( v_M \, v_C \, v_A \)$ and target rows $\( C \, bb(R)^q \)$, is
  $ mat(delim: "(", 0, I, - d o_0; d_(tilde(M)) cal(V), d_C cal(V), - d y_0) . $
  Substitute $v_C = v'_C + d o_0 \( v_A \)$. This substitution has determinant one. Moving the $C$ variables to the front introduces only the fixed dimensional sign $\( - 1 \)^(n d)$, and eliminating their identity block leaves the differential of the pulled-back $cal(V) - y_0$ on $Z$. Thus the intersection signs agree with its zero signs up to one fixed sign, independent of the point, sheet, and component. Division by the positive number $R$ does not change them. Their nonzero sum is therefore $deg \( G \, Omega \, 0 \)$ up to that sign. Doubling the parameter may cancel a global intersection count between its two copies; it does not change the local degree over the first copy used here.
  It remains to check the derivative bound. By Lemma 3.7, (3.10),
  $ lr(|d_(tilde(M)) cal(V)_i|) lt.eq K_0 \, #h(2em) lr(|d_(tilde(M)) ∥cal(V)∥_(p_R)|) lt.eq 3 K_0 quad \( cal(V) eq.not 0 \) . $
  In the cutoff transition region, $∥cal(V) - y_0∥_oo < 4 T_0$. Writing $E_eta = sup lr(|eta'|)$, differentiation of (3.16) gives for every row
  $ lr(|d_(tilde(M)) G_i|) lt.eq K_0 / R + frac(3 K_0 E_eta, T_0) frac(4 T_0, R) lt.eq frac(K_0 \( 1 + 12 E_eta \), R) . $
  The estimate also holds where the cutoff is constant. Together with (3.9), it proves (3.2) with $J = max { J_1 \, K_0 \( 1 + 12 E_eta \) \, 1 }$, increasing $R_0$ if necessary. Finally $G$ is a smooth compactly supported map on the lifted product geometry of the cover $Z arrow.r M times A$; each of its covariant derivatives therefore has finite supremum for this fixed $R$. ◻
]

== 4 A scalar-curvature identity for graph stabilization <sec:graph-calculus>

One shortening step increases a metric in the direction of a single function’s differential and adds one circle. The circle warp compensates for the scalar terms introduced by the graph. Warped-circle formulas are also central to the stabilization used in minimal slicing #cite(label("SchoenYau2017")) Lemma 2.5; here we compute their combination with a rank-one graph change before choosing the graph by a nonlinear equation.

We use the Laplacian $Delta = "div" nabla$ and the convention for which round spheres have positive scalar curvature. The base $\( B \, g \)$ may have any finite dimension and may already contain warped circle factors. All derivatives not explicitly assigned another metric are taken with respect to $g$.

Let $f in C^oo \( B \)$ and let $N : \[ 0 \, oo \) arrow.r \( 0 \, oo \)$ be smooth and constant near zero. Set

#[#set math.equation(numbering: n => "(4.1)")
 $ t = lr(|d f|)_g \, #h(2em) W = \( 1 + N \( t \)^2 t^2 \)^(1 \/ 2) \, #h(2em) v = W^(- 1) \,\
U = v N \( t \) nabla f \, #h(2em) r = lr(|U|)_g = v N \( t \) t \, #h(2em) D = - "div"_g U . $ <eq:graph-quantities>]

Although $t$ and $r$ need not be smooth where $d f = 0$, the functions $N \( t \)$ and $v$ and the vector field $U$ are smooth there. Indeed, $N \( t \)$ is constant near such points, and the other two are smooth functions of $d f$. We use identities involving $log t$ or $log r$ only where $t > 0$; the resulting scalar estimates extend by continuity. Consider

#[#set math.equation(numbering: n => "(4.2)")
 $ g^(+) = g + N \( t \)^2 d f^2 + v^2 d theta^2 quad upright("on ") B times bb(T) . $ <eq:graph-metric-update>]

The first two terms form the metric induced on the graph of $f$ in $\( B times bb(R) \, g + N \( t \)^2 d z^2 \)$, where $N \( t \)$ is regarded as a fixed function of the base point, independent of $z$.

#thm([Proposition 4.1.])[
  (Exact scalar-curvature identity).  #emph[At a point where $t > 0$, choose a $g$-orthonormal frame $e_1 = nabla f \/ t \, e_2 \, dots.h \, e_(dim B)$, and put 
$ frak(p) = frac(t N' \( t \), N \( t \)) \, #h(2em) A = d log t \, #h(2em) C_(j k) = t^(- 1) "Hess"_g f \( e_j \, e_k \) quad \( j \, k > 1 \) . $

 Then 
#[#set math.equation(numbering: n => "(4.3)")
 $ "Scal"_(g^(+)) - "Scal"_g =  & D^2 - 2 U \( D \) + r^2 lr(|C|)^2 + \( e_1 r \)^2\
 & + 2 r^2 \( 1 + frak(p) \) \( v^2 - frak(p) r^2 \) sum_(j > 1) A \( e_j \)^2 . $ <eq:scalar-exact>]

 In particular, the final term is nonnegative whenever $frak(p) gt.eq 0$ and $frak(p) N \( t \)^2 t^2 lt.eq 1$. For $N equiv 1$, one also has, everywhere, 
#[#set math.equation(numbering: n => "(4.4)")
 $ "Scal"_(g^(+)) - "Scal"_g = lr(|I I|)^2 + D^2 - 2 U \( D \) \, $ <eq:ordinary-scalar-update>]

 where $I I$ is the second fundamental form of the ordinary product graph. The inverse graph metric on base covectors and the volume form of $g^(+)$ are 
#[#set math.equation(numbering: n => "(4.5)")
 $ P = g^(- 1) - U ⊗ U \, #h(2em) d V_(g^(+)) = d V_g thin d theta . $ <eq:graph-inverse-volume>]

]
] <prop:scalar-update>

#proof[
  Write $E = N^(- 1) partial_z$ and give the graph the upward unit normal $nu = - U + v E$. Our convention for the second fundamental form is $I I \( X \, Y \) = ⟨nabla_X nu \, Y⟩$, so its trace is
  #[#set math.equation(numbering: n => "(4.6)")
   $ H = D - U \( log N \) . $ <eq:graph-mean-curvature>]
  The vertical Killing field $partial_z$ has normal speed $N v$ along the graph, and its tangential part projects to $N v U$ on the base. Vertical translation preserves the graph’s mean curvature as a function of that base point. The normal and tangential variation terms must therefore cancel, giving
  #[#set math.equation(numbering: n => "(4.7)")
   $ #scale(x: 120%, y: 120%)[\(] Delta_(upright("gr")) + lr(|I I|)^2 + "Ric"_(upright("amb")) \( nu \, nu \) #scale(x: 120%, y: 120%)[\)] \( N v \) = N v thin U \( H \) . $ <eq:graph-jacobi>]
  Here a normal variation of speed $psi$ changes $H$ by the negative of the Jacobi operator applied to $psi$, while a tangential variation differentiates $H$ in its tangential direction. This fixes the sign on the right of (4.7).
  The classical warped-product formulas #cite(label("BishopONeill1969")) Section 7, together with the Gauss equation, give, respectively,
  $ "Scal"_(upright("amb")) & = "Scal"_g - 2 Delta_g N \/ N \,\
"Scal"_(upright("gr")) & = "Scal"_(upright("amb")) - 2 "Ric"_(upright("amb")) \( nu \, nu \) + H^2 - lr(|I I|)^2 \,\
"Scal"_(g^(+)) & = "Scal"_(upright("gr")) - 2 Delta_(upright("gr")) v \/ v . $
  Expanding $Delta_(upright("gr")) \( N v \)$ in (4.7) therefore yields
  #[#set math.equation(numbering: n => "(4.8)")
   $ "Scal"_(g^(+)) - "Scal"_g =  & lr(|I I|)^2 + H^2 - 2 U \( H \)\
 & + 2 frac(\( Delta_(upright("gr")) - Delta_g \) N, N) + 4 ⟨d log N \, d log v⟩_P . $ <eq:scalar-before-cancellation>]
  The formula for $P$ in (4.5) follows directly by inverting the rank-one addition $g + N^2 d f^2$.
  Put $b_0 = d log N$. For a function on the base, $Delta_(upright("gr")) N$ is its ambient Hessian traced over the graph, minus $H nu \( N \)$. Since $"Hess"_(upright("amb")) N \( E \, E \) = N lr(|b_0|)^2$, this gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ frac(\( Delta_(upright("gr")) - Delta_g \) N, N) = - "Hess"_g log N \( U \, U \) - b_0 \( U \)^2 + r^2 lr(|b_0|)^2 + H b_0 \( U \) . $ <eq:graph-laplacian-correction>]
  Substitute $H = D - b_0 \( U \)$ in (4.8). The Hessian terms cancel because
  $ U #scale(x: 120%, y: 120%)[\(] b_0 \( U \) #scale(x: 120%, y: 120%)[\)] = "Hess"_g log N \( U \, U \) + b_0 \( nabla_U^g U \) . $
  The result is
  #[#set math.equation(numbering: n => "(4.10)")
   $ "Scal"_(g^(+)) - "Scal"_g =  & lr(|I I|)^2 + D^2 - 2 U \( D \) + 2 b_0 \( nabla_U^g U \) - 3 b_0 \( U \)^2\
 & + 2 r^2 lr(|b_0|)^2 + 4 ⟨b_0 \, d log v⟩_P . $ <eq:scalar-intermediate>]
  When $N equiv 1$, all terms involving $b_0$ vanish. This proves (4.4) without any condition on $D$ other than its definition.
  For the remaining calculation use the graph-orthonormal frame $T = v e_1 + r E \, e_2 \, dots.h \, e_(dim B)$. For base vector fields lifted independently of $z$, the ambient connection satisfies
  $ nabla_X^(upright("amb")) E = 0 \, #h(2em) nabla_E^(upright("amb")) X = b_0 \( X \) E \, #h(2em) nabla_E^(upright("amb")) E = - b_0^sharp . $
  Differentiating $nu = - U + v E$ gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ I I \( T \, T \) & = - r #scale(x: 120%, y: 120%)[\[] v^2 \( 1 + frak(p) \) + frak(p) #scale(x: 120%, y: 120%)[\]] A \( e_1 \) \,\
I I \( T \, e_j \) & = - r v \( 1 + frak(p) \) A \( e_j \) \, #h(2em) j > 1 \,\
I I \( e_j \, e_k \) & = - r C_(j k) \, #h(2em) j \, k > 1 . $ <eq:graph-second-form>]
  Moreover,
  #[#set math.equation(numbering: n => "(4.12)")
   $ b_0 = frak(p) A \, #h(2em) d log r = v^2 \( 1 + frak(p) \) A \, #h(2em) d log v = - r^2 \( 1 + frak(p) \) A \,\
nabla_U^g U = r^2 (v^2 \( 1 + frak(p) \) A \( e_1 \) e_1 + sum_(j > 1) A \( e_j \) e_j) . $ <eq:graph-log-derivatives>]
  For the last equality, symmetry of $"Hess" f$ gives $nabla_(e_1) e_1 = sum_(j > 1) A \( e_j \) e_j$.
  After substitution in (4.10), the $C$ terms give $r^2 lr(|C|)^2$. The remaining terms are squares of the component of $A$ along $e_1$ and of its components orthogonal to $e_1$. After division by $r^2$, the coefficient of $A \( e_1 \)^2$ is
  $ & #scale(x: 120%, y: 120%)[\[] v^2 \( 1 + frak(p) \) + frak(p) #scale(x: 120%, y: 120%)[\]]^2 - 2 frak(p) v^2 \( 1 + frak(p) \) - frak(p)^2\
 & #h(35mm)  = v^4 \( 1 + frak(p) \)^2 . $
  For every $j > 1$, the corresponding coefficient is
  $ 2 v^2 \( 1 + frak(p) \)^2 - 2 frak(p) \( 1 + frak(p) \) = 2 \( 1 + frak(p) \) \( v^2 - frak(p) r^2 \) . $
  Since $e_1 r = r v^2 \( 1 + frak(p) \) A \( e_1 \)$, these are precisely (4.3). Also
  $ v^2 - frak(p) r^2 = v^2 #scale(x: 120%, y: 120%)[\(] 1 - frak(p) N \( t \)^2 t^2 #scale(x: 120%, y: 120%)[\)] \, $
  which proves the positivity assertion. Finally, $det \( g + N^2 d f^2 \) = W^2 det g$ and $v W = 1$ prove the volume identity. ◻
]

The inverse-metric decrease will later let us sum the costs of many graph changes in a fixed $n$-dimensional space. First we must choose each graph so that the remaining term $D^2 - 2 U \( D \)$ can be bounded from below. The next section proves existence for the equation used for this choice.

== 5 Solving the graph equation on a cover <sec:graph-existence>

The scalar identity alone does not construct a graph. We now solve a nonlinear equation prescribing its divergence in terms of the error from a given function. The strict tangent band controls that error, while uniqueness will allow the solutions to descend through the flat-bundle transition maps and remain invariant under previously added circles.

The graph regularization and gradient-estimate strategy was inspired by the Jang-equation capillarity method of Schoen–Yau #cite(label("SchoenYau1981")) Section 4, pp. 251–253. The variable flux, tangent forcing, stabilization identity, and fixed-rank shortening estimates needed here are developed in this paper; their existence theorem is not being applied to the present equation.

We specify the uniformity needed for the nonlinear equation. Let $B$ be a Riemannian cover of a closed manifold, with lifted reference metric $g_(upright("ref"))$. Fix nested coordinate charts obtained by lifting a finite collection of relatively compact reference charts, with the smaller charts covering $B$. For $0 < alpha < 1$, uniform $C^(j \, alpha)$ norms are the suprema of the usual chart norms on these smaller charts; the larger charts provide room for interior estimates. Equivalent choices give equivalent norms. A metric $g$ is #emph[uniformly controlled] if it is uniformly equivalent to $g_(upright("ref"))$ and its coordinate coefficients have bounded derivatives of every order. The metric need not be invariant under deck transformations. We write $C_b^(j \, alpha)$ for these uniform Hölder spaces and $C_b^oo$ for smooth functions with bounded derivatives of every order.

Products of such covers with any fixed finite torus have the same properties. In all assertions in this Section, constants may depend on the particular finite-dimensional geometry and the fixed equation coefficients.

#thm([Lemma 5.1.])[
  (A uniform linear inverse).  #emph[Suppose that, in the reference charts, a scalar operator has the form 
$ L xi = - a^(i j) partial_i partial_j xi + b^i partial_i xi + c xi \, $

 with uniformly $C^(0 \, alpha)$ coefficients, uniformly bounded drift, uniformly positive definite principal matrix, and $c gt.eq c_0 > 0$. Then 
$ L : C_b^(2 \, alpha) \( B \) arrow.r C_b^(0 \, alpha) \( B \) $

 is an isomorphism. Its inverse is bounded in terms of the indicated uniform bounds. If the coefficients have bounded derivatives of every order, the inverse also maps $C_b^(j \, alpha)$ boundedly into $C_b^(j + 2 \, alpha)$ for every $j gt.eq 0$.]
] <lem:uniform-linear>

#proof[
  It suffices to prove the assertion when $dim B gt.eq 2$. If $d = dim B < 2$, put $T_0 = bb(T)^(2 - d)$ with its flat product metric and consider $overline(L) = L - Delta_(T_0)$ on $B times T_0$, with right-hand side pulled back from $B$. Its principal matrix is uniformly positive and its zeroth-order coefficient is still at least $c_0$. The result in dimension two gives a unique solution; translation invariance of the data and uniqueness make that solution independent of $T_0$. It therefore descends to the required solution on $B$. Restriction to a fixed torus point gives the same uniform estimates, and lifting two possible solutions proves uniqueness on $B$.
  Take a smooth compact exhaustion and solve the zero-boundary Dirichlet problem on each member. Bounded-domain elliptic Dirichlet theory applies since the principal matrix is uniformly positive and the zeroth-order term has the indicated sign; see, for example, the linear Schauder theory in #cite(label("GilbargTrudinger2001")) Theorems 6.2 and 6.14. The maximum principle gives, for right-hand side $F$,
  #[#set math.equation(numbering: n => "(5.1)")
   $ ∥xi∥_oo lt.eq c_0^(- 1) ∥F∥_oo \, $ <eq:uniform-inverse-sup>]
  independently of the exhaustion domain. On every smaller reference chart whose enlargement is contained in that domain, the interior estimate gives
  $ ∥xi∥_(C^(2 \, alpha) \( upright("smaller chart") \)) lt.eq C #scale(x: 120%, y: 120%)[\(] ∥F∥_(C^(0 \, alpha) \( upright("larger chart") \)) + ∥xi∥_oo #scale(x: 120%, y: 120%)[\)] \, $
  with one constant for all charts. Local compactness and a diagonal subsequence produce a solution on $B$. Each fixed enlarged chart eventually lies in the exhaustion, so the same estimate holds at every point of the limit. Taking the supremum over charts proves that the solution belongs to $C_b^(2 \, alpha)$ with a bounded norm. No estimate at the moving exhaustion boundary is needed. If $B$ is compact, one instead uses the closed-manifold version of the same theory.
  For uniqueness, suppose $L xi = 0$ and $S = sup_B xi > 0$. Center uniform charts at a sequence of points where $xi arrow.r S$. The pulled-back coefficients have a convergent local $C^(0 \, beta)$ subsequence, and the functions a convergent $C^(2 \, beta)$ subsequence, for $0 < beta < alpha$. At the center of the limiting chart the limiting function attains the maximum $S$. There its gradient vanishes and its Hessian is negative semidefinite, so
  $ L xi gt.eq c_0 S > 0 \, $
  a contradiction. Apply the same argument to $- xi$. This also proves the global maximum principle used in (5.1) for any solution in the uniform class. Higher-order interior estimates give the final assertion. ◻
]

#thm([Theorem 5.2.])[
  (Uniform graph solvability).  #emph[Let $\( B \, g \)$ be uniformly controlled as above, and let $ell in C_b^oo \( B \)$. Fix $epsilon \, w \, B_0 \, s > 0$ and $0 lt.eq beta < 1$. Suppose $N$ is smooth, positive, nondecreasing, constant near zero, and equal to $1$ for $t gt.eq 1 \/ 2$. Define the quantities in (4.1) and 
$ lambda \( r \) = B_0 \( r^2 + s^2 \)^(beta \/ 2) . $

 There is a unique solution in the uniform $C^(2 \, alpha)$ class with a uniform band margin to 
#[#set math.equation(numbering: n => "(5.2)")
 $ - "div"_g U = lambda \( r \) tan (frac(ell - epsilon f, w)) \, #h(2em) lr(|ell - epsilon f|) < frac(pi w, 2) . $ <eq:graph-equation>]

 This solution lies in $C_b^oo \( B \)$, and the band has a positive uniform margin. The metric (4.2) is uniformly controlled and complete.]
  #emph[The solution is invariant under every isometry preserving the equation’s data. The following parameter statement will be used below. Fix the reference cover, its metric and nested charts, and the equation parameters $epsilon \, w \, B_0 \, s \, beta \, N$. Let $\( g_a \, ell_a \)$ be a jointly smooth family over a finite-dimensional parameter manifold $A$. For every relatively compact subset $V' subset.double V$ of a parameter chart, assume common constants $c_(V') \, C_(V') > 0$ such that 
$ c_(V') g_(upright("ref")) lt.eq g_a lt.eq C_(V') g_(upright("ref")) #h(2em) \( a in V' \) \, $

 and common bounds in the fixed reference charts for every mixed derivative of the coefficients of $g_a$ and of $ell_a$, including order zero. Then $a mapsto f_a$ is smooth in every $C_b^(j \, alpha)$ norm, for $j gt.eq 0$ and $0 < alpha < 1$. If $A$ is compact, all mixed derivatives of $f_a$ are uniformly bounded and the tangent band has a common positive margin. For a bundle of such covers, the local solutions glue whenever fixed reference deck transformations carry one local data set to another.]
] <thm:uniform-graph>

#proof[
  We may assume $dim B gt.eq 2$. Once the theorem is proved in those dimensions, the lower-dimensional cases follow by taking the product with $T_0 = bb(T)^(2 - dim B)$, using the product metric and pulling back $ell$. The solution on $B times T_0$ is invariant under $T_0$ translations by uniqueness, and hence is pulled back from a function on $B$. For such a function the flux is $\( U \, 0 \)$ and its product divergence is $"div"_g U$, so the descended function solves exactly (5.2). Restriction to a fixed torus point gives the uniform and parameter bounds, and lifting two possible solutions gives uniqueness. The graph metric claims then follow from the same final bounds below.
  Replace $ell$ by $tau ell$, $0 lt.eq tau lt.eq 1$, and start at $f = 0$ for $tau = 0$. We use $C_b^(2 \, alpha) \( B \)$, for a fixed $0 < alpha < 1$, as the solution space.
  #strong[Linearization and openness.] As a function of the covector $d f$, the flux $U$ has transverse eigenvalue $r \( t \) \/ t$ and radial eigenvalue
  #[#set math.equation(numbering: n => "(5.3)")
   $ r' \( t \) = frac(N \( t \) \( 1 + frak(p) \( t \) \), \( 1 + N \( t \)^2 t^2 \)^(3 \/ 2)) > 0 . $ <eq:graph-flux-ellipticity>]
  Both extend positively and smoothly through $t = 0$, since $N$ is constant there. Hence the equation is uniformly elliptic on every bounded gradient range.
  On the open set of $C_b^(2 \, alpha)$ functions with a positive uniform margin in the tangent band, the equation is a smooth map into $C_b^(0 \, alpha)$. The apparent nonsmoothness of $r = lr(|U|)$ at zero causes no problem: $lambda$ is a smooth function of $r^2$, and the flux is smooth in $d f$. At an individual solution, moving the right-hand side to the left gives the linearization
  #[#set math.equation(numbering: n => "(5.4)")
   $ - "div"_g #scale(x: 120%, y: 120%)[\(] a_f \( d xi \) #scale(x: 120%, y: 120%)[\)] + upright(bold(b)) \( d xi \) + frac(epsilon lambda \( r \), w) sec^2 (frac(tau ell - epsilon f, w)) xi . $ <eq:graph-linearization>]
  Here $a_f$ is the derivative of the flux. After expansion, the coefficients are uniformly Hölder, and the zeroth-order coefficient is at least $epsilon B_0 s^beta \/ w > 0$. The individual $C_b^(2 \, alpha)$ bound supplies a bounded gradient range, so 17 makes the linearization invertible. The Banach implicit function theorem proves openness in $tau$.
  #strong[Comparison and individual regularity.] Two solutions in this class agree. To see this, take a positive supremum of their difference, if one exists, and pass to a limiting uniform chart as in 17. At the limiting maximum their gradients agree and their Hessians are ordered. At that common gradient the right-hand side of the equation is strictly decreasing in height, with derivative at most $- epsilon B_0 s^beta \/ w$. The two equations are therefore incompatible. The same argument compares a solution with a strict upper or lower barrier.
  Each individual solution has uniform bounds in every higher derivative before we seek bounds independent of $tau$. Indeed its given $C_b^(2 \, alpha)$ norm and band margin make the equation uniformly elliptic with smooth nonlinearities on a bounded range. In a chart, write its nondivergence form as
  $ a^(i j) \( x \, d f \) f_(i j) = H \( x \, f \, d f \) . $
  For $z = partial_k f$, differentiation, initially by difference quotients, gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ a^(i j) partial_i partial_j z + #scale(x: 120%, y: 120%)[\(] a_(p_l)^(i j) f_(i j) - H_(p_l) #scale(x: 120%, y: 120%)[\)] partial_l z - H_f z = H_(x_k) - a_(x_k)^(i j) f_(i j) . $ <eq:individual-graph-bootstrap>]
  The coefficients and source are uniformly $C^(0 \, alpha)$ using only the individual $C^(2 \, alpha)$ bound. The difference quotients have bounded sup norms, so interior Schauder estimates on smaller charts give $f in C_b^(3 \, alpha)$. Iterating gives $C_b^oo$. These constants may at this stage depend on the individual solution.
  #strong[Uniform tangent-band barriers.] For $delta > 0$ consider
  $ f_plus.minus = epsilon^(- 1) #scale(x: 120%, y: 120%)[\(] tau ell plus.minus \( pi \/ 2 - delta \) w #scale(x: 120%, y: 120%)[\)] . $
  Their gradient and divergence terms are bounded uniformly in $tau$ and in small $delta$. At $f_(+)$ the tangent term is negative and diverges uniformly to $- oo$ as $delta arrow.b 0$; at $f_(-)$ it diverges uniformly to $+ oo$. This uses $lambda gt.eq B_0 s^beta > 0$. Choose a sufficiently small fixed $delta$ so that these are strict upper and lower barriers. Comparison gives, for every solution along the homotopy,
  #[#set math.equation(numbering: n => "(5.6)")
   $ f_(-) lt.eq f lt.eq f_(+) \, #h(2em) lr(|tau ell - epsilon f|) lt.eq \( pi \/ 2 - delta \) w . $ <eq:uniform-graph-band>]
  In particular the heights and the band margins are now controlled independently of $tau$.
  #strong[A uniform gradient bound.] Fix one solution along the continuation path. If $sup_B t lt.eq 1$, there is nothing to prove. Otherwise choose points where $t$ approaches its supremum. The individual higher bounds just established allow the metric, data, and solution to converge in uniform charts, in enough derivatives for the graph equation and its Jacobi identity. The limiting slope attains its maximum at the center. This passage uses finite bounds for that one solution; the estimate obtained at the maximum will depend only on the fixed data and the uniform band margin.
  At this maximum, $t > 1$, so $N = 1$ on a neighborhood. The graph is locally an ordinary product graph, $v = \( 1 + t^2 \)^(- 1 \/ 2)$ has a minimum, and $d r = 0$. Put
  $ h_e = 1 / w (lambda + D^2 / lambda) = lambda / w sec^2 (frac(tau ell - epsilon f, w)) . $
  Differentiating the right-hand side of the equation along $U$, and using $d r = 0$ and $v U \( f \) = r^2$, the vertical translation identity becomes
  #[#set math.equation(numbering: n => "(5.7)")
   $ #scale(x: 120%, y: 120%)[\(] Delta_(upright("gr")) + lr(|I I|)^2 + "Ric"_(g + d z^2) \( nu \, nu \) #scale(x: 120%, y: 120%)[\)] v = v h_e tau U \( ell \) - epsilon h_e r^2 . $ <eq:gradient-jacobi>]
  The band bound implies fixed constants $0 < h_min lt.eq h_e lt.eq h_max < oo$. The fixed uniformly controlled base has $"Ric"_g gt.eq - C_(upright("Ric")) g$. At the minimum of $v$, the left-hand side of (5.7) is at least $- C_(upright("Ric")) v$. Since $r^2 > 1 \/ 2$ there and $lr(|U \( ell \)|) lt.eq ∥d ell∥_oo$, it follows that
  $ frac(epsilon h_min, 2) lt.eq v #scale(x: 120%, y: 120%)[\(] C_(upright("Ric")) + h_max ∥d ell∥_oo #scale(x: 120%, y: 120%)[\)] . $
  This bounds $v$ below by a positive constant and hence bounds $t$ above, uniformly in $tau$. One may add $1$ to the denominator when writing an explicit positive bound. All constants in this final estimate depend only on the fixed data and the already uniform band margin; the individual higher norms used to attain the limiting maximum have disappeared.
  #strong[Uniform higher estimates and closedness.] After the gradient estimate, the flux is uniformly elliptic on a fixed bounded range. Absorbing the metric volume density, write
  $ - partial_i cal(A)^i \( x \, partial f \) = cal(H) \( x \, f \, partial f \) . $
  Every coordinate derivative $z = partial_k f$ satisfies
  #[#set math.equation(numbering: n => "(5.8)")
   $ - partial_i #scale(x: 120%, y: 120%)[\(] cal(A)_(p_j)^i partial_j z #scale(x: 120%, y: 120%)[\)] = cal(H)_(p_j) partial_j z + cal(H)_f z + cal(H)_(x_k) + partial_i cal(A)_(x_k)^i . $ <eq:graph-divergence-bootstrap>]
  The drift coefficient and the nondivergence source are uniformly bounded; the last term is the divergence of a uniformly bounded vector field. Interior Hölder regularity for scalar divergence-form equations gives a uniform $C^(0 \, alpha')$ bound for $z$ on smaller charts, for some $alpha' > 0$; we use #cite(label("GilbargTrudinger2001")) Theorem 8.24. In that theorem’s notation take $b^i = d = 0$, retain the bounded drift, and treat $cal(H)_f z + cal(H)_(x_k)$ as scalar data and $cal(A)_(x_k)^i$ as divergence data, with the signs determined by (5.8). On a fixed chart these bounded data satisfy its $L^(r \/ 2)$ and $L^r$ hypotheses for any finite $r > dim B$. The estimate uses the local $L^2$ norm of $z$, already controlled by the gradient bound; it requires no bound for the derivatives of $z$. Thus its constants depend only on ellipticity, the fixed chart size, the displayed data bounds, and the gradient bound. We obtain a uniform $C^(1 \, alpha')$ bound for $f$.
  The original equation now has uniformly $C^(0 \, alpha')$ nondivergence coefficients and right-hand side. Interior Schauder estimates give $C^(2 \, alpha')$ bounds, and (5.5) gives higher uniform bounds by iteration. In particular these imply uniform $C^(2 \, alpha)$ bounds for the originally chosen $alpha < 1$, by using a bound on one further derivative. Given a sequence of solvable parameters tending to $tau_(*)$, local compactness on an exhaustion produces a solution at $tau_(*)$ with the same uniform bounds and band margin. The solvable set is therefore closed as well as open, and contains all of $\[ 0 \, 1 \]$.
  #strong[Symmetries and parameter dependence.] An isometry preserving the data takes a solution to a solution; uniqueness gives invariance. More generally, an isometry carrying one set of data to another carries their solutions to one another by pullback. The uniform solution class is preserved: covariant Hölder norms for the uniformly controlled metric are equivalent to the reference-chart norms, and these intrinsic norms are unchanged under an isometry. In particular all old torus translations preserve a solution when they preserve the input data.
  For parameter dependence it is essential to use the stated mixed bounds. If $h \( x \, a \)$ is any input coefficient in a local parameter chart, bounds on its mixed derivatives imply smoothness of $a mapsto h \( dot.op \, a \)$ in every $C_b^(j \, alpha)$ norm. Explicitly, Taylor’s formula in $a$, applied also to $x$ derivatives through order $j + 1$, gives
  $ ∥h \( dot.op \, a + u \) - h \( dot.op \, a \) - D_a h \( dot.op \, a \) u∥_(C_b^(j \, alpha)) lt.eq C lr(|u|)^2 . $
  The additional $x$ derivative controls the Hölder seminorm on the uniformly bounded charts. Applying the same argument to every parameter derivative proves the claimed Banach-space smoothness.
  The equation is therefore a smooth Banach map in $a$ as well as $f$. The fixed reference charts supply the Banach spaces, while the common metric equivalence on $V'$ supplies locally uniform ellipticity on bounded gradient ranges. At each parameter, the invertible linearization gives a locally smooth solution by the implicit function theorem. Applying the higher-order part of 17 gives the same conclusion in every higher norm, and uniqueness identifies all the local branches. Compactness of $A$ supplies uniform mixed bounds and a common band margin using finitely many such neighborhoods.
  For gluing, suppose a fixed reference deck transformation $psi$ carries one local data set to another, so that $g_a^(\( 2 \)) = psi^(*) g_a^(\( 1 \))$ and $ell_a^(\( 2 \)) = psi^(*) ell_a^(\( 1 \))$. It is then an isometry between those data sets. Naturality and uniqueness give $f_a^(\( 2 \)) = psi^(*) f_a^(\( 1 \))$. Extending $psi$ by the identity on old circle factors gives the compatibility needed for the flat bundles below.
  Finally, $d f$ is bounded, $N$ is positive and bounded on its attained range, and $v$ is bounded below. Thus $g^(+)$ is uniformly equivalent to the reference product metric and has bounded coefficient derivatives of every order. Its completeness follows from that equivalence to a complete reference metric. ◻
]

We have obtained a smooth graph for each fixed finite set of data, together with the symmetry and parameter control needed to repeat the construction. The estimates in the next section will use its equation to bound scalar loss independently of these potentially large analytic regularity constants.

== 6 Shortening all comparison coordinates <sec:shortening>

Return to the flat bundle

$ Z = \( tilde(M) times hat(A) \) \/ Gamma arrow.r A \, #h(2em) q = n + dim A \, $

where $M^n$ and $A$ are closed and $hat(A) arrow.r A$ is a principal left $Gamma$-cover. The covering projection to $M times A$ induces the splitting $T Z = E_M xor E_A$ described in 8. Here $E_M$ is tangent to the $tilde(M)$ fibres, while $E_A$ is the flat lift of the parameter directions. Local choices of sheets over $A$ identify the fibres with $tilde(M)$; the transition maps are fixed deck transformations. We first change the metric in the fibre directions and add circles. The metric on $E_A$ is introduced only in the final assembly step.

A metric with $b$ stabilizing circles has, locally over $A$, the form

#[#set math.equation(numbering: n => "(6.1)")
 $ g_h \( x \, a \) + sum_(nu = 1)^b m_nu \( x \, a \)^2 d theta_nu^2 . $ <eq:fibre-stabilized-metric>]

Here $g_h$ acts on the $n$ fibre directions, the positive warps depend only on $x \, a$, and the metric is invariant under all circle translations. At every fixed finite stage, the coefficients and all mixed derivatives will be bounded, and the metric will be uniformly equivalent to the lifted reference product. These bounds may depend on the stage.

Until the parameter metric is assembled in 20, every differential, gradient and scalar curvature is computed on the fibre $tilde(M) times bb(T)^b$ with $a in A$ fixed. The functions and metrics may vary smoothly with $a$; this variation is measured separately by the mixed derivative bounds. Thus a torus-invariant fibre differential lies in the original $n$ fibre directions, even though its full differential on $Z$ may have a nonzero parameter component.

=== 6.1 The cost of one pass <the-cost-of-one-pass>

A pass processes each of $q$ comparison functions once. In this section, $L$ denotes a bound for their current fibre differentials. The scalar estimate for a pass depends on $n$ and $log q$, even though the full fibre dimension includes all the circles already introduced.

#thm([Lemma 6.1.])[
  (One pass).  #emph[Let $q gt.eq 2$ and $L \, w > 0$. On a uniformly controlled metric of the form (6.1), suppose smooth bounded torus-invariant functions $ell_1 \, dots.h \, ell_q$ have bounded derivatives of every order. For a smooth family over a compact parameter manifold, assume in each of finitely many parameter charts common bounds for every mixed fibre and parameter derivative of the metric coefficients, warps, and functions, and a common equivalence to the reference fibre product. Suppose 
$ lr(|d ell_i|)_(g_(*)) lt.eq L \, $

 where $g_(*)$ denotes the metric on $E_M$ at the start of the pass. Then one can add $q$ circles and replace these functions by $ell_i^(+)$ so that 
#[#set math.equation(numbering: n => "(6.2)")
 $ lr(|ell_i^(+) - ell_i|) < pi / 2 w \, #h(2em) lr(|d ell_i^(+)|)_(g_h^(+)) lt.eq L / 4 \, #h(2em) g_h^(+) gt.eq g_(*) . $ <eq:pass-function-bounds>]

 For an absolute constant $C_0$, the full fibre scalar curvature satisfies 
#[#set math.equation(numbering: n => "(6.3)")
 $ "Scal"_(g^(+)) gt.eq "Scal"_g - C_0 \( n + 1 \) \( 2 + log q \) L^2 / w^2 . $ <eq:pass-scalar-bound>]

 All data at the new finite stage remain uniformly controlled. For a compact parameter family satisfying the stated hypotheses, the new mixed derivatives are also uniformly bounded.]
] <lem:one-pass>

#proof[
  Set
  #[#set math.equation(numbering: n => "(6.4)")
   $ epsilon = L \/ 4 \, #h(2em) a_0 = \( 2 + log q \)^(- 1) \, #h(2em) beta = 1 - a_0 \, #h(2em) s = q^(- 3) \, #h(2em) B_0 = frac(4 L, a_0 w) . $ <eq:pass-parameters>]
  Choose a smooth nondecreasing cutoff $phi.alt$ which is zero for $t lt.eq 1 \/ 4$, one for $t gt.eq 1 \/ 2$, and satisfies $0 lt.eq phi.alt' lt.eq 10$. Let
  #[#set math.equation(numbering: n => "(6.5)")
   $ N \( t \)^2 = s^2 + \( 1 - s^2 \) phi.alt \( t \) . $ <eq:pass-cutoff>]
  Writing $frak(p) = t N' \/ N$, we have
  #[#set math.equation(numbering: n => "(6.6)")
   $ frak(p) gt.eq 0 \, #h(2em) frak(p) N \( t \)^2 t^2 = 1 / 2 t^3 \( 1 - s^2 \) phi.alt' \( t \) lt.eq 5 \/ 8 < 1 . $ <eq:pass-cutoff-positivity>]
  The expression vanishes outside $\[ 1 \/ 4 \, 1 \/ 2 \]$, which justifies the displayed bound.
  For one coordinate, denote the original function by $ell$ and the current full fibre metric by $g$. Solve (5.2) with these choices and replace
  $ g mapsto g^(+) = g + N \( t \)^2 d f^2 + v^2 d theta^2 \, #h(2em) ell mapsto ell^(+) = epsilon f . $
  18 applies on $tilde(M) times bb(T)^b$. Its uniqueness gives torus invariance and compatibility with the parameter trivializations. Consequently $d f$ vanishes on the circle directions, so the metric retains the form (6.1). Its block on $E_M$ has only increased. Since
  $ lr(|d f|)_(g^(+)) = v t lt.eq 1 $
  (the inequality is immediate for $t < 1 \/ 2$, and $N = 1$ for $t gt.eq 1 \/ 2$), the new coordinate has derivative norm at most $L \/ 4$. Subsequent steps can only improve this bound. The tangent band gives the height estimate in (6.2).
  It remains to estimate the scalar loss in a way that can be summed. At $t > 0$, put $z = e_1 r$. Differentiating $lambda \( r \) = B_0 \( r^2 + s^2 \)^(beta \/ 2)$ along $U = r e_1$ gives
  $ frac(U \( lambda \), lambda) = gamma z \, #h(2em) gamma = frac(beta r^2, r^2 + s^2) in \[ 0 \, beta \] . $
  The part of $- 2 U \( D \)$ contributed by this derivative is $- 2 gamma z D$. Hence
  #[#set math.equation(numbering: n => "(6.7)")
   $ D^2 + z^2 - 2 gamma z D gt.eq \( 1 - gamma^2 \) D^2 gt.eq a_0 D^2 . $ <eq:pass-square-absorption>]
  By (6.6), the final term of (4.3) is nonnegative.
  Measure the vector $U$ in the metric at the start of the pass, and set
  $ b_U = lr(|U|)_(g_(*)) . $
  Since the current metric on $E_M$ is at least $g_(*)$, one has $b_U lt.eq r$. The input coordinate still satisfies $lr(|d ell|)_(g_(*)) lt.eq L$, so $U \( ell \) lt.eq L b_U$, while $U \( f \) = r t$. Differentiating the tangent in the equation therefore contributes an adverse term bounded above by
  #[#set math.equation(numbering: n => "(6.8)")
   $ 2 / w (lambda + D^2 / lambda) \( L b_U - epsilon r t \)_(+) . $ <eq:pass-adverse-term>]
  Since $0 lt.eq r < 1$ and $beta < 1$,
  $ lambda = B_0 \( r^2 + s^2 \)^(beta \/ 2) gt.eq B_0 r . $
  Thus the $D^2$ part of (6.8) is at most
  $ frac(2 L, w B_0) D^2 = a_0 / 2 D^2 \, $
  which is absorbed by (6.7).
  For the remaining part, first suppose $r < s$. Then
  #[#set math.equation(numbering: n => "(6.9)")
   $ lambda b_U lt.eq sqrt(2) B_0 s^(beta + 1) lt.eq frac(sqrt(2) B_0, q) . $ <eq:pass-small-slope>]
  Here $s = q^(- 3)$ and $beta > 0$. If instead $r gt.eq s$, then $t gt.eq 1 \/ 4$: for $t < 1 \/ 4$ one has $N = s$ and $r < s \/ 4$. On the adverse region where $L b_U - epsilon r t > 0$, it follows that
  $ b_U > frac(r t, 4) gt.eq r / 16 . $
  Moreover,
  $ r^(- a_0) lt.eq s^(- a_0) = exp (frac(3 log q, 2 + log q)) lt.eq e^3 . $
  Consequently, on that region,
  #[#set math.equation(numbering: n => "(6.10)")
   $ lambda b_U lt.eq sqrt(2) B_0 r^(1 - a_0) b_U lt.eq 16 sqrt(2) e^3 B_0 b_U^2 . $ <eq:pass-large-slope>]
  Combining these estimates and substituting $B_0$ from (6.4) gives the one-coordinate inequality
  #[#set math.equation(numbering: n => "(6.11)")
   $ "Scal"_(g^(+)) gt.eq "Scal"_g - C_0 frac(L^2, a_0 w^2) (1 / q + b_U^2) . $ <eq:coordinate-scalar-cost>]
  For example $C_0 = 128 sqrt(2) e^3$ is sufficient. The inequality extends by continuity to the boundary of ${ t > 0 }$. On the interior of ${ t = 0 }$ the graph is constant and the update adds a constant circle, so it holds there as well.
  Finally sum (6.11) over the $q$ coordinates. At a fixed point of $Z$, the inverse metrics of the $E_M$ blocks all act on the same $n$-dimensional space $E_M^(*)$. If $U_i$ is the vector used at the $i$th step, (4.5) gives the telescoping identity
  #[#set math.equation(numbering: n => "(6.12)")
   $ sum_(i = 1)^q U_i ⊗ U_i = g_(*)^(- 1) - \( g_h^(+) \)^(- 1) lt.eq g_(*)^(- 1) . $ <eq:pass-trace-telescope>]
  Taking its $g_(*)$-trace gives $sum_i b_(U_i)^2 lt.eq n$. The $q$ terms $1 \/ q$ sum to $1$, proving (6.3). In particular the growing number of old circle directions does not appear in this trace. Uniform control and smooth parameter dependence at the new stage follow from 18 applied successively a finite number of times. ◻
]

=== 6.2 Finite iteration and the parameter directions <finite-iteration-and-the-parameter-directions>

We shall use the following elementary assembly observation.

#thm([Lemma 6.2.])[
  (Magnifying the parameter metric).  #emph[Fix a finite-stage smooth family of metrics of the form (6.1), equivariant under the flat transition maps over the closed manifold $A$, with all mixed derivatives bounded and uniform equivalence to a reference product. For any fixed metric $g_A$ on $A$, set 
$ g_P = g_h + P^2 g_A + sum_(nu = 1)^b m_nu^2 d theta_nu^2 quad upright("on ") Z times bb(T)^b \, $

 using the flat splitting and no mixed parameter terms. As $P arrow.r oo$, $"Scal"_(g_P)$ converges uniformly to the scalar curvature of the fibre metrics. If $H : Z arrow.r bb(R)^q$ has bounded mixed derivatives, its differential in the parameter directions has norm tending uniformly to zero. Each $g_P$ is complete and uniformly controlled.]
] <lem:parameter-scaling>

#proof[
  In a parameter chart about $a_(*)$ write $a = a_(*) + P^(- 1) y$. The parameter block becomes $g_A \( a_(*) + P^(- 1) y \)$, and the other metric coefficients are the corresponding fibre coefficients evaluated at $a_(*) + P^(- 1) y$. All parameter derivatives through order two tend uniformly to zero. Their limits, at $y = 0$, are the two-jets of the fibre metric with $a = a_(*)$ frozen, times the constant Euclidean parameter block $g_A \( a_(*) \)$. Inverses remain uniformly bounded for this fixed stage. The scalar-curvature formula is a continuous expression in these metric two-jets and their inverses, so its limit is uniformly the fibre scalar curvature. The finitely many parameter charts and the assumed bounds make the convergence uniform over all of $Z$.
  The parameter differential of $H$ acquires the factor $P^(- 1)$, proving the second assertion. The reference product on $Z$ is the pullback of a metric on the closed manifold $M times A$ and is complete. The assembled metric, with its finite number of circle blocks, is uniformly equivalent to this complete reference product and has bounded coefficient derivatives. ◻
]

#thm([Theorem 6.3.])[
  (Logarithmic shortening).  #emph[Suppose $"Scal"_M gt.eq kappa > 0$. On the above bundle $Z$, let $G : Z arrow.r bb(R)^q$ be smooth and bounded with all mixed derivatives bounded, and suppose $L_0 > 0$ and 
$ sup_(1 lt.eq i lt.eq q) lr(|d_(tilde(M)) G_i|) lt.eq L_0 \, #h(2em) q gt.eq 2 . $

 There is a constant $C_n$ depending only on $n$ such that, if 
#[#set math.equation(numbering: n => "(6.13)")
 $ C_n \( 2 + log q \) L_0^2 lt.eq kappa \/ 4 \, $ <eq:shortening-smallness>]

 then for every finite integer $k gt.eq 1$ there are a complete stabilized metric 
$ frak(g)_k = h_k + sum_(nu = 1)^(k q) m_(k \, nu)^2 d theta_nu^2 quad upright("on ") Z times bb(T)^(k q) $

 and a smooth bounded map $G^(\( k \)) : Z arrow.r bb(R)^q$ satisfying 
#[#set math.equation(numbering: n => "(6.14)")
 $ "Scal"_(frak(g)_k) gt.eq kappa \/ 2 \, #h(2em) ∥G^(\( k \)) - G∥_oo < pi \/ 10 \, #h(2em) lr(|d G^(\( k \))|)_(upright("op")) lt.eq sqrt(q + 1) thin 4^(- k) L_0 . $ <eq:shortening-output>]

 The infinity norm in the middle inequality is the target coordinate maximum, followed by the supremum over $Z$. All metric coefficients, warps, and maps have uniform bounds of every order at each fixed finite stage; their equivalence and derivative constants may depend on that stage.]
] <thm:shortening>

#proof[
  Start with the lifted metric of $M$ and no circles, and perform passes indexed by $j = 0 \, dots.h \, k - 1$ with
  #[#set math.equation(numbering: n => "(6.15)")
   $ L_j = 4^(- j) L_0 \, #h(2em) w_j = 2^(- j) \/ 10 . $ <eq:pass-schedule>]
  19 applies inductively because every coordinate derivative is divided by at least four in each pass. Every stage is finite, so the uniform control required for its successor follows from the last assertion of that Lemma. All local constructions match under the flat parameter transitions by uniqueness of the graph solution.
  For any number of passes, the total scalar loss is at most
  $ C_0 \( n + 1 \) \( 2 + log q \) sum_(j gt.eq 0) L_j^2 / w_j^2 = 400 / 3 C_0 \( n + 1 \) \( 2 + log q \) L_0^2 . $
  Choose $C_n = \( 400 \/ 3 \) C_0 \( n + 1 \)$. Under (6.13), all the fibre scalar curvatures are at least $3 kappa \/ 4$. Each coordinate is modified exactly once per pass, so
  $ ∥G^(\( k \)) - G∥_oo < pi / 2 sum_(j = 0)^(k - 1) w_j < pi / 10 . $
  No coordinate count enters this estimate. The fibrewise Euclidean operator norm is at most $sqrt(q) thin L_k$, since each of the $q$ rows has norm at most $L_k = 4^(- k) L_0$.
  At this fixed stage apply 20, making the parameter scale so large that the scalar-curvature loss from assembly is at most $kappa \/ 4$ and the parameter part of $d G^(\( k \))$ has operator norm at most $L_k$. The domain’s fibre and parameter blocks are orthogonal. Cauchy–Schwarz therefore bounds the full differential by $sqrt(q L_k^2 + L_k^2)$, proving (6.14). The resulting base metric on $Z$ is $h_k$; all circle warps remain positive and independent of circle variables. The completeness and finite-stage bounds follow from the same assembly Lemma. ◻
]

=== 6.3 A compact degree region <a-compact-degree-region>

#thm([Corollary 6.4.])[
  (Stabilized contraction at a fixed scale).  #emph[Assume $"Scal"_M gt.eq kappa > 0$ and take the comparison data of 8 at scale $R$, so that 
$ L_0 = J \/ R \, #h(2em) log q lt.eq J R . $

 For all sufficiently large $R$, fix these data once and for all. Then for every finite $k gt.eq 1$ there is a stabilized metric $frak(g)_k$ on $Z times bb(T)^(k q)$ with scalar curvature at least $kappa \/ 2$, and a smooth map 
$ F_k : Z arrow.r S^q $

 equal to a single value outside a compact set, with nonzero degree, such that 
#[#set math.equation(numbering: n => "(6.16)")
 $ lr(|d F_k|)_(upright("op")) lt.eq C \( q \) 4^(- k) J \/ R . $ <eq:stabilized-contraction-bound>]

 The sphere has its standard unit metric. The constant $C \( q \)$ is independent of $k$. If desired, the circle lengths may be increased so that the projection to the standard $bb(T)^(k q)$ also has operator norm at most $4^(- k) J \/ R$; this does not change scalar curvature or the bound on $d F_k$.]
] <cor:stabilized-contraction>

#proof[
  The left-hand side of (6.13) is at most
  $ C_n \( 2 + J R \) J^2 \/ R^2 arrow.r 0 . $
  Choose a sufficiently large finite $R$ once. In particular $q$, $A$, and the original comparison map are now fixed while $k$ remains arbitrary. Apply 21 at this fixed scale.
  Choose a smooth map $Q_q : bb(R)^q arrow.r S^q$ which is constant outside the Euclidean unit ball and has degree one on the one-point compactification. It can be chosen with the north pole as a regular value having the sole preimage $0$. For example, in polar coordinates use
  $ y mapsto (sin rho \( lr(||) y \) frac(y, lr(||) y) \, cos rho \( lr(||) y \)) \, $
  where $rho \( r \)$ is a positive linear function near zero, increases to $pi$, and is smoothly constant at $pi$ in a collar of $r = 1$ and beyond; choose the orientation, or compose with a reflection, to give degree one. The expression is smooth at zero because $rho$ is linear there. Let $D_q < oo$ bound its differential.
  By the comparison theorem there is a precompact open $Omega subset Z$ with $deg \( G \, Omega \, 0 \) eq.not 0$ and $∥G∥_oo > 3$ on $partial Omega$. The homotopy
  $ G + u \( G^(\( k \)) - G \) \, #h(2em) 0 lt.eq u lt.eq 1 \, $
  stays outside the unit ball on $partial Omega$, by (6.14). Define
  $ F_k = Q_q compose G^(\( k \)) quad upright("on ") Omega \, #h(2em) F_k = Q_q \( oo \) quad upright("on ") Z \\ Omega . $
  The boundary is compact and its image is separated from the unit ball. Thus $Q_q compose G^(\( k \))$ is constant on a neighborhood of the boundary, and this definition is smooth even if $partial Omega$ is not smooth. The map is constant outside the compact set $overline(Omega)$.
  Homotopy invariance of local degree gives
  $ deg \( G^(\( k \)) \, Omega \, 0 \) = deg \( G \, Omega \, 0 \) eq.not 0 . $
  The degree of $F_k$ is this same integer: count preimages of a regular target sufficiently near the north pole, where $Q_q$ is an orientation-preserving local diffeomorphism, or equivalently compose the relative degree classes. Hence $F_k$ has nonzero degree. Its differential is bounded by $D_q sqrt(q + 1) thin 4^(- k) J \/ R$, establishing (6.16) with $C \( q \) = D_q sqrt(q + 1)$.
  For the last assertion, multiply each circle warp by a sufficiently large positive constant. Because all coefficients are independent of the circle variables and the circle blocks are mutually orthogonal, this is locally a constant change of each circle coordinate. It preserves scalar curvature. The base metric and the norm of $d F_k$ are unchanged. At the fixed stage all warps have positive uniform lower bounds, so their constant multipliers can make every inverse circle length at most $4^(- k) J \/ R$. The operator norm of the projection to the product flat torus is the maximum of these inverse lengths, with no factor depending on the number of circles. ◻
]

We have now constructed maps of nonzero degree from $Z$ to $S^q$. Their differentials tend to zero as the finite pass count grows, with $q$ fixed. The scalar lower bound holds on $Z times bb(T)^(k q)$. The remaining obstruction must therefore be independent of the number of stabilizing circles. We establish it in 7.

== 7 The stabilized obstruction from the torical theorem <sec:obstruction>

The shortening construction varies the number of circle factors while keeping the base dimension fixed. We prove the required obstruction with a threshold independent of that circle count. Its only external geometric input is the local torical theorem of Cecchini and Schick; the reduction below checks its compactness, degree and local metric hypotheses.

#prodef([Definition 7.1.])[
  A #emph[torus-stabilized metric] on a smooth manifold $Y$ is a metric
  #[#set math.equation(numbering: n => "(7.1)")
   $ cal(G) = g + sum_(nu = 1)^b m_nu^2 thin d theta_nu^2 #h(2em) upright("on ") Y times bb(T)^b \, $ <eq:stabilized-metric>]
  where $b gt.eq 0$ is finite, $g$ is a smooth metric on $Y$, and the functions $m_nu : Y arrow.r \( 0 \, oo \)$ are smooth. Each circle is $bb(R) \/ \( 2 pi bb(Z) \)$. We call $g$ the base metric. Scalar curvature always refers to the full metric $cal(G)$. Differentials of base maps have the norm determined by $g$.
] <def:torical-metric>

For a map $F : Y^d arrow.r S^d$ equal to a fixed value $y_oo$ outside a compact set, degree means evaluation against a smooth top-degree form supported away from $y_oo$ and of integral one. Equivalently, it is the signed preimage count at a regular value different from $y_oo$. This convention also applies when $Y$ is disconnected.

#thm([Theorem 7.2.])[
  (Stabilized torical obstruction).  #emph[For every integer $d gt.eq 2$ and every $chi > 0$ there is a number $delta \( d \, chi \) > 0$ for which the following data do not exist:]
  + #emph[a smooth oriented $d$-manifold $Y$ without boundary, possibly disconnected, with a torus-stabilized metric $cal(G)$ satisfying $"Scal"_(cal(G)) gt.eq chi$;]
  + #emph[a smooth map $F : Y arrow.r S^d$, equal to one value outside a compact set, such that $deg F eq.not 0$ and $∥d F∥_(upright("op")) lt.eq delta \( d \, chi \)$ everywhere.]
  #emph[The constant is independent of the finite circle count in (7.1). Neither the base metric nor the stabilized metric is assumed complete.]
] <thm:torical-obstruction>

Cecchini–Schick prove that if a closed oriented Riemannian $D$-manifold $X$ has a smooth map $f : X arrow.r S^1 times bb(T)^(D - 1)$ of nonzero degree, and a connected open arc $J subset S^1$ satisfies

$ "Scal"_X gt.eq chi > 0 \, #h(2em) \| d f \|_(upright("op")) lt.eq epsilon.alt quad upright("on ") f^(- 1) \( J times bb(T)^(D - 1) \) \, $

then

#[#set math.equation(numbering: n => "(7.2)")
 $ 2 pi epsilon.alt gt.eq sqrt(chi) thin "Length" \( J \) . $ <eq:cecchini-schick>]

This is #cite(label("CecchiniSchick2021")) Theorem 1.14(1). The statement has no upper dimension bound and no spin hypothesis. Its notion of contraction is a pointwise bound on the full differential. In high dimensions its proof uses the minimal-slicing input identified in that paper; we invoke the published theorem at this interface. We use its flat torus normalization in the target; any fixed change from our angular convention is absorbed in the tube-projection bound and the constant circle enlargements below.

#proof[
  Fix $d gt.eq 2$ and $chi > 0$. Suppose that the data in the theorem exist, and write $b$ for the finite number of circles. Set $D = d + b$. Thus $Y^d$ carries the stabilized metric
  $ g + sum_(nu = 1)^b m_nu^2 d theta_nu^2 $
  of scalar curvature at least $chi$, and the nonzero-degree map $F : Y arrow.r S^d$ has differential bounded by a number $delta > 0$ in the base metric $g$. We derive a positive lower bound for $delta$ which is independent of $b$.
  Choose a fixed two-sided embedded $bb(T)^(d - 1)$ in $S^d$ away from the exterior value of $F$, with a closed tubular neighborhood parametrized by $bb(T)^(d - 1) times \[ - 2 \, 2 \]$. Such embeddings can be built inductively in a Euclidean chart: add one ambient dimension and take the boundary of a small trivial two-dimensional normal disk bundle around the preceding torus. After a rotation, the target tube and all its projection bounds depend only on $d$.
  Choose regular interval levels $s_(-) in \( - 5 \/ 4 \, - 3 \/ 4 \)$ and $s_(+) in \( 3 \/ 4 \, 5 \/ 4 \)$ and pull back the strip between them. This gives a compact smooth band $W subset Y$, with a map to that strip of nonzero relative degree. Compactness follows because the closed target tube avoids the exterior value. Regularity of the two levels gives a smooth boundary; nonzero relative degree follows by counting preimages of a regular interior target of $F$.
  Write the target strip as $bb(T)^(d - 1) times \[ s_(-) \, s_(+) \]$. Double $W$ with the opposite orientation on the second copy. On both copies retain the $bb(T)^(d - 1)$ component of the target map, and send the interval component monotonically along complementary semicircles of $S^1$. To make this map smooth across the seams, first choose disjoint source boundary collars and precompose the #emph[entire base map], including its torus component, with a smooth collar reparametrization that is constant in the normal variable near the boundary. On the first copy, choose the circle angle $alpha \( t \)$ to be $pi \/ 2 + pi t \/ 2$ for $\| t \| lt.eq 1 \/ 2$, extend it monotonically to $0$ and $pi$ at the two walls, and make it flat near the endpoints. On the second copy use the complementary semicircle, with the same endpoint values in $S^1$. The two torus components then agree and are constant in the normal variable at each seam, while the circle components agree there as well. Hence they define a smooth map
  $ f : "dbl" \( W \) times bb(T)^b arrow.r S^1 times bb(T)^(d - 1) times bb(T)^b \, $
  with the identity on the final torus.
  All collar changes can be confined near the walls, away from $\| t \| lt.eq 1 \/ 2$. Choose the open target arc
  $ J = { e^(i alpha) : 3 pi \/ 8 < alpha < 5 pi \/ 8 } . $
  Its full preimage in the first copy is precisely $\| t \| < 1 \/ 4$, where the map is unchanged and its interval slope is the fixed number $pi \/ 2$. The second copy maps to the complementary semicircle and has no preimage over $J$. Counting preimages of a regular target over $J$ therefore recovers the nonzero relative degree of the original band map. The map $f$ has nonzero degree, on at least one connected component if the double is disconnected.
  Each $m_nu$ has a positive minimum on the compact band. Enlarge its circle length by a constant factor until the joint projection to the standard $bb(T)^b$ has operator norm at most $delta$ on $W$. This changes no local scalar curvature: a constant change of a circle coordinate is a local isometry between the two warped metrics. The operator norm of the joint projection is the maximum inverse circle length, rather than a sum over $b$.
  Give the closed double any smooth metric agreeing with the enlarged stabilized metric throughout the chosen middle substrip and a neighborhood of its closure. On the preimage of $J times bb(T)^(d + b - 1)$ it then has scalar curvature at least $chi$. The base part of $f$ has differential at most $C_d delta$, because only the fixed tube projection and a fixed middle-arc parametrization are used there. Its torus part has differential at most $delta$. The orthogonal block structure therefore gives
  $ \| d f \|_(upright("op")) lt.eq max \( C_d \, 1 \) delta quad upright("on ") f^(- 1) \( J times bb(T)^(d + b - 1) \) \, $
  independently of $b$. No metric or curvature control elsewhere on the double is required by the cited theorem.
  Applying (7.2) gives
  $ 2 pi max \( C_d \, 1 \) delta gt.eq sqrt(chi) thin "Length" \( J \) . $
  The fixed tube and middle-arc choices depend only on $d$. In particular we may take
  $ delta \( d \, chi \) = frac(sqrt(chi) thin "Length" \( J \), 4 pi max \( C_d \, 1 \)) . $
  A map with differential at most this number contradicts the preceding lower bound. The threshold depends only on $d$ and $chi$, independently of the finite circle count $b$. ◻
]

== 8 Proof of the main results <sec:main-proof>

We combine the comparison data, finite shortening, and the stabilized obstruction at one fixed scale, then derive the four corollaries.

#proof[
  Suppose, to the contrary, that $M^n$, $n gt.eq 2$, has a positive-scalar-curvature metric and that $\( c_M \)_(*) \[ M \] eq.not 0$ in $H_n \( B Gamma \; bb(Q) \)$. Fix the metric and choose $kappa > 0$ with $"Scal"_M gt.eq kappa$.
  8 supplies comparison data at arbitrarily large finite scales $R$, with a constant $J$ independent of $R$. Choose one sufficiently large finite $R$ for 22, and keep all resulting comparison data $A \, Z \, q \, G \, Omega$ fixed. For every finite integer $k gt.eq 1$, that corollary gives a smooth metric $g_k$ on $Z$ and positive smooth warps $m_(k \, nu)$ such that
  $ g_k + sum_(nu = 1)^(k q) m_(k \, nu)^2 d theta_nu^2 quad upright("has scalar curvature at least ") kappa \/ 2 . $
  It also gives a smooth map $F_k : Z arrow.r S^q$, constant outside a compact set and of nonzero degree, satisfying
  $ \| d F_k \|_(g_k \, upright("op")) lt.eq C \( q \) 4^(- k) J / R . $
  The metric coefficients and the parameter enlargement may depend on the finite pass count $k$.
  The sphere map uses the full base $Z$, with its $n$ fibre directions and $dim A$ parameter directions. The relevant instance of 24 has $d = q = n + dim A$, $b = k q$, and scalar lower bound $chi = kappa \/ 2$. Its threshold $delta \( q \, kappa \/ 2 \)$ is independent of $b$. Since $q$ is fixed, choose a finite $k$ so large that
  $ C \( q \) 4^(- k) J \/ R lt.eq delta \( q \, kappa \/ 2 \) . $
  The resulting stabilized metric and nonzero-degree map contradict the obstruction. This proves rational inessentiality. ◻
]

#proof[
  Let $M$ be one connected component of a closed smooth aspherical manifold. Scalar curvature is identically zero in dimensions zero and one, so suppose $n gt.eq 2$. If $M$ is oriented, its classifying map is a homotopy equivalence because $M$ is aspherical. It therefore sends the nonzero rational fundamental class to a nonzero class, contradicting 1 if $M$ admits positive scalar curvature.
  If $M$ is not orientable, its orientation double cover is a closed connected oriented smooth manifold with the same contractible universal cover. A positive-scalar-curvature metric on $M$ lifts to such a metric on this aspherical cover, contradicting the oriented case. ◻
]

#proof[
  Work on one connected component of $M$. In dimensions zero and one the full Riemann curvature tensor vanishes, so suppose that $dim M gt.eq 2$. Write $\( hat(M) \, hat(g) \) = \( M \, g \)$ if $M$ is orientable. Otherwise, let $hat(M) arrow.r M$ be its connected orientation double cover and let $hat(g)$ be the pullback of $g$. In either case $hat(M)$ is closed, oriented and aspherical, and $hat(g)$ has nonnegative scalar curvature.
  By 7, either $hat(M)$ admits a metric of strictly positive scalar curvature or the lifted given metric $hat(g)$ is Ricci-flat. 2 excludes the first alternative, so $"Ric"_(hat(g)) = 0$. The compact-manifold consequence of the Cheeger–Gromoll splitting theorem #cite(label("CheegerGromoll1971")) gives an isometric splitting of the universal Riemannian cover
  $ \( tilde(M) \, tilde(g) \) tilde.equiv \( bb(R)^k \, g_(upright("Eucl")) \) times \( N \, h \) \, $
  where $N$ is a compact connected manifold without boundary and $tilde(g)$ is the lift of the original metric $g$. Since $M$ is aspherical, $tilde(M)$ is contractible. The factor $N$ is a deformation retract of $bb(R)^k times N$, hence is contractible as well. If $m = dim N > 0$, then $H_m \( N \; bb(Z) \/ 2 bb(Z) \) eq.not 0$ by the mod-two fundamental class, a contradiction. Thus $N$ is a point, $tilde(g)$ is Euclidean, and $g$ is flat because the covering maps are local isometries. ◻
]

#proof[
  Choose compatible basepoints and put $phi.alt = f_(*) : pi_1 \( M \) arrow.r pi_1 \( N \)$. The $K \( pi \, 1 \)$ mapping property gives
  $ B phi.alt compose c_M tilde.eq c_N compose f \; $
  see #cite(label("Hatcher2002")) Theorem 1B.8 and Proposition 1B.9. Since $N$ is aspherical, $c_N$ is a homotopy equivalence. Naturality and the degree identity therefore give
  $ \( B phi.alt \)_(*) \( c_M \)_(*) \[ M \] = \( c_N \)_(*) f_(*) \[ M \] = d \( c_N \)_(*) \[ N \] eq.not 0 #h(2em) upright("in ") H_n \( B pi_1 \( N \) \; bb(Q) \) . $
  Thus $M$ is rationally essential, and 1 rules out the stated metric. No injectivity or surjectivity condition on $phi.alt$ is used.
  For the connected sum, the pinch $N \# P arrow.r N or P$ followed by projection to $N$ has degree $+ 1$: a point on the unchanged $N$-side has one orientation-preserving local preimage. This construction is valid for every $n gt.eq 2$, including surfaces, so the first assertion applies. ◻
]

#proof[
  Simplicial volume is the sum of the simplicial volumes of the finitely many connected components, so it suffices to treat one component. The circle case was proved in 2. In dimensions at least two, 7 either supplies a positive-scalar-curvature metric or gives zero simplicial volume directly in the Ricci-flat case. In the former alternative, 1 and 6 give the same conclusion. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
