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

#align(center)[#text(size: 16pt, weight: "bold")[Canonical ampleness of compact hyperbolic Kähler manifolds]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A complex manifold is #emph[Brody hyperbolic] if every holomorphic map $bb(C) arrow.r X$ is constant. On a compact complex manifold, Brody’s theorem identifies this condition with Kobayashi hyperbolicity, the nondegeneracy of the intrinsic pseudodistance defined by holomorphic disc chains #cite(label("Brody1978")) #cite(label("Kobayashi1970")). We use “hyperbolic” in this sense throughout.

For a complex manifold of dimension $n$, the canonical bundle $K_X = and.big^n \( T^(1 \, 0) X \)^(*)$ is the line bundle of holomorphic $n$-forms. A line bundle is #emph[ample] if some positive tensor power has global sections defining a holomorphic embedding into projective space. Kobayashi’s canonical-ampleness conjecture predicts that the absence of nonconstant entire curves forces $K_X$ to be ample on a compact Kähler manifold. It therefore connects a restriction on one-dimensional holomorphic maps with both positivity of top-degree forms and projective algebraicity. We prove this implication in every positive dimension.

#thm([Theorem 1.1.])[
  #emph[Let $X$ be a compact connected Kähler manifold of positive complex dimension. If every holomorphic map $bb(C) arrow.r X$ is constant, then $K_X$ is ample. In particular, a positive tensor power of $K_X$ defines a holomorphic embedding of $X$ into a complex projective space.]
] <thm:main>

=== 1.1 Context and the main difficulty <context-and-the-main-difficulty>

Kobayashi’s theory supplies the intrinsic metric framework #cite(label("Kobayashi1970")); the canonical-ampleness question and its relationship with curvature are discussed in #cite(label("Diverio2020")). Theorem 1 gives a positive resolution in the smooth compact Kähler category. A major preceding advance is the theorem of Wu and Yau: negative holomorphic sectional curvature of a Kähler metric forces canonical ampleness on a smooth projective manifold #cite(label("WuYau2016")). Tosatti and Yang extended that implication to compact Kähler manifolds without assuming projectivity #cite(label("TosattiYang2017")). Diverio–Trapani extended the conclusion to quasi-negative holomorphic sectional curvature: the curvature is nonpositive everywhere and strictly negative in every nonzero tangent direction at one point #cite(label("DiverioTrapani2019")). Wu–Yau subsequently gave another proof covering both the negative and quasi-negative cases #cite(label("WuYauRemark2016")). Broder–Stanfield allow the negatively curved metric $omega$ to be Hermitian and pluriclosed, meaning $i partial macron(partial) omega = 0$, while retaining the ambient Kähler hypothesis #cite(label("BroderStanfield2026")) Theorem 1.1. These metric hypotheses give curvature inequalities unavailable from the absence of entire curves alone. The present proof begins instead with the derivative bounds supplied by compact hyperbolicity.

A related line of work uses Gromov’s Kähler hyperbolicity #cite(label("Gromov1991")): a Kähler form pulls back to the exterior derivative of a bounded one-form on the universal covering. Building on Gromov’s general-type result, Chen and Yang proved canonical ampleness under this hypothesis #cite(label("ChenYang2018")) Definitions 2.2 and 2.7, Theorem 2.11. This condition is distinct from Brody hyperbolicity #cite(label("ChenYang2018")) Corollary 4.4.

Recent work also establishes a weaker positivity conclusion under the absence of rational curves. A line bundle is #emph[nef] if, for every $epsilon > 0$, it admits a smooth Hermitian metric whose curvature is bounded below by $- epsilon omega$, where $omega$ is any fixed background Kähler form. Ou’s characterization of uniruled compact Kähler manifolds #cite(label("Ou2025")) Theorem 1.1 shows that, in the absence of rational curves, $K_X$ is pseudoeffective: its first Chern class contains a closed positive current. Ou’s theorem also supplies the lower-dimensional hypothesis in Cao–Höring’s rational-curve theorem #cite(label("CaoHoring2020")) Theorem 1.3. The latter then shows that failure of nefness would produce a rational curve. Thus nefness is already known under this weaker hypothesis. The further issue for ampleness is positive canonical volume. We retain a direct disc proof of nefness because it produces bounded canonical potentials and uses the same Hessian identity as our volume estimate.

Extremal holomorphic discs have long connected intrinsic complex geometry with analytic estimates, notably in Lempert’s theory on convex domains #cite(label("Lempert1981")). The extremal problem used here includes an area penalty on discs in a compact target. Its difficulty is at the boundary: compact convergence does not by itself justify variations of an integral over the whole unit disc. We first obtain boundary Sobolev regularity from maximality. We then construct a holomorphic frame normalized on the boundary and integrate the needed infinitesimal sections into actual holomorphic families that keep the center fixed. These steps make one Hessian calculation available for two different positivity estimates.

=== 1.2 The analytic argument <the-analytic-argument>

Put $n = dim_(bb(C)) X$, let $bb(D) = { \| z \| < 1 }$, and fix a Kähler metric $k$. A disc $f : bb(D) arrow.r X$ has finite area if the integral of $k \( f' \( z \) \, f' \( z \) \)$ over $bb(D)$ is finite. Compact hyperbolicity bounds the squared $k$-norm of the central derivative of every holomorphic disc by a constant $D$. For a closed real $\( 1 \, 1 \)$-form $q$, evaluated through its associated Hermitian tensor, use the area and Poisson integrals

$ A_q \( f \) = 1 / pi integral_(bb(D)) q \( f' \, f' \) thin upright(d) S \, #h(2em) P_q \( f \) = 2 / pi integral_(bb(D)) log frac(1, \| z \|) thin q \( f' \, f' \) thin upright(d) S \, $

where $upright(d) S$ is Euclidean area. We maximize

$ k \( f' \( 0 \) \, f' \( 0 \) \) + P_q \( f \) - delta A_h \( f \) $

over finite-area discs with a fixed center, where $h$ is a Kähler metric and $delta > 0$. The negative area term gives compactness. Comparing a maximizing disc with its dilations then gives a linear boundary-area tail bound. This improves its regularity to continuity on the closed disc and $W^(1 \, p)$ for some $p > 2$.

The main analytic work is to make boundary-normalized variations at such an extremum legitimate. A weighted Hardy-space construction, in the tradition of matrix spectral factorization #cite(label("WienerMasani1957")) #cite(label("HelsonLowdenslager1958")), gives a holomorphic frame $B = \( b_1 \, dots.h \, b_n \)$ of the pulled-back tangent bundle with $B^(*) h B = I$ on the boundary. We retain enough Sobolev regularity to realize the sections $z b_j \( z \)$ as derivatives of actual center-fixed holomorphic families $F_t$ with $F_0 = f$. Let $cal(L)$ denote the sum of the complex second derivatives in these $n$ parameter directions, evaluated at $t = 0$. The trace of the complex Hessian of the area functional is then

$ cal(L) A_h \( F_t \) = n - A_(R_h) \( f \) \, #h(2em) R_h = - i partial macron(partial) log det h \, #h(2em) d d^c = i partial macron(partial) . $

Its proof uses an explicit weak boundary limit; it does not assume that the maximizing disc extends holomorphically across the circle. The frame and variation constructions apply to boundary-regular holomorphic discs independently of the global hyperbolicity hypothesis, which is used to produce those discs.

Two choices of parameters exploit this identity:

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Parameters
], table.cell(rowspan: 1, colspan: 1)[Result
]),
  table.cell(rowspan: 1, colspan: 1)[$h = k$, $q = R_k$, $delta arrow.b 0$
], table.cell(rowspan: 1, colspan: 1)[Uniform upper bound for $P_(R_k)$
],
  table.cell(rowspan: 1, colspan: 1)[$q = - h$, $delta = 1$, $R_h gt.eq - h$
], table.cell(rowspan: 1, colspan: 1)[Uniform lower bound for $h^n \/ k^n$
],
)
]

The first bound holds on all finite-area discs. The Poletsky–Rosay disc envelope #cite(label("Poletsky1991")) #cite(label("Rosay2003")) #cite(label("DrinovecForstneric2012")) on $det T^(1 \, 0) X = K_X^(*)$ with its zero section removed then gives bounded local plurisubharmonic weights for $K_X$. We include a direct smoothing argument proving that $K_X$ is nef. Second, $q = - h$ gives the pointwise estimate

#[#set math.equation(numbering: n => "(1.1)")
 $ h^n gt.eq e^(- D) (frac(n, 2 n + D))^n k^n quad upright("whenever ") R_h gt.eq - h . $ <eq:intro-volume>]

This estimate is uniform over the indicated metrics, even though the auxiliary maximizing discs and their regularity constants need not be.

=== 1.3 From the estimates to ampleness <from-the-estimates-to-ampleness>

Following the Monge–Ampère and volume strategy used by Wu and Yau #cite(label("WuYau2016")), the negative-sign Aubin–Yau equation produces Kähler metrics $h_t$, for $t > 0$, in the classes $2 pi c_1 \( K_X \) + t \[ k \]$ with $R_(h_t) = - h_t + t k$. Equation (1.1) gives a positive lower bound for their volumes. Passing to the limit in cohomology as $t arrow.b 0$ proves $integral_X c_1 \( K_X \)^n > 0$.

The remaining steps use established results with their usual hypotheses. Holomorphic Morse inequalities make the nef canonical bundle #emph[big], meaning that its sections have maximal, $n$-dimensional asymptotic growth. The resulting sections make $X$ Moishezon, that is, its meromorphic function field has transcendence degree $n$. A compact Kähler Moishezon manifold is projective. Finally, the absence of rational curves and the log cone theorem upgrade bigness to ampleness. The final implication is recorded in #cite(label("DiverioTrapani2019")) Lemma 2.1; see also #cite(label("Diverio2020")) Lemma 5.1. All the new estimates are proved below; the standard existence, envelope, and positivity theorems are stated at the points where they are used.

=== 1.4 Organization <organization>

Section 2 fixes the curvature, Green-function, and disc-functional conventions. Section 3 constructs maximizing discs and proves their boundary regularity. Section 4 builds the boundary-unitary frames and centered holomorphic variations, and Section 5 establishes the determinant and Hessian identities. Their first use, in Section 6, produces bounded canonical potentials and proves nefness; their second use, in Section 7, gives the uniform volume estimate. Section 8 turns that estimate into positive top self-intersection, and Section 9 completes the passage to bigness, projectivity, and ampleness. Section 10 applies the result to pluricanonical sections and semialgebraic universal covers. Appendix 11 gives the bounded-potential smoothing argument used in Section 6.

== 2 Conventions and disc functionals <sec:preliminaries>

Throughout, $X$ is a compact connected Kähler manifold of complex dimension $n gt.eq 1$, with no nonconstant entire curves, and $k$ is a fixed Kähler metric. This section fixes the signs and normalizations used in the disc estimates. We write $d d^c = i partial macron(partial)$ and identify a Hermitian tensor with its real $\( 1 \, 1 \)$-form so that the tensor associated with a real-valued potential $phi.alt$ has quadratic form

$ sum_(i \, j) partial_i partial_(macron(j)) phi.alt thin v^i overline(v^j) \, $

and associated form $i partial macron(partial) phi.alt$. In matrix formulas, vectors are columns and their squared norm is written $v^(*) h v$. In particular, if the columns of $B$ are tangent vectors, their Gram matrix is $B^(*) h B$.

For a Kähler form $h$, set

#[#set math.equation(numbering: n => "(2.1)")
 $ R_h = - i partial macron(partial) log det h . $ <eq:ricci-convention>]

This globally defined form represents $2 pi c_1 \( T^(1 \, 0) X \)$; hence $\[ - R_h \] = 2 pi c_1 \( K_X \)$. Inequalities of real $\( 1 \, 1 \)$-forms are understood as inequalities of their Hermitian tensors. The form $h^n$ is used without a factor $n !$; determinant ratios are consequently ratios of these volume forms.

Write $bb(D) = { z in bb(C) : \| z \| < 1 }$ and let $upright(d) S$ denote Euclidean area. For a holomorphic map $f : bb(D) arrow.r X$, put

$ f' \( z \) = upright(d) f_z \( partial_z \) \, #h(2em) d \( f \) = k \( f' \( 0 \) \, f' \( 0 \) \) . $

The disc has #emph[finite area] if $integral_(bb(D)) k \( f' \, f' \) thin upright(d) S < oo$. Since $X$ is compact, this condition is independent of the smooth Hermitian metric used to define it. For a smooth closed real $\( 1 \, 1 \)$-form $q$ and a finite-area disc, define

#[#set math.equation(numbering: n => "(2.2)")
 $ A_q \( f \) = 1 / pi integral_(bb(D)) q \( f' \, f' \) thin upright(d) S \, #h(2em) P_q \( f \) = 2 / pi integral_(bb(D)) log frac(1, \| z \|) thin q \( f' \, f' \) thin upright(d) S . $ <eq:disc-functionals>]

Both are finite: the weight is bounded away from the center, and the integrand apart from the weight is smooth near the center. We write $A_(q \, r) \( f \)$ for the same area integral restricted to $\| z \| < r$.

For a scalar function on a circle, use the normalized mean

$ chevron.l u chevron.r_r = frac(1, 2 pi) integral_0^(2 pi) u \( r e^(i theta) \) thin upright(d) theta . $

The following normalization will be useful repeatedly.

#thm([Lemma 2.1.])[
  (Green identities).  #emph[If $u$ is smooth on $bb(D)$, then, for $0 < r < 1$, 
#[#set math.equation(numbering: n => "(2.3)")
 $ chevron.l u chevron.r_r - u \( 0 \) & = 2 / pi integral_(\| z \| < r) log frac(r, \| z \|) thin partial_z partial_(macron(z)) u thin upright(d) S \,\
1 / pi integral_(\| z \| < r) partial_z partial_(macron(z)) u thin upright(d) S & = r / 2 chevron.l partial_r u chevron.r_r . $ <eq:green-poisson>]

 If in addition $u$ is continuous on $overline(bb(D))$ and $partial_z partial_(macron(z)) u in L^a \( bb(D) \)$ for some $a > 1$, then Equation (2.3) passes to $r = 1$.]
] <pre:green>

#proof[
  The identities are the ordinary planar Green identities with $Delta = 4 partial_z partial_(macron(z))$. For the limiting assertion, $log \( 1 \/ \| z \| \)$ belongs to every finite $L^b \( bb(D) \)$, so Hölder’s inequality and dominated convergence apply to the right-hand side. Continuity gives convergence of the circle means. ◻
]

Sobolev regularity of a continuous map on $overline(bb(D))$ is understood in finitely many target coordinate charts. The same convention applies to sections of a pulled-back bundle. When $p > 2$, the embedding $W^(1 \, p) \( bb(D) \) arrow.r.hook C^0 \( overline(bb(D)) \)$, its local versions, and the multiplication estimate make $W^(1 \, p)$ an algebra. Smooth functions of finitely many Sobolev coefficients are again Sobolev when their values stay in a compact subset of their domain. We use the corresponding smooth composition maps between these Banach spaces. For fiberwise holomorphic functions with uniform radii and Sobolev coefficient bounds, composition is holomorphic between the complex Banach spaces in question; the precise application is given in the variation construction.

The following table collects the notation used throughout the disc argument. The area and Poisson functionals use the fixed unit disc, with $A_(q \, r)$ denoting the explicitly indicated truncation.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Notation
], table.cell(rowspan: 1, colspan: 1)[Meaning
]),
  table.cell(rowspan: 1, colspan: 1)[$k$
], table.cell(rowspan: 1, colspan: 1)[Fixed background Kähler metric on $X$
],
  table.cell(rowspan: 1, colspan: 1)[$h$
], table.cell(rowspan: 1, colspan: 1)[Auxiliary Kähler metric
],
  table.cell(rowspan: 1, colspan: 1)[$R_h$
], table.cell(rowspan: 1, colspan: 1)[$- d d^c log det h$, representing $- 2 pi c_1 \( K_X \)$
],
  table.cell(rowspan: 1, colspan: 1)[$d \( f \)$
], table.cell(rowspan: 1, colspan: 1)[Squared central derivative norm $k \( f' \( 0 \) \, f' \( 0 \) \)$
],
  table.cell(rowspan: 1, colspan: 1)[$A_q \( f \)$
], table.cell(rowspan: 1, colspan: 1)[$pi^(- 1) integral_(bb(D)) q \( f' \, f' \) thin upright(d) S$
],
  table.cell(rowspan: 1, colspan: 1)[$A_(q \, r) \( f \)$
], table.cell(rowspan: 1, colspan: 1)[The same area integral over $\| z \| < r$
],
  table.cell(rowspan: 1, colspan: 1)[$P_q \( f \)$
], table.cell(rowspan: 1, colspan: 1)[$2 pi^(- 1) integral_(bb(D)) log \( 1 \/ \| z \| \) q \( f' \, f' \) thin upright(d) S$
],
  table.cell(rowspan: 1, colspan: 1)[$chevron.l u chevron.r_r$
], table.cell(rowspan: 1, colspan: 1)[Normalized mean of $u$ on $\| z \| = r$
],
)
]

== 3 Extremal discs and boundary regularity <sec:extremal-discs>

Our goal is to maximize the disc functional and obtain enough boundary regularity to vary the whole disc. Hyperbolicity first gives compactness on interior subdiscs; an area penalty will control the boundary tail. Throughout this section, $k$ is the fixed Kähler metric on $X$. We write $\| f' \( z \) \|_k^2 = k \( f' \( z \) \, f' \( z \) \)$ and use the path distance of the associated Riemannian metric when discussing uniform convergence. The fixed numerical factor relating real and complex tangent norms will be absorbed into constants.

#thm([Lemma 3.1.])[
  (Derivative bound and normality).  #emph[There is a constant $D > 0$, depending only on $\( X \, k \)$, such that every holomorphic map $f : bb(D) arrow.r X$ satisfies 
$ d \( f \) = \| f' \( 0 \) \|_k^2 lt.eq D . $

 Consequently, 
#[#set math.equation(numbering: n => "(3.1)")
 $ \| f' \( z \) \|_k lt.eq frac(sqrt(D), 1 - \| z \|) \, #h(2em) z in bb(D) . $ <eq:brody-derivative>]

 Every sequence of such maps has a subsequence converging uniformly on compact subsets of $bb(D)$ to a holomorphic map into $X$. In local target coordinates, all derivatives converge uniformly on smaller compact subsets as well.]
] <ex:brody>

#proof[
  We give Brody’s rescaling argument in the normalization needed here #cite(label("Brody1978")). Suppose first that there are maps $f_j : bb(D) arrow.r X$ with $\| f'_j \( 0 \) \|_k arrow.r oo$. Choose $z_j$ at which the continuous function
  $ z mapsto \( 1 \/ 2 - \| z \| \) \| f'_j \( z \) \|_k $
  attains its maximum on ${ \| z \| lt.eq 1 \/ 2 }$. For all sufficiently large $j$ this maximum is positive, so $\| z_j \| < 1 \/ 2$. Put
  $ lambda_j = \| f'_j \( z_j \) \|_k \, #h(2em) R_j = \( 1 \/ 2 - \| z_j \| \) lambda_j \, #h(2em) g_j \( w \) = f_j \( z_j + w \/ lambda_j \) . $
  The map $g_j$ is defined on ${ \| w \| < R_j }$, and
  $ R_j gt.eq 1 / 2 \| f'_j \( 0 \) \|_k arrow.r oo \, #h(2em) \| g'_j \( 0 \) \|_k = 1 . $
  If $\| w \| < R_j \/ 2$, then
  $ 1 \/ 2 - \| z_j + w \/ lambda_j \| gt.eq 1 / 2 \( 1 \/ 2 - \| z_j \| \) . $
  The maximizing property of $z_j$ therefore gives $\| g'_j \( w \) \|_k lt.eq 2$ on this smaller disc.
  For every fixed radius these maps are consequently equicontinuous and take values in the compact metric space $X$. The Arzelà–Ascoli theorem and a diagonal subsequence give a locally uniform limit $g : bb(C) arrow.r X$. To verify holomorphy, choose a point of the source and a target coordinate chart containing its image under $g$. On a sufficiently small source neighborhood, the limit and all sufficiently late maps take values in that chart. Their coordinate representations converge uniformly on smaller neighborhoods. The usual theorem on uniform limits of holomorphic functions, followed by the Cauchy integral formula for derivatives, shows that $g$ is holomorphic and $\| g' \( 0 \) \|_k = 1$. This contradicts the hypothesis on entire maps. The central derivative bound follows.
  For $z in bb(D)$, apply this bound to $w mapsto f \( z + \( 1 - \| z \| \) w \)$. Its central derivative is $\( 1 - \| z \| \) f' \( z \)$, proving Equation (3.1). The estimate gives equicontinuity on every compact source disc. A second application of Arzelà–Ascoli and the same coordinate argument proves normality and convergence of derivatives. Increasing $D$ if necessary makes it strictly positive. ◻
]

We next fix a point $x in X$, a smooth Kähler form $h$, a smooth closed real $\( 1 \, 1 \)$-form $q$, and a number $delta > 0$. All constants in the next two results may depend on these choices. Finite area can be measured using either $h$ or $k$, since the two metrics are uniformly comparable on $X$. We consider

#[#set math.equation(numbering: n => "(3.2)")
 $ J_(h \, q \, delta) \( f \) = d \( f \) + P_q \( f \) - delta A_h \( f \) $ <eq:disc-functional>]

on the finite-area holomorphic discs with $f \( 0 \) = x$.

#thm([Proposition 3.2.])[
  (Existence of a maximizing disc).  #emph[The functional in Equation (3.2) has finite supremum, attained by a finite-area holomorphic disc centered at $x$.]
] <ex:maximizer>

#proof[
  Choose $C_q gt.eq 0$ such that
  $ \| q \( v \, v \) \| lt.eq C_q h \( v \, v \) $
  for every tangent vector $v$. Select $r_0 in \[ 1 \/ 2 \, 1 \)$ so close to $1$ that $2 C_q log \( 1 \/ r_0 \) lt.eq delta \/ 2$. For a disc $f$ write
  $ a_f \( z \) = h \( f' \( z \) \, f' \( z \) \) \, #h(2em) b_f \( z \) = q \( f' \( z \) \, f' \( z \) \) . $
  On the outer annulus $r_0 < \| z \| < 1$, the function
  $ T_f \( z \) = delta a_f \( z \) - 2 log \( 1 \/ \| z \| \) b_f \( z \) $
  satisfies
  #[#set math.equation(numbering: n => "(3.3)")
   $ T_f \( z \) gt.eq delta / 2 a_f \( z \) gt.eq 0 . $ <eq:negative-tail-density>]
  On the inner disc, Lemma 3 and comparison of $h$ with $k$ give a uniform bound for $a_f$ and $\| b_f \|$. Since $log \( 1 \/ \| z \| \)$ is integrable there, there is a constant $K$ independent of $f$ such that
  $ lr(|1 / pi integral_(\| z \| < r_0) #scale(x: 120%, y: 120%)[\(] 2 log \( 1 \/ \| z \| \) b_f \( z \) - delta a_f \( z \) #scale(x: 120%, y: 120%)[\)] thin d S|) lt.eq K . $
  Consequently,
  #[#set math.equation(numbering: n => "(3.4)")
   $ J_(h \, q \, delta) \( f \) lt.eq D + K - frac(delta, 2 pi) integral_(r_0 < \| z \| < 1) a_f thin d S . $ <eq:maximizing-area-bound>]
  In particular, the supremum is finite. It is nonnegative because the constant disc has value zero.
  Choose a maximizing sequence $\( f_j \)$ with $J_(h \, q \, delta) \( f_j \) gt.eq - 1$. Equation (3.4) bounds its outer-annulus areas uniformly, and the compact-interior derivative estimate bounds its inner areas. Thus
  $ sup_j A_h \( f_j \) < oo . $
  By Lemma 3, after passing to a subsequence the maps converge locally uniformly to a holomorphic disc $f$ centered at $x$. Derivative convergence on compact subsets gives pointwise convergence of $a_(f_j)$ and $b_(f_j)$. Fatou’s lemma gives $A_h \( f \) lt.eq liminf_j A_h \( f_j \) < oo$.
  We verify the required upper semicontinuity of $J$. Its central term converges by derivative convergence. Its inner-disc integral converges by dominated convergence, using the uniform bound above together with the integrable logarithmic weight. On the outer annulus, the nonnegative functions $T_(f_j)$ converge pointwise to $T_f$, so Fatou’s lemma yields
  $ - 1 / pi integral_(r_0 < \| z \| < 1) T_f thin d S gt.eq limsup_j (- 1 / pi integral_(r_0 < \| z \| < 1) T_(f_j) thin d S) . $
  All these integrals are finite. Indeed, finite area controls the unweighted integrals and the logarithmic weight is bounded on the outer annulus. Combining the three terms proves
  $ J_(h \, q \, delta) \( f \) gt.eq limsup_j J_(h \, q \, delta) \( f_j \) \, $
  which proves attainment. ◻
]

Recall that $A_(q \, s) \( f \)$ is the area integral restricted to $\| z \| < s$. The form $q$ need not be positive, so this quantity can have either sign. Nevertheless, $\| q \| lt.eq C_q h$ implies that $A_(q \, s) \( f \)$ is bounded in $s$ and tends to $A_q \( f \)$ as $s$ tends to $1$. Maximality now improves the finite area of the disc to a quantitative tail estimate. This is the additional control needed at the boundary.

#thm([Lemma 3.3.])[
  (Dilation and area tails).  #emph[If $f$ is a maximizer in Proposition 4, then, for $0 < r < 1$, 
#[#set math.equation(numbering: n => "(3.5)")
 $ 0 lt.eq delta #scale(x: 120%, y: 120%)[\(] A_h \( f \) - A_(h \, r) \( f \) #scale(x: 120%, y: 120%)[\)] & lt.eq \( 1 - r^2 \) d \( f \) + 2 integral_r^1 A_(q \, s) \( f \) thin frac(d s, s) . $ <eq:tail>]

 In particular, 
#[#set math.equation(numbering: n => "(3.6)")
 $ A_q \( f \) gt.eq - d \( f \) \, #h(2em) A_k \( f \) - A_(k \, r) \( f \) lt.eq C_f \( 1 - r \) quad \( 1 \/ 2 lt.eq r < 1 \) $ <eq:extremal-area-tail>]

 for some finite constant $C_f$.]
] <ex:dilation>

#proof[
  Let $f_r \( z \) = f \( r z \)$. A change of variables gives
  $ d \( f_r \) = r^2 d \( f \) \, #h(2em) A_h \( f_r \) = A_(h \, r) \( f \) \, #h(2em) A_(q \, s) \( f_r \) = A_(q \, r s) \( f \) . $
  The identity $log \( 1 \/ \| z \| \) = integral_(\| z \|)^1 d s \/ s$ and Fubini’s theorem give
  $ P_q \( f \) = 2 integral_0^1 A_(q \, s) \( f \) thin frac(d s, s) . $
  Fubini is valid also for this signed integrand: near the origin the coordinate derivatives of $f$ are bounded, while away from the origin the logarithmic weight is bounded and $\| q \( f' \, f' \) \|$ is controlled by the finite $h$-area. Applying the same identity to $f_r$ gives
  #[#set math.equation(numbering: n => "(3.7)")
   $ P_q \( f \) - P_q \( f_r \) = 2 integral_r^1 A_(q \, s) \( f \) thin frac(d s, s) . $ <eq:dilation-poisson>]
  Since $f_r$ has the same center and finite area, maximality gives $J_(h \, q \, delta) \( f \) gt.eq J_(h \, q \, delta) \( f_r \)$. Substituting the three identities proves Equation (3.5); its leftmost inequality uses the positivity of $h$.
  Divide the rightmost expression in Equation (3.5) by $1 - r$. As $r arrow.t 1$, it tends to $2 d \( f \) + 2 A_q \( f \)$. It is nonnegative for every $r$, and hence $A_q \( f \) gt.eq - d \( f \)$. For $r gt.eq 1 \/ 2$, the original right-hand side of Equation (3.5) is at most
  $ 2 d \( f \) \( 1 - r \) + 4 C_q A_h \( f \) \( 1 - r \) . $
  This bounds the $h$-area tail by a constant times $1 - r$. Uniform comparison of $k$ and $h$ then gives the second assertion in Equation (3.6). ◻
]

The tail estimate supplies the last step of this section: continuity on the closed disc and a Sobolev exponent strictly above two. These are precisely the hypotheses used to construct the frames and variations in Section 4.

#thm([Proposition 3.4.])[
  (Boundary regularity of maximizing discs).  #emph[Every disc maximizing the functional in Equation (3.2) extends continuously to $overline(bb(D))$ and belongs to $W^(1 \, p) \( bb(D) \, X \)$ for every $2 < p < 4$. In particular, it has continuous $W^(1 \, 3)$ regularity up to the boundary. More precisely, there is a constant $C_f$ such that 
#[#set math.equation(numbering: n => "(3.8)")
 $ \| f' \( z \) \|_k lt.eq C_f \( 1 - \| z \| \)^(- 1 \/ 2) $ <eq:boundary-derivative>]

 for $z$ sufficiently close to $partial bb(D)$.]
] <ex:regularity>

#proof[
  We first make precise the uniform choice of target charts for small source discs. Choose finitely many nested coordinate neighborhoods
  $ V_alpha subset.double W_alpha subset.double U_alpha $
  such that the $V_alpha$ cover $X$ and each $U_alpha$ is a holomorphic coordinate chart. By compactness, there is a number $rho > 0$ such that if $y in V_alpha$, its metric ball of radius $rho$ is contained in $W_alpha$. On each $overline(W_alpha)$, the metric $k$ and the Euclidean coordinate metric are uniformly comparable; one comparison constant suffices for this finite collection.
  For $z in bb(D)$ put $t = 1 - \| z \|$. Let $0 < c < 1 \/ 4$, to be fixed independently of $z$ and $f$. For $w in B \( z \, c t \)$, the straight segment from $z$ to $w$ stays at source distance at least $\( 1 - c \) t$ from $partial bb(D)$. Equation (3.1) therefore bounds the length of its image by
  $ C sqrt(D) thin frac(c, 1 - c) \, $
  where $C$ accounts only for the convention relating real and complex tangent norms. Choose $c$ small enough that this bound is less than $rho$. Selecting $alpha$ with $f \( z \) in V_alpha$, we obtain
  $ f #scale(x: 120%, y: 120%)[\(] B \( z \, c t \) #scale(x: 120%, y: 120%)[\)] subset W_alpha . $
  In these coordinates the derivative of $f$ is a vector of holomorphic functions. Its squared Euclidean norm is subharmonic. The mean-value inequality and the uniform metric comparisons give
  $ \| f' \( z \) \|_k^2 lt.eq C_1 / t^2 integral_(B \( z \, c t \)) \| f' \( w \) \|_k^2 thin d S \( w \) . $
  Every point of $B \( z \, c t \)$ has modulus greater than $1 - \( 1 + c \) t$. For $t$ sufficiently small, the area-tail estimate in Equation (3.6) consequently gives
  $ integral_(B \( z \, c t \)) \| f' \( w \) \|_k^2 thin d S \( w \) lt.eq pi #scale(x: 120%, y: 120%)[\(] A_k \( f \) - A_(k \, 1 - \( 1 + c \) t) \( f \) #scale(x: 120%, y: 120%)[\)] lt.eq C_2 t . $
  This proves Equation (3.8).
  For $r < s < 1$ sufficiently close to $1$ and $zeta in partial bb(D)$, integration along the radial segment gives
  $ "dist"_k #scale(x: 120%, y: 120%)[\(] f \( r zeta \) \, f \( s zeta \) #scale(x: 120%, y: 120%)[\)] lt.eq C_3 integral_r^s \( 1 - u \)^(- 1 \/ 2) thin d u lt.eq 2 C_3 sqrt(1 - r) . $
  The estimate is uniform in $zeta$. Since $X$ is complete, each radial path has a limit, and the continuous maps $zeta mapsto f \( r zeta \)$ converge uniformly as $r arrow.t 1$. Their limit is therefore continuous on $partial bb(D)$. The same uniform estimate, together with continuity of this boundary map, proves that the resulting extension of $f$ is continuous on all of $overline(bb(D))$.
  It remains to improve the integrability of the derivative. For all sufficiently large integers $j$, let
  $ E_j = { z in bb(D) : 2^(- j - 1) < 1 - \| z \| < 2^(- j) } . $
  The area-tail estimate and Equation (3.8) imply
  $ integral_(E_j) \| f' \|_k^2 thin d S lt.eq C_4 thin 2^(- j) \, #h(2em) sup_(E_j) \| f' \|_k lt.eq C_5 thin 2^(j \/ 2) . $
  Thus, for $2 < p < 4$,
  $ integral_(E_j) \| f' \|_k^p thin d S & lt.eq #scale(x: 120%, y: 120%)[\(] sup_(E_j) \| f' \|_k #scale(x: 120%, y: 120%)[\)]^(p - 2) integral_(E_j) \| f' \|_k^2 thin d S\
 & lt.eq C_p thin 2^(- j \( 4 - p \) \/ 2) . $
  This is summable in $j$. On the remaining compact interior disc the derivative is bounded, so $\| f' \|_k in L^p \( bb(D) \)$.
  For completeness, the asserted Sobolev regularity is understood in local target coordinates. Continuity on $overline(bb(D))$ allows a finite cover of the closed source disc by small neighborhoods whose images lie in relatively compact target charts. In each such chart, the coordinate functions are bounded, are smooth in the source interior, and have first derivatives in $L^p$ by the estimate just proved and metric comparison. These classical derivatives are their weak derivatives, as is seen by testing against compactly supported smooth functions in the source interior. Hence the coordinate functions lie in $W^(1 \, p)$ up to the boundary, with the continuous boundary values already constructed. This proves the proposition. ◻
]

#prodef([Remark 3.5.])[
  The constants in Proposition 6 need not be uniform in $h$, $q$, or $delta$. What will be used is the regularity of each individual maximizing disc, to construct variations with unrestricted boundary values. The constant $D$ in Lemma 3, in contrast, depends only on the fixed metric $k$ and the compact manifold $X$.
]

== 4 Boundary frames and centered holomorphic variations <var:section>

We establish the two analytic facts needed to vary the maximizing disc. Throughout this section, let

$ f : overline(bb(D)) arrow.r X $

be continuous, holomorphic on $bb(D)$, and of class $W^(1 \, p)$ for some $p > 2$, with the coordinate convention of Section 2. The maximizers supplied by Proposition 6 satisfy these assumptions. No extension of $f$ across $partial bb(D)$ is assumed.

We use two elementary consequences of $p > 2$: the embedding $W^(1 \, p) \( bb(D) \) subset C^0 \( overline(bb(D)) \)$ and the fact that $W^(1 \, p) \( bb(D) \)$ is a Banach algebra under pointwise multiplication. In particular, a continuous, pointwise invertible $W^(1 \, p)$ matrix on $overline(bb(D))$ has a $W^(1 \, p)$ inverse.

=== 4.1 A holomorphic frame regular at the boundary <a-holomorphic-frame-regular-at-the-boundary>

We first trivialize the pulled-back tangent bundle while retaining the boundary Sobolev regularity of $f$. We will then change this frame so that its boundary values are orthonormal for $h$.

#thm([Lemma 4.1.])[
  #emph[The bundle $f^(*) T^(1 \, 0) X$ admits a holomorphic frame $e$ on $bb(D)$ which extends to a continuous, nonsingular $W^(1 \, p)$ frame on $overline(bb(D))$.]
] <var:initial-frame>

#proof[
  The continuous pullback bundle over $overline(bb(D))$ is topologically trivial. Its coordinate transition matrices are $W^(1 \, p)$: they are smooth functions of $f$ with bounded derivatives on the compact subsets of the target charts in use. Start with a continuous frame, approximate its coefficients uniformly in finitely many local frames, and combine the approximations with a smooth partition of unity on the source. This gives a $W^(1 \, p)$ frame $v$ uniformly close to the original one; sufficiently close approximation preserves its pointwise independence.
  In the frame $v$, the Dolbeault operator on the open disc has the form
  $ macron(partial) + a \, #h(2em) a in L^p \( bb(D) \, "Mat"_n \( bb(C) \) \) \, $
  where we identify a $\( 0 \, 1 \)$-form with its coefficient. Extend $a$ by zero to a disc $bb(D)_R = { \| z \| < R }$ with $R > 1$. On a sufficiently small disc $U subset bb(D)_R$ of radius $r$, solve
  #[#set math.equation(numbering: n => "(4.1)")
   $ accent(partial U, ‾)_0 = - a U_0 . $ <var:local-gauge>]
  Here and below the same notation for a matrix equation is understood entrywise. For completeness, the solid Cauchy transform
  $ T_U g \( z \) = 1 / pi integral_U frac(g \( zeta \), z - zeta) thin upright(d) S \( zeta \) $
  satisfies $accent(partial T, ‾)_U g = g$ weakly in $U$. Hölder’s inequality for its kernel and the $L^p$ estimate for the planar Cauchy singular integral #cite(label("SukhovTumanov2016")) Section 4.1 of the authors’ preprint give
  #[#set math.equation(numbering: n => "(4.2)")
   $ parallel T_U g parallel_(L^oo \( U \)) lt.eq C_p r^(1 - 2 \/ p) parallel g parallel_(L^p \( U \)) \, #h(2em) parallel T_U g parallel_(W^(1 \, p) \( U \)) lt.eq C_(p \, r) parallel g parallel_(L^p \( U \)) . $ <var:cauchy-estimates>]
  Thus $U_0 = I - T_U \( a U_0 \)$ is solved by contraction in the sup norm when $r$ is small. The radius can also be chosen so that the solution stays within distance $1 \/ 2$ of $I$. It is therefore invertible and, by Equation (4.2), belongs to $W^(1 \, p)$.
  For any two such solutions $U_i \, U_j$, the transition matrix $U_i^(- 1) U_j$ satisfies $macron(partial) \( U_i^(- 1) U_j \) = 0$ weakly on the overlap. It is consequently holomorphic there. These transitions define a holomorphic vector bundle on $bb(D)_R$. A holomorphic vector bundle on a disc is holomorphically trivial, by the Oka–Grauert principle #cite(label("Grauert1958")) #cite(label("ForstnericPrezelj2000")). Choose a global holomorphic frame of this bundle. Relative to its local frames $U_i$, its coefficients are holomorphic; relative to the original trivial bundle they are therefore $W^(1 \, p)$ on compact subsets of $bb(D)_R$. In particular the resulting matrix $U$ is continuous, invertible, and $W^(1 \, p)$ on $overline(bb(D))$, and satisfies $accent(partial U, ‾) = - a U$ on $bb(D)$. The frame $e = v U$ has all the required properties. ◻
]

#thm([Proposition 4.2.])[
  (Boundary-unitary frame).  #emph[Let $h$ be a smooth Hermitian metric on $X$. There exist a number $p_0$ with $2 < p_0 lt.eq p$ and a holomorphic frame $B = \( b_1 \, dots.h \, b_n \)$ of $f^(*) T^(1 \, 0) X$ which is continuous, nonsingular, and $W^(1 \, p_0)$ on $overline(bb(D))$, such that 
#[#set math.equation(numbering: n => "(4.3)")
 $ B \( z \)^(*) h \( f \( z \) \) B \( z \) = I \, #h(2em) z in partial bb(D) . $ <var:boundary-unitary>]

]
] <var:frame>

The factorization step belongs to the matrix spectral-factorization theory of Wiener–Masani and Helson–Lowdenslager #cite(label("WienerMasani1957")) #cite(label("HelsonLowdenslager1958")). We give the weighted Hardy-space construction and establish the boundary Sobolev regularity required for our variations.

#proof[
  Choose $e$ by Lemma 8 and set
  $ M \( z \) = e \( z \)^(*) h \( f \( z \) \) e \( z \) . $
  This is a continuous, positive definite $W^(1 \, p)$ matrix on the closed disc. In particular, there are constants $0 < m lt.eq M_0 < oo$ such that
  #[#set math.equation(numbering: n => "(4.4)")
   $ m I lt.eq M \( z \) lt.eq M_0 I quad upright("on ") overline(bb(D)) . $ <var:metric-bounds>]
  ===== 4.1.1 The Hardy-space factorization. <the-hardy-space-factorization.>
  Write $H^2 = H^2 \( partial bb(D) \, bb(C)^n \)$ for the vector Hardy space with nonnegative Fourier modes, and put $upright(d) sigma = upright(d) theta \/ \( 2 pi \)$. Equip the same vector space with the equivalent Hilbert norm
  $ parallel u parallel_M^2 = integral_(partial bb(D)) u^(*) M u thin upright(d) sigma . $
  Multiplication by $z$ is an isometry, and its closed image $z H^2$ has codimension $n$. Let $s_1 \, dots.h \, s_n$ be an orthonormal basis of $W = H^2 ⊖_M z H^2$ and form the matrix $S = \( s_1 \, dots.h \, s_n \)$. The vectors $z^j s_a$, with $j gt.eq 0$ and $1 lt.eq a lt.eq n$, are an orthonormal basis. Indeed, iterating $H^2 = W xor_M z H^2$ shows that the orthogonal complement of their span is contained in every $z^j H^2$; the intersection of these spaces is zero.
  Their orthogonality identifies all Fourier coefficients of the $L^1$ matrix $S^(*) M S$, and gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ S^(*) M S = I quad upright("almost everywhere on ") partial bb(D) . $ <var:hardy-factor>]
  Equation (4.4) then bounds the boundary values of $S$ in $L^oo$. Its holomorphic Hardy extension is bounded on $bb(D)$, as follows entrywise from the Poisson integral. It is invertible at every point $zeta in bb(D)$: evaluation at $zeta$ is a continuous surjection from $H^2$ onto $bb(C)^n$, whereas the evaluations of all $z^j s_a$ lie in the range of $S \( zeta \)$. Their dense span forces that range to be $bb(C)^n$.
  ===== 4.1.2 Regularity of the boundary factor. <regularity-of-the-boundary-factor.>
  The factor constructed so far has only almost-everywhere boundary values. We now obtain continuity and a Sobolev exponent above two, which will also give nonsingularity at every boundary point. We first record the fractional regularity supplied by $M in W^(1 \, p)$. If $M_theta \( e^(i alpha) \) = M \( e^(i \( alpha + theta \)) \)$, then
  #[#set math.equation(numbering: n => "(4.6)")
   $ parallel M_theta - M parallel_(L^p \( partial bb(D) \)) lt.eq C \| theta \|^(1 - 1 \/ p) \, #h(2em) \| theta \| lt.eq 1 / 4 . $ <var:trace-difference>]
  One can see this directly, without a trace theorem. Set $t = \| theta \|$ and choose $rho in \[ 1 - 2 t \, 1 - t \]$ such that the angular $L^p$ norm of $partial_alpha M \( rho e^(i alpha) \)$ is at most $C t^(- 1 \/ p) parallel M parallel_(W^(1 \, p))$. Radial integration and Hölder’s inequality bound $parallel M \|_(partial bb(D)) - M \( rho thin dot.op \) parallel_(L^p)$ by $C t^(1 - 1 \/ p) parallel M parallel_(W^(1 \, p))$. At radius $rho$, angular integration gives the same bound for translation through $theta$. The triangle inequality proves Equation (4.6); the argument for Sobolev functions follows by approximation, with the continuous boundary values identifying the trace.
  Let $H^s \( S^1 \)$ now denote the fractional Sobolev space on the circle, defined by square summability of Fourier coefficients with weight $1 + \| l \|^(2 s)$. This differs from the Hardy-space notation $H^2$ above. It follows that $M \|_(partial bb(D)) in H^s \( S^1 \)$ for every
  #[#set math.equation(numbering: n => "(4.7)")
   $ 1 / 2 < s < 1 - 1 / p . $ <var:s-choice>]
  Indeed, on a circle of finite measure the $L^p$ bound controls the $L^2$ bound, and integration of the squared rotation differences against $\| theta \|^(- 1 - 2 s) thin upright(d) theta$ is finite. Parseval’s identity identifies this condition with $sum_(l in bb(Z)) \( 1 + \| l \|^(2 s) \) \| M_l \|^2 < oo$.
  Let $Pi$ denote the unweighted orthogonal Hardy projection. The Toeplitz operator
  $ T_M v = Pi \( M v \) \, #h(2em) T_M : H^2 arrow.r H^2 \, $
  is bounded, self-adjoint, and satisfies $chevron.l T_M v \, v chevron.r gt.eq m parallel v parallel_2^2$. Consequently it has a bounded inverse: its range is closed by the lower bound and dense because its orthogonal complement is the kernel of its adjoint. For a column $v$ of $S$, membership in $W$ says precisely that $T_M v$ is a constant vector. Rotating this identity and subtracting it from the original one yields
  $ T_M \( v_theta - v \) = Pi #scale(x: 120%, y: 120%)[\(] \( M - M_theta \) v_theta #scale(x: 120%, y: 120%)[\)] . $
  The boundedness of $v$ and $T_M^(- 1)$ gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ parallel v_theta - v parallel_2 lt.eq C parallel \( M_theta - M \) v_theta parallel_2 lt.eq C parallel M_theta - M parallel_2 . $ <var:factor-difference>]
  The same rotation characterization therefore gives $v in H^s$.
  Write $v \( z \) = sum_(l gt.eq 0) v_l z^l$. Since $s > 1 \/ 2$, Cauchy–Schwarz shows that this series converges absolutely and uniformly on $overline(bb(D))$. Thus $v$ is continuous there. More precisely, for $1 \/ 2 < r < 1$, Parseval’s identity and Cauchy–Schwarz give
  #[#set math.equation(numbering: n => "(4.9)")
   $ parallel v' \( r thin dot.op \) parallel_2^2 & lt.eq C \( 1 - r \)^(2 s - 2) sum_(l gt.eq 1) l^(2 s) \| v_l \|^2 \,\
parallel v' \( r thin dot.op \) parallel_oo & lt.eq C \( 1 - r \)^(s - 3 \/ 2) (sum_(l gt.eq 1) l^(2 s) \| v_l \|^2)^(1 \/ 2) . $ <var:factor-l2>]
  For any $p_0 > 2$, interpolation of these two estimates bounds $parallel v' \( r thin dot.op \) parallel_(p_0)^(p_0)$ by a constant times
  $ \( 1 - r \)^(\( s - 3 \/ 2 \) \( p_0 - 2 \) + 2 s - 2) = \( 1 - r \)^(p_0 \( s - 3 \/ 2 \) + 1) . $
  This is integrable in $r$ provided
  #[#set math.equation(numbering: n => "(4.10)")
   $ 2 < p_0 < frac(2, 3 \/ 2 - s) . $ <var:p0-choice>]
  The interval is nonempty because $s > 1 \/ 2$, and we choose $p_0$ also at most $p$. It follows that $S in W^(1 \, p_0) \( bb(D) \)$.
  By continuity, Equation (4.5) now holds at every boundary point. It implies that $S$ is invertible there as well as in the interior. Compactness gives uniform nonsingularity on $overline(bb(D))$. Finally $B = e S$ is a continuous, nonsingular, $W^(1 \, p_0)$ holomorphic frame and satisfies Equation (4.3). Notice that uniform nonsingularity was obtained after boundary regularity; it was not assumed in the Hardy-space argument. ◻
]

=== 4.2 Integrating the infinitesimal variations <integrating-the-infinitesimal-variations>

The boundary-unitary frame provides sections $z b_j$ vanishing at the center. To use maximality, these sections must be derivatives of admissible holomorphic discs. Sprays of analytic discs fixing an exceptional set are standard in disc-envelope theory #cite(label("DrinovecForstneric2012")) Definition 2.1 and Lemma 2.2. The following construction records the prescribed derivatives and Sobolev parameter dependence required by the Hessian calculation.

#thm([Proposition 4.3.])[
  (Centered holomorphic variations).  #emph[Let $B$ and $p_0 > 2$ be as in Proposition 9, and set $x = f \( 0 \)$. For some $eta > 0$, there is a map 
$ F : { t in bb(C)^n : \| t \| < eta } times overline(bb(D)) arrow.r X $

 which is continuous on its domain and jointly holomorphic on ${ \| t \| < eta } times bb(D)$, and satisfies 
#[#set math.equation(numbering: n => "(4.11)")
 $ F \( 0 \, z \) = f \( z \) \, #h(2em) F \( t \, 0 \) = x \, #h(2em) frac(partial F, partial t_j) \( 0 \, z \) = z b_j \( z \) . $ <var:spray-identities>]

 In fixed local target coordinates covering the graph of $f$, the maps $t mapsto F \( t \, dot.op \)$ are holomorphic with values in $W^(1 \, p_0)$ on the corresponding source patches. In particular every $F \( t \, dot.op \)$ is a finite-area holomorphic disc centered at $x$.]
] <var:spray>

The proof first gives the graph of $f$ fiberwise holomorphic coordinates with Sobolev dependence on the source. The resulting coordinate maps need not be holomorphic in the source; we correct that defect by a nonlinear $macron(partial)$ equation. Subtracting the central value in its right inverse preserves the prescribed center.

#proof[
  #strong[Fiber coordinates.] Choose a frame $e$ from Lemma 8 and write $B = e S$. The matrix $S = e^(- 1) B$ is holomorphic on $bb(D)$ and belongs to $W^(1 \, p_0)$ on $overline(bb(D))$. We first construct fiber coordinates near the graph of $f$. Choose a finite cover of $overline(bb(D))$ by relatively open sets $U_i$ and target charts $phi.alt_i : V_i arrow.r bb(C)^n$ so that $f \( overline(U)_i \)$ is a compact subset of $V_i$, after shrinking the source sets as necessary. Let $rho_i$ be a smooth partition of unity on the closed disc subordinate to these sets. In the $i$th chart put
  $ A_i \( z \) = D phi.alt_i \( f \( z \) \) e \( z \) \, #h(2em) C_i \( z \, y \) = A_i \( z \)^(- 1) #scale(x: 120%, y: 120%)[\(] phi.alt_i \( y \) - phi.alt_i \( f \( z \) \) #scale(x: 120%, y: 120%)[\)] . $
  For $z in U_i$, the matrix $A_i$ is holomorphic in the interior, continuous and invertible up to the boundary, and of class $W^(1 \, p_0)$. The map $C_i$ is holomorphic in $y$ and, for fixed admissible $y$, holomorphic in the interior source variable $z$. On a neighborhood of the graph of $f$ define
  #[#set math.equation(numbering: n => "(4.12)")
   $ Phi \( z \, y \) = sum_i rho_i \( z \) C_i \( z \, y \) . $ <var:forward-coordinates>]
  Each term is used only where its target chart is defined; the compact support of $rho_i$ inside the corresponding source patch makes extension by zero harmless. These neighborhoods can be chosen uniformly about the graph. More precisely, on sufficiently small source patches all indices whose supports meet the patch have their charts defined on one common target neighborhood of its image under $f$. This follows from finiteness of the cover and subordination of the supports. By construction,
  #[#set math.equation(numbering: n => "(4.13)")
   $ Phi \( z \, f \( z \) \) = 0 \, #h(2em) D_y Phi \( z \, f \( z \) \) thin e \( z \) = I . $ <var:coordinate-normalization>]
  ===== 4.2.1 Uniform inverses and their Sobolev dependence. <uniform-inverses-and-their-sobolev-dependence.>
  Work on one of these smaller source patches, with fixed target chart $psi$, and put $c \( z \) = psi \( f \( z \) \)$ and $e_psi \( z \) = D psi \( f \( z \) \) e \( z \)$. Normalize the forward map by
  $ K_z \( v \) = Phi #scale(x: 120%, y: 120%)[\(] z \, psi^(- 1) \( c \( z \) + e_psi \( z \) v \) #scale(x: 120%, y: 120%)[\)] . $
  Then $K_z \( 0 \) = 0$ and $D_v K_z \( 0 \) = I$. Continuity of all fiber derivatives and compactness allow a common $R > 0$ such that the maps are defined on $\| v \| lt.eq R$ and
  $ parallel D_v K_z \( v \) - I parallel lt.eq 1 / 4 . $
  For $\| xi \| < R \/ 2$, the equation
  $ v = xi - #scale(x: 120%, y: 120%)[\(] K_z \( v \) - v #scale(x: 120%, y: 120%)[\)] $
  is a contraction of the closed ball of radius $R$ into itself. Its solution $V \( z \, xi \)$ is continuous in $\( z \, xi \)$ and holomorphic in $xi$, as follows from its uniformly convergent contraction iterations. Define $E$ by $psi \( E \( z \, xi \) \) = c \( z \) + e_psi \( z \) V \( z \, xi \)$. The local inverses agree near $xi = 0$ by uniqueness and then throughout their common fiber domain by holomorphy. Taking the minimum of the finitely many radii gives a common fiber neighborhood, with
  $ Phi \( z \, E \( z \, xi \) \) = xi \, $
  and
  #[#set math.equation(numbering: n => "(4.14)")
   $ E \( z \, 0 \) = f \( z \) \, #h(2em) E_xi \( z \, 0 \) = e \( z \) . $ <var:inverse-normalization>]
  We next obtain a Sobolev estimate uniform in the fiber parameter. The chart formula for $K_z$ depends smoothly on the finite coefficient list
  $ a \( z \) = #scale(x: 120%, y: 120%)[\(] rho_i \( z \) \, A_i \( z \)^(- 1) \, phi.alt_i \( f \( z \) \) \, c \( z \) \, e_psi \( z \) #scale(x: 120%, y: 120%)[\)]_i . $
  All these coefficients are $W^(1 \, p_0)$ with compact range. Fix a smaller closed fiber polydisc inside $\| xi \| < R \/ 2$. The strict bounds in the contraction argument persist when the coefficient list varies in a sufficiently small neighborhood of its compact range. The finite-dimensional implicit function theorem, with the coefficients regarded as real parameters, therefore makes $V$ a smooth function of that list and $xi$, holomorphic in $xi$. After shrinking this coefficient neighborhood, its first coefficient derivatives are uniformly bounded on the fixed fiber polydisc. The same is true for the coordinate inverse $E_psi \( z \, xi \) := psi \( E \( z \, xi \) \) = c \( z \) + e_psi \( z \) V \( z \, xi \)$. The Sobolev chain rule now shows that $E_psi \( dot.op \, xi \)$ is $W^(1 \, p_0)$, with its weak source derivatives bounded by a single $L^(p_0)$ function independent of $xi$. In particular, for some $b in L^(p_0)$ on the source patch,
  #[#set math.equation(numbering: n => "(4.15)")
   $ \| E_psi \( z \, xi \) \| lt.eq C \, #h(2em) \| nabla_z E_psi \( z \, xi \) \| lt.eq C b \( z \) quad upright("for almost every ") z \, $ <var:inverse-sobolev-bound>]
  uniformly for $xi$ in that smaller polydisc. One may take $b$ to be a constant plus the sum of the absolute values of the first weak derivatives of the finite coefficient list. Derivatives with respect to $xi$ satisfy the same type of bound after another fixed shrink of the polydisc, by Cauchy’s formula.
  ===== 4.2.2 Holomorphic substitution. <holomorphic-substitution.>
  These estimates also justify holomorphy of the substitution operator
  #[#set math.equation(numbering: n => "(4.16)")
   $ u mapsto E_psi \( dot.op \, u \( dot.op \) \) $ <var:inverse-substitution>]
  from a neighborhood of zero in $W^(1 \, p_0) \( bb(D) \, bb(C)^n \)$ into the local $W^(1 \, p_0)$ space. Indeed, expand in the fiber variable:
  $ E_psi \( z \, xi \) = sum_(alpha in bb(N)^n) E_alpha \( z \) xi^alpha . $
  Cauchy’s formula on a fixed fiber polydisc, with weak $z$ differentiation under its contour integral, gives
  $ parallel E_alpha parallel_oo + parallel nabla E_alpha parallel_(p_0) lt.eq C r_1^(- \| alpha \|) $
  for some $r_1 > 0$, by Equation (4.15). The algebra norm $parallel a parallel_oo + parallel nabla a parallel_(p_0)$ is submultiplicative. Thus $sum_alpha E_alpha u^alpha$ converges normally in the local $W^(1 \, p_0)$ space when the global $W^(1 \, p_0)$ norm of $u$ is small; the number of multi-indices of a fixed degree grows polynomially. Each term is a continuous homogeneous polynomial in $u$, proving the assertion. This argument only concerns fixed local target coordinates; no linear structure on $X$ is being presumed.
  ===== 4.2.3 The nonlinear holomorphic-map equation. <the-nonlinear-holomorphic-map-equation.>
  The fiber coordinates now have the necessary Sobolev regularity. It remains to correct their antiholomorphic derivative in the source while keeping the center and the prescribed first-order directions. For $u in W^(1 \, p_0) \( bb(D) \, bb(C)^n \)$ close to zero, the Sobolev chain rule in a target chart gives
  $ macron(partial) #scale(x: 120%, y: 120%)[\(] E \( z \, u \( z \) \) #scale(x: 120%, y: 120%)[\)] = E_xi \( z \, u \( z \) \) accent(partial u, ‾) + macron(partial)_z E \( z \, u \( z \) \) . $
  There is no $macron(partial) overline(u)$ term, since $E$ is holomorphic in $xi$. Thus the map is weakly holomorphic precisely when
  #[#set math.equation(numbering: n => "(4.17)")
   $ accent(partial u, ‾) + Q \( dot.op \, u \) = 0 \, #h(2em) Q \( z \, xi \) = E_xi \( z \, xi \)^(- 1) macron(partial)_z E \( z \, xi \) . $ <var:nonlinear-equation>]
  The formula is independent of the chosen target chart, because the derivative of a holomorphic chart change multiplies both terms.
  Differentiating $Phi \( z \, E \( z \, xi \) \) = xi$ with $xi$ fixed and using $E_xi = \( D_y Phi \)^(- 1)$ gives
  #[#set math.equation(numbering: n => "(4.18)")
   $ Q \( z \, xi \) = - macron(partial)_z Phi \( z \, E \( z \, xi \) \) = - sum_i \( macron(partial) rho_i \) \( z \) C_i \( z \, E \( z \, xi \) \) . $ <var:q-forward>]
  For the second equality we used holomorphy in $z$ of $C_i$ with $y$ fixed. In particular $Q$ is holomorphic in $xi$ and jointly continuous and bounded on the closed disc times a smaller closed fiber polydisc. Cauchy’s formula gives coefficients satisfying $parallel Q_alpha parallel_oo lt.eq C r_2^(- \| alpha \|)$ for some $r_2 > 0$. The normally convergent series $sum_alpha Q_alpha u^alpha$ therefore shows that
  #[#set math.equation(numbering: n => "(4.19)")
   $ cal(Q) : W^(1 \, p_0) \( bb(D) \, bb(C)^n \) arrow.r L^(p_0) \( bb(D) \, bb(C)^n \) \, #h(2em) cal(Q) \( u \) = Q \( dot.op \, u \( dot.op \) \) \, $ <var:q-analytic>]
  is holomorphic near zero, using the embedding of $W^(1 \, p_0)$ into the sup norm.
  The constant and linear terms vanish. Indeed, $C_i \( z \, f \( z \) \) = 0$ and $D_y C_i \( z \, f \( z \) \) e \( z \) = I$. Equations (4.14) and (4.18), together with $sum_i macron(partial) rho_i = 0$, therefore give
  #[#set math.equation(numbering: n => "(4.20)")
   $ Q \( z \, 0 \) = 0 \, #h(2em) Q_xi \( z \, 0 \) = 0 . $ <var:q-vanishing>]
  Equivalently, $cal(Q) \( 0 \) = 0$ and $D cal(Q) \( 0 \) = 0$ as maps between the indicated Banach spaces.
  ===== 4.2.4 The implicit function theorem with the center fixed. <the-implicit-function-theorem-with-the-center-fixed.>
  On the full disc, let $T : L^(p_0) arrow.r W^(1 \, p_0)$ be the solid Cauchy right inverse from Equation (4.2). Since point evaluation is bounded on $W^(1 \, p_0)$, the operator
  $ H g = T g - \( T g \) \( 0 \) $
  is bounded and satisfies
  #[#set math.equation(numbering: n => "(4.21)")
   $ accent(partial H, ‾) g = g \, #h(2em) \( H g \) \( 0 \) = 0 . $ <var:centered-inverse>]
  Seek a solution of Equation (4.17) in the form
  #[#set math.equation(numbering: n => "(4.22)")
   $ u \( t \, z \) = z S \( z \) t + H g \( t \) \( z \) \, #h(2em) g \( t \) in L^(p_0) \( bb(D) \, bb(C)^n \) . $ <var:u-ansatz>]
  Since $S$ is holomorphic and $W^(1 \, p_0)$, the equation becomes
  $ G \( g \, t \) := g + cal(Q) #scale(x: 120%, y: 120%)[\(] z S t + H g #scale(x: 120%, y: 120%)[\)] = 0 . $
  This is a holomorphic equation with values in $L^(p_0)$, and Equation (4.20) gives
  $ G \( 0 \, 0 \) = 0 \, #h(2em) D_g G \( 0 \, 0 \) = I . $
  The complex Banach implicit function theorem #cite(label("Glockner2006")) Theorem 2.3(ii), (d) of the author’s preprint supplies a holomorphic solution $g \( t \)$ for $t$ in a neighborhood of zero. Differentiating the equation at zero gives
  $ g \( 0 \) = 0 \, #h(2em) D_t g \( 0 \) = 0 . $
  Consequently $u \( t \)$ is holomorphic with values in $W^(1 \, p_0)$, is small in the sup norm for $t$ sufficiently small, and satisfies
  $ u \( t \, 0 \) = 0 \, #h(2em) u \( 0 \, z \) = 0 \, #h(2em) frac(partial u, partial t_j) \( 0 \, z \) = z S \( z \) e_j \, $
  where $e_j$ here denotes the $j$th standard vector of $bb(C)^n$.
  Set $F \( t \, z \) = E \( z \, u \( t \, z \) \)$. The identities in Equation (4.11) follow from Equation (4.14) and $e S = B$. Equation (4.16) gives its holomorphic parameter dependence in local $W^(1 \, p_0)$ coordinates. In particular it is jointly continuous up to the source boundary. For each fixed $t$, Equation (4.17) makes its coordinate functions weakly holomorphic on the open disc. They are therefore ordinary holomorphic functions. For each fixed $z$, bounded point evaluation on $W^(1 \, p_0)$ and holomorphy of $E$ in its fiber variable give holomorphy in $t$. Local separate holomorphy now gives joint holomorphy on ${ \| t \| < eta } times bb(D)$.
  Finally $F \( t \, dot.op \)$ is $W^(1 \, p_0)$ with $p_0 > 2$ and has compact image, so its area with respect to any smooth Hermitian metric on $X$ is finite. Thus all parameters in a sufficiently small complex neighborhood give admissible centered discs. The construction imposes no condition on their boundary maps and requires no extension across $partial bb(D)$. ◻
]

#prodef([Remark 4.4.])[
  Although derivative evaluation at a point is not bounded on the full space $W^(1 \, p_0)$, it is bounded on its holomorphic subspace on each smaller disc, by the Cauchy formula. In particular $t mapsto partial_z F \( t \, 0 \)$ is holomorphic. Hence the central derivative functional can be differentiated along Proposition 10 without additional boundary regularity.
] <var:center-derivative>

== 5 The trace of the complex Hessian <sec:hessian>

The variations constructed in Section 4 let us apply the second-derivative test at a maximizing disc. We compute the central, logarithmically weighted, and unweighted terms separately, then combine them in one inequality used by both positivity arguments.

Let $f$ be a maximizing disc furnished by Proposition 4. Write $x = f \( 0 \)$ and retain the Kähler metric $h$ used in its functional. Use Proposition 9 to choose a boundary-unitary holomorphic frame $B = \( b_1 \, dots.h \, b_n \)$ for $f^(*) T^(1 \, 0) X$, and Proposition 10 to realize the sections $z b_j$ by a family $F \( t \, z \)$ with fixed center. The arguments in this section apply more generally to any disc and family with those properties. After decreasing the Sobolev exponent if necessary, all the maps and frames have $W^(1 \, p_0)$ regularity for one $p_0 > 2$.

Set

$ N \( z \) = B \( z \)^(*) h \( f \( z \) \) B \( z \) . $

This positive-definite matrix is smooth in the open disc, continuous and uniformly positive definite on its closure, and belongs to $W^(1 \, p_0)$. Its boundary value is $I$.

#thm([Lemma 5.1.])[
  (Determinant identity).  #emph[With these conventions, 
#[#set math.equation(numbering: n => "(5.1)")
 $ log det N \( 0 \) = P_(R_h) \( f \) . $ <eq:determinant-identity>]

]
] <hes:determinant>

#proof[
  In a holomorphic target chart, the matrix of $B$ is holomorphic and nonsingular. Thus
  $ partial_z partial_(macron(z)) log det N = partial_z partial_(macron(z)) log det h \( f \( z \) \) = - R_h \( f' \, f' \) . $
  The first equality follows because $log \| det B \|^2$ is harmonic; the formula is independent of the target chart. The right-hand side lies in $L^(p_0 \/ 2)$. Apply Lemma 2 and use $log det N = 0$ on the boundary. ◻
]

For a functional of the family, define

$ cal(L) = sum_(j = 1)^n frac(partial^2, partial t_j partial overline(t_j))\|_(t = 0) . $

#thm([Proposition 5.2.])[
  (Trace identities).  #emph[For every smooth closed real $\( 1 \, 1 \)$-form $q$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ cal(L) d \( F_t \) & = "tr" \( B \( 0 \)^(*) k \( x \) B \( 0 \) \) \,\
cal(L) P_q \( F_t \) & = frac(1, 2 pi) integral_0^(2 pi) \( "tr"_h q \) \( f \( e^(i theta) \) \) thin upright(d) theta \,\
cal(L) A_h \( F_t \) & = n - A_(R_h) \( f \) . $ <eq:hessian-central>]

 Here $F_t$ means the disc $z mapsto F \( t \, z \)$, not a parameter derivative.]
] <hes:trace>

#proof[
  #strong[The central term and differentiation under the integrals.] Since $F \( t \, 0 \) = x$, the vector $partial_z F \( t \, 0 \)$ is holomorphic in $t$ and lies in the fixed vector space $T_x^(1 \, 0) X$. Its $t_j$ derivative at zero is $b_j \( 0 \)$. Differentiating its squared $k \( x \)$ norm gives Equation (5.2). The holomorphic dependence of this central derivative also follows directly from Cauchy’s formula on a smaller source circle.
  We next justify the variations under the area and Poisson integrals. Choose finitely many fixed source patches and target charts containing the image of $F$ for sufficiently small $t$. In each chart the map $t mapsto F \( t \, dot.op \)$ is holomorphic into $W^(1 \, p_0)$. The smooth metric coefficients and the product rule imply that
  $ t mapsto q \( F_z \( t \, dot.op \) \, F_z \( t \, dot.op \) \) $
  is twice continuously differentiable into $L^(p_0 \/ 2)$; the same holds with $h$. Indeed, each parameter derivative is a sum of products of two first source derivatives in $L^(p_0)$, with uniformly bounded Sobolev coefficient factors. A fixed partition of unity in the source gives the global assertion. Since $p_0 \/ 2 > 1$, integration against $1$ or against $log \( 1 \/ \| z \| \)$ is a continuous functional on this space. Differentiation under both integrals is therefore valid.
  ===== 5.1 The local identity and its Poisson integral. <the-local-identity-and-its-poisson-integral.>
  Locally write $q = i partial macron(partial) phi.alt$. Joint holomorphy of $F$ on the open product of the parameter domain and the disc gives
  $ q \( F_z \, F_z \) & = partial_z partial_(macron(z)) \( phi.alt compose F \) \,\
cal(L) \( phi.alt compose F \) & = sum_j q \( F_(t_j) \, F_(t_j) \) \|_(t = 0) . $
  Commuting these derivatives and using $F_(t_j) \( 0 \, z \) = z b_j \( z \)$ yields the intrinsic identity
  #[#set math.equation(numbering: n => "(5.3)")
   $ cal(L) q \( F_z \, F_z \) = partial_z partial_(macron(z)) (\| z \|^2 "tr" \( B^(*) q \( f \) B \)) . $ <eq:local-hessian>]
  In particular, the mixed source derivative on the right belongs to $L^(p_0 \/ 2)$ by the preceding differentiability argument.
  The scalar function in parentheses is continuous on $overline(bb(D))$ and vanishes at zero. Lemma 2 therefore computes its Poisson integral from its boundary values. On the boundary, the columns of $B$ are an $h$-orthonormal basis, so $"tr" \( B^(*) q B \) = "tr"_h q$. This proves Equation (5.2).
  ===== 5.2 The area integral and its weak boundary limit. <the-area-integral-and-its-weak-boundary-limit.>
  At the identity matrix, trace and log determinant have the same differential. The boundary normalization will therefore let us replace one radial derivative by the other, with an error controlled by the radial Sobolev estimate along suitable radii. For the area identity put $T = "tr" N$. Integrating Equation (5.3) with $q = h$ on $\| z \| < r$ gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ 1 / pi integral_(\| z \| < r) cal(L) h \( F_z \, F_z \) thin upright(d) S = r^2 chevron.l T chevron.r_r + r^3 / 2 chevron.l T_r chevron.r_r . $ <eq:area-radius-hessian>]
  The left-hand side tends to $cal(L) A_h \( F_t \)$ by integrability. The first term on the right tends to $n$. To handle the second term without assuming boundary differentiability, observe that
  #[#set math.equation(numbering: n => "(5.5)")
   $ T_r - \( log det N \)_r = "tr" \( \( I - N^(- 1) \) N_r \) . $ <eq:trace-logdet-error>]
  All matrix norms here are equivalent, and uniform positive definiteness gives
  $ \| chevron.l T_r - \( log det N \)_r chevron.r_r \| lt.eq C parallel N \( r \, dot.op \) - I parallel_(L^2 \( S^1 \)) parallel N_r \( r \, dot.op \) parallel_(L^2 \( S^1 \)) . $
  The radial $W^(1 \, 2)$ estimate and the trace $N = I$ give
  #[#set math.equation(numbering: n => "(5.6)")
   $ parallel N \( r \, dot.op \) - I parallel_2 lt.eq \( 1 - r \)^(1 \/ 2) (integral_r^1 parallel N_s \( s \, dot.op \) parallel_2^2 thin upright(d) s)^(1 \/ 2) = o \( \( 1 - r \)^(1 \/ 2) \) . $ <eq:radial-trace-estimate>]
  This follows first on almost every radial line by the fundamental theorem for Sobolev functions, and then by Cauchy–Schwarz and integration over the angle. Smoothness inside the disc and continuity at the boundary give the same estimate for the interior radii used below.
  Since $integral_(1 \/ 2)^1 parallel N_r parallel_2^2 thin upright(d) r < oo$, there are radii $r_nu arrow.t 1$ for which $\( 1 - r_nu \) parallel N_r \( r_nu \, dot.op \) parallel_2^2$ is bounded. Otherwise its eventual lower bound would contradict integrability. Along these radii, Equations (5.5) and (5.6) show that the two circular derivative means differ by $o \( 1 \)$.
  On the other hand, the curvature calculation in Lemma 12 and Equation (2.3) give, for every interior radius,
  $ r / 2 chevron.l \( log det N \)_r chevron.r_r = - A_(R_h \, r) \( f \) . $
  The right-hand side tends to $- A_(R_h) \( f \)$. Substitute into Equation (5.4) along the chosen radii. Its left-hand side has a limit independent of the sequence, proving Equation (5.2). ◻
]

#thm([Corollary 5.3.])[
  (Maximizing inequality).  #emph[For a maximizer of $d + P_q - delta A_h$ centered at $x$, the boundary-unitary frame satisfies 
#[#set math.equation(numbering: n => "(5.7)")
 $ "tr" \( B \( 0 \)^(*) k \( x \) B \( 0 \) \) + frac(1, 2 pi) integral_0^(2 pi) \( "tr"_h q \) \( f \( e^(i theta) \) \) thin upright(d) theta lt.eq delta #scale(x: 120%, y: 120%)[\(] n - A_(R_h) \( f \) #scale(x: 120%, y: 120%)[\)] . $ <eq:maximum-inequality>]

 It also satisfies Equation (5.1), and $A_q \( f \) gt.eq - d \( f \)$.]
] <hes:maximum>

#proof[
  Every sufficiently small parameter value gives an admissible finite-area disc with the same center. Hence the real-valued twice differentiable function $J \( F_t \)$ has a local maximum at zero, and $cal(L) J \( F_t \) lt.eq 0$. Proposition 13 gives the displayed inequality. The remaining assertions are Lemma 12 and the dilation inequality of Lemma 5. ◻
]

The two applications use different parts of the maximizing property. In Section 6, we set $h = k$ and $q = R_k$ and let $delta$ tend to zero after comparing the maximum with each fixed test disc; this gives a bound on $P_(R_k)$ for all finite-area discs. In Section 7, we set $q = - h$ and $delta = 1$. Comparison with the constant disc then bounds $P_h \( f \) + A_h \( f \)$ by $D$, independently of $h$. Together with $R_h gt.eq - h$, this is the additional information that makes the volume estimate uniform over all such metrics.

== 6 Bounded canonical potentials and nefness <sec:nefness>

The first application of the maximizing inequality proves nefness of $K_X$. We proceed in three steps: bound the Poisson Ricci integral on every finite-area disc, convert the bound into locally bounded plurisubharmonic metric weights, and smooth those weights with arbitrarily small loss of positivity. We first apply the preceding disc inequalities with the fixed Kähler form $k$. As before, $R_k = - i partial macron(partial) log det k$, and $D$ denotes the uniform upper bound for $d \( f \) = k \( f' \( 0 \) \, f' \( 0 \) \)$ from Lemma 3.

#thm([Proposition 6.1.])[
  (Uniform Ricci-disc bound).  #emph[There is a constant $C gt.eq 0$, depending only on the fixed metric $k$, such that 
#[#set math.equation(numbering: n => "(6.1)")
 $ P_(R_k) \( f \) lt.eq C $ <eq:nef-uniform-disc-bound>]

 for every finite-area holomorphic disc $f : bb(D) arrow.r X$.]
] <nef:disc-bound>

#proof[
  For $0 < delta lt.eq 1$ and a prescribed center $x$, let $f$ maximize
  $ J_delta \( f \) = d \( f \) + P_(R_k) \( f \) - delta A_k \( f \) . $
  Such a maximizer exists by Proposition 4. Use the boundary-normalized holomorphic frame $B$ associated to this maximizer and put $N \( z \) = B \( z \)^(*) k \( f \( z \) \) B \( z \)$. Set
  $ M = sup_X \| "tr"_k R_k \| . $
  The dilation inequality, Equation (3.5), gives $A_(R_k) \( f \) gt.eq - d \( f \) gt.eq - D$. Consequently, Equation (5.7), with $h = k$ and $q = R_k$, implies
  $ "tr" N \( 0 \) lt.eq delta #scale(x: 120%, y: 120%)[\(] n - A_(R_k) \( f \) #scale(x: 120%, y: 120%)[\)] + M lt.eq n + D + M . $
  The determinant identity, Equation (5.1), and the arithmetic-geometric mean inequality yield
  $ P_(R_k) \( f \) = log det N \( 0 \) lt.eq n log #h(-0.16667em) (frac(n + D + M, n)) = : C_1 . $
  Since $A_k \( f \) gt.eq 0$ and $d \( f \) lt.eq D$, the maximal value of $J_delta$ is at most $D + C_1$, independently of both $x$ and $delta$. Now fix any finite-area disc $g$, use its center in this maximization, and obtain
  $ d \( g \) + P_(R_k) \( g \) - delta A_k \( g \) lt.eq D + C_1 . $
  Letting $delta arrow.b 0$ for this fixed disc and using $d \( g \) gt.eq 0$ proves the assertion with $C = D + C_1$. This limiting argument requires no area bound uniform in $delta$ for the maximizing discs. ◻
]

=== 6.1 The Poisson envelope on the determinant bundle <the-poisson-envelope-on-the-determinant-bundle>

Poletsky introduced disc envelopes for plurisubharmonic functions, and Rosay established the manifold case #cite(label("Poletsky1991")) #cite(label("Rosay2003")). The formulation below is due to Drinovec Drnovšek and Forstnerič, whose theorem also covers locally irreducible complex spaces #cite(label("DrinovecForstneric2012")). The use of a line bundle lets the Ricci-disc bound control these envelopes without choosing one global potential on $X$.

We use the Poletsky–Rosay Theorem in the following form. If $Z$ is a connected complex manifold and $b : Z arrow.r bb(R) union { - oo }$ is upper semicontinuous, then

$ cal(P) b \( y \) = inf_(G \( 0 \) = y) frac(1, 2 pi) integral_0^(2 pi) b \( G \( e^(i theta) \) \) thin upright(d) theta $

is plurisubharmonic or identically $- oo$. Here the infimum is taken over maps $G : overline(bb(D)) arrow.r Z$ that are continuous on $overline(bb(D))$ and holomorphic in $bb(D)$. There is no requirement that $Z$ be compact or that $b$ be bounded below. This is, in particular, the manifold case of the more general Theorem 1.1 of #cite(label("DrinovecForstneric2012")). For continuous real-valued $b$, the same envelope results if the test maps are required to be holomorphic on neighborhoods of $overline(bb(D))$: replace each test map $G$ by $z mapsto G \( r z \)$ and let $r arrow.t 1$.

#thm([Proposition 6.2.])[
  (Bounded positive canonical potentials).  #emph[There is a bounded real-valued function $u$ on $X$ such that 
$ T = - R_k + i partial accent(partial u, ‾) gt.eq 0 $

 is a closed positive $\( 1 \, 1 \)$-current. In every local holomorphic frame $s_i$ of $det T^(1 \, 0) X$, put $a_i = log \| s_i \|_k^2$. Then $a_i + u$ is plurisubharmonic and locally bounded. These are local weights of a singular Hermitian metric with nonnegative curvature on $K_X$.]
] <nef:bounded-potentials>

#proof[
  Write $L = det T^(1 \, 0) X$ and let $pi : Y = L \\ 0_X arrow.r X$ be the complement of its zero section. Define
  $ ell \( s \) = log \| s \|_k^2 \, #h(2em) s in Y . $
  This is a smooth finite-valued function on the connected complex manifold $Y$. In a local trivialization $s = lambda s_i \( x \)$ it has the expression
  $ ell \( s \) = log \| lambda \|^2 + a_i \( x \) \, #h(2em) i partial accent(partial a, ‾)_i = - R_k . $
  Since $lambda eq.not 0$, the first summand is pluriharmonic. Therefore
  #[#set math.equation(numbering: n => "(6.2)")
   $ i partial macron(partial) ell = - pi^(*) R_k . $ <eq:nef-total-space-curvature>]
  Let $v = cal(P) ell$, using test discs holomorphic past the closed unit disc. For such a disc $G$ with $G \( 0 \) = s$, its projection $f = pi compose G$ has finite area. Green’s formula and Equation (6.2) give
  $ frac(1, 2 pi) integral_0^(2 pi) ell \( G \( e^(i theta) \) \) thin upright(d) theta = ell \( s \) - P_(R_k) \( f \) . $
  Proposition 15 bounds every such mean below by $ell \( s \) - C$, while the constant disc has mean $ell \( s \)$. Thus
  #[#set math.equation(numbering: n => "(6.3)")
   $ ell - C lt.eq v lt.eq ell . $ <eq:nef-envelope-bounds>]
  The Poletsky–Rosay Theorem applies even though $ell$ is globally unbounded, and Equation (6.3) excludes its identically $- oo$ alternative. Hence $v$ is plurisubharmonic.
  For every $lambda in bb(C)^(*)$, multiplication by $lambda$ is a biholomorphism of $Y$ and gives a bijection between the test discs centered at $s$ and at $lambda s$. Since $ell \( lambda s \) = ell \( s \) + log \| lambda \|^2$, it follows that
  $ v \( lambda s \) = v \( s \) + log \| lambda \|^2 . $
  Thus $v - ell$ is constant on every fiber. It has the form $u compose pi$, where $- C lt.eq u lt.eq 0$. Pulling back $v$ by the local holomorphic map $s_i$ proves that $a_i + u$ is plurisubharmonic. It is locally bounded because $a_i$ is smooth and $u$ is bounded. The local currents $i partial macron(partial) \( a_i + u \)$ agree and equal $- R_k + i partial accent(partial u, ‾)$.
  To check the line-bundle sign explicitly, if $s_i = g_(i j) s_j$ then
  $ a_i - a_j = log \| g_(i j) \|^2 . $
  Let $s_i^(*)$ be the dual frame of $K_X = L^(*)$. The prescription
  $ \| s_i^(*) \|^2 = exp #scale(x: 120%, y: 120%)[\(] - \( a_i + u \) #scale(x: 120%, y: 120%)[\)] $
  is compatible with $s_i^(*) = g_(i j)^(- 1) s_j^(*)$. Its curvature is $i partial macron(partial) \( a_i + u \) = T gt.eq 0$. In particular $T$ represents $2 pi c_1 \( K_X \)$, rather than $2 pi c_1 \( L \)$. ◻
]

=== 6.2 From bounded potentials to nefness <from-bounded-potentials-to-nefness>

A holomorphic line bundle is nef if, for every $epsilon > 0$, it admits a smooth Hermitian metric whose real curvature is at least $- epsilon k$. This definition is independent of the background Kähler metric on a compact manifold. The following approximation result converts the bounded potentials just constructed into such metrics.

#thm([Lemma 6.3.])[
  (Smoothing a bounded positive potential).  #emph[Let $\( M \, k \)$ be a compact Kähler manifold, let $alpha$ be a smooth closed real $\( 1 \, 1 \)$-form on $M$, and let $u$ be a bounded real-valued function such that $alpha + i partial accent(partial u, ‾) gt.eq 0$ in the sense of currents. For every $epsilon > 0$ there is a smooth real-valued function $u_epsilon$ on $M$ such that 
$ alpha + i partial accent(partial u, ‾)_epsilon gt.eq - epsilon k . $

]
] <nef:bounded-smoothing>

This is the bounded-potential case of the regularization theorem for positive currents: locally bounded plurisubharmonic potentials have zero Lelong numbers, so #cite(label("Demailly1992")) Corollary 6.4 gives nefness. Appendix 11 supplies a direct proof. Its key estimate compares regularizations on overlapping charts without assuming that the original bounded potentials are continuous.

#thm([Proposition 6.4.])[
  (Nefness of the canonical class).  #emph[For every $epsilon > 0$ there is a smooth real-valued function $u_epsilon$ on $X$ such that 
$ - R_k + i partial accent(partial u, ‾)_epsilon gt.eq - epsilon k . $

 Consequently $2 pi c_1 \( K_X \)$ is nef.]
] <nef:nef>

#proof[
  Apply Lemma 17 with $M = X$, $alpha = - R_k$, and the bounded function $u$ of Proposition 16. The resulting functions $u_epsilon$ give smooth canonical metrics with local squared norms $exp \( - \( a_i + u_epsilon \) \)$ in the dual frames $s_i^(*)$. Their curvatures are $- R_k + i partial accent(partial u, ‾)_epsilon gt.eq - epsilon k$. ◻
]

== 7 A uniform volume estimate <sec:volume>

Keep the background Kähler form $k$ fixed, and let $D$ be the uniform bound from Lemma 3:

$ d \( f \) = k #scale(x: 120%, y: 120%)[\(] f' \( 0 \) \, f' \( 0 \) #scale(x: 120%, y: 120%)[\)] lt.eq D $

for every holomorphic disc in $X$. We first extract a second consequence of the extremal-disc argument. Its constant will be independent of the Kähler metric to which it is applied.

#thm([Proposition 7.1.])[
  (Uniform lower bound for the volume form).  #emph[For every smooth Kähler form $h$ on $X$ satisfying $R_h gt.eq - h$, one has 
#[#set math.equation(numbering: n => "(7.1)")
 $ h^n gt.eq c_(n \, D) thin k^n \, #h(2em) c_(n \, D) = e^(- D) (frac(n, 2 n + D))^n > 0 . $ <eq:uniform-volume-lower-bound>]

]
] <prop:volume-lower-bound>

#proof[
  Fix $x in X$. Use the maximizer from Proposition 4 with $q = - h$ and $delta = 1$, so that its functional is
  $ J \( f \) = d \( f \) - P_h \( f \) - A_h \( f \) . $
  The constant disc centered at $x$ has value zero. Consequently a maximizing disc $f$ satisfies
  #[#set math.equation(numbering: n => "(7.2)")
   $ P_h \( f \) + A_h \( f \) lt.eq d \( f \) lt.eq D . $ <eq:volume-extremal-energy>]
  Both terms on the left are nonnegative. The assumed Ricci inequality therefore gives
  $ A_(R_h) \( f \) gt.eq - A_h \( f \) gt.eq - D \, #h(2em) P_(R_h) \( f \) gt.eq - P_h \( f \) gt.eq - D . $
  Let $B$ be the holomorphic frame along $f$ normalized to be $h$-orthonormal on the boundary. Since $"tr"_h \( - h \) = - n$, the maximum inequality, Equation (5.7), yields
  $ "tr" #scale(x: 120%, y: 120%)[\(] B \( 0 \)^(*) k \( x \) B \( 0 \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 n - A_(R_h) \( f \) lt.eq 2 n + D . $
  Meanwhile, the determinant identity, Equation (5.1), gives
  $ det #scale(x: 120%, y: 120%)[\(] B \( 0 \)^(*) h \( x \) B \( 0 \) #scale(x: 120%, y: 120%)[\)] = exp #scale(x: 120%, y: 120%)[\(] P_(R_h) \( f \) #scale(x: 120%, y: 120%)[\)] gt.eq e^(- D) . $
  The arithmetic–geometric mean inequality for the eigenvalues of the positive Hermitian matrix $B \( 0 \)^(*) k \( x \) B \( 0 \)$ gives
  $ det #scale(x: 120%, y: 120%)[\(] B \( 0 \)^(*) k \( x \) B \( 0 \) #scale(x: 120%, y: 120%)[\)] lt.eq (frac(2 n + D, n))^n . $
  Taking the quotient cancels the common factor $\| det B \( 0 \) \|^2$:
  $ h^n / k^n \( x \) = frac(det #scale(x: 120%, y: 120%)[\(] B \( 0 \)^(*) h \( x \) B \( 0 \) #scale(x: 120%, y: 120%)[\)], det #scale(x: 120%, y: 120%)[\(] B \( 0 \)^(*) k \( x \) B \( 0 \) #scale(x: 120%, y: 120%)[\)]) gt.eq e^(- D) (frac(n, 2 n + D))^n . $
  The point $x$ was arbitrary, proving the assertion. ◻
]

The maximizing disc, its boundary regularity, and the size of its holomorphic variation may all depend on $h$ and $x$. The proof applies the variational identities separately for each such choice. None of these auxiliary bounds enters the constant in Equation (7.1).

== 8 Positive top self-intersection <sec:positive-intersection>

Nefness allows us to approach the canonical class through Kähler classes. We choose in each such class a metric to which the uniform volume estimate applies. This Monge–Ampère and cohomological-volume strategy is also used by Wu and Yau #cite(label("WuYau2016")) Proposition 8(i) and the proof of Lemma 6 in the authors’ preprint. We use the following established form of the negative-sign complex Monge–Ampère theorem. It is the Aubin–Yau existence theorem #cite(label("Aubin1998")) #cite(label("Yau1978")); the statement for an arbitrary smooth volume form is also recorded explicitly in #cite(label("Berman2019")) §1, Equation (1.1).

#thm([Theorem 8.1.])[
  (Negative-sign complex Monge–Ampère theorem).  #emph[Let $M$ be a compact Kähler manifold of dimension $n$, let $gamma$ be a Kähler form on $M$, and let $Omega$ be a smooth positive volume form. There is a smooth real function $w$ such that 
$ gamma + i partial accent(partial w, ‾) > 0 \, #h(2em) \( gamma + i partial accent(partial w, ‾) \)^n = e^w Omega . $

]
] <thm:negative-cma>

There is no prescribed normalization of $Omega$ in this statement. The unknown includes its additive constant, which enters the right-hand side through $e^w$. In particular, the theorem is not restricted to a Kähler form representing the canonical class.

#thm([Proposition 8.2.])[
  #emph[The canonical class has positive top self-intersection: 
$ integral_X c_1 \( K_X \)^n > 0 . $

]
] <prop:positive-top-intersection>

#proof[
  Write
  $ alpha = \[ - R_k \] = 2 pi c_1 \( K_X \) . $
  The nefness proved in Proposition 18 means that, for each $t > 0$, there is a smooth real function $a_t$ for which
  $ - R_k + i partial accent(partial a, ‾)_t gt.eq - t / 2 k . $
  It follows that
  $ gamma_t = - R_k + t k + i partial accent(partial a, ‾)_t gt.eq t / 2 k > 0 $
  is a Kähler form. Apply Theorem 20 with this form and with the smooth positive volume form $Omega_t = e^(a_t) k^n$. The resulting Kähler form
  $ h_t = gamma_t + i partial accent(partial w, ‾)_t $
  satisfies
  #[#set math.equation(numbering: n => "(8.1)")
   $ h_t^n = e^(a_t + w_t) k^n . $ <eq:twisted-cma-volume>]
  Taking $- i partial macron(partial)$ of the logarithm of the ratio of the volume forms in Equation (8.1) shows, with our Ricci convention, that
  #[#set math.equation(numbering: n => "(8.2)")
   $ R_(h_t) = R_k - i partial macron(partial) \( a_t + w_t \) = - h_t + t k gt.eq - h_t . $ <eq:twisted-ricci-equation>]
  Proposition 19 therefore applies, with the same constant for every $t > 0$:
  $ integral_X h_t^n gt.eq c_(n \, D) integral_X k^n . $
  On the other hand $\[ h_t \] = alpha + t \[ k \]$, so closedness and Stokes’ theorem give
  $ integral_X h_t^n = integral_X \( alpha + t \[ k \] \)^n . $
  The expression on the right is a polynomial in $t$. Passing to its value at zero yields
  #[#set math.equation(numbering: n => "(8.3)")
   $ \( 2 pi \)^n integral_X c_1 \( K_X \)^n = integral_X alpha^n gt.eq c_(n \, D) integral_X k^n > 0 . $ <eq:positive-canonical-volume>]
  This passage uses only cohomology. No convergence of the metrics $h_t$, or uniform bounds on their potentials, is required. ◻
]

== 9 Bigness, projectivity, and ampleness <sec:ampleness>

At this point $K_X$ is nef and has positive top self-intersection. We first obtain enough sections to make $X$ Moishezon, then use its Kähler structure to obtain projectivity. Only after that step do we invoke the projective cone theorem to prove ampleness. We give the positivity argument in the form needed here, including the estimate that permits the use of holomorphic Morse inequalities. For a real curvature form $Theta$ of a smooth Hermitian line-bundle metric, let $X \( Theta \, lt.eq 1 \)$ denote the locus where $Theta$ is nondegenerate and has at most one negative eigenvalue. The number of negative eigenvalues is independent of the chosen background Hermitian metric.

Demailly’s strong holomorphic Morse inequalities #cite(label("Demailly1985")) Theorem 0.1 and Equation (0.7) imply the following criterion: on a compact complex manifold, if

#[#set math.equation(numbering: n => "(9.1)")
 $ integral_(X \( Theta \, lt.eq 1 \)) Theta^n > 0 \, $ <eq:morse-bigness-criterion>]

then the line bundle is big and the manifold is Moishezon #cite(label("Demailly1985")) Theorem 0.8(a). Here “big” means that the line bundle has Kodaira dimension $n$; equivalently its spaces of sections have growth of order $m^n$ along sufficiently divisible tensor powers. A compact complex manifold is Moishezon when its field of meromorphic functions has transcendence degree $n$.

#thm([Lemma 9.1.])[
  (Nefness and positive intersection imply bigness).  #emph[Let $L$ be a nef holomorphic line bundle on a compact connected Kähler manifold $\( X \, k \)$ of dimension $n gt.eq 1$. If $integral_X c_1 \( L \)^n > 0$, then $L$ is big and $X$ is Moishezon.]
] <lem:nef-big>

#proof[
  Put $beta = 2 pi c_1 \( L \)$ and $V = integral_X beta^n > 0$. For $0 < epsilon lt.eq 1$, choose a smooth metric on $L$ with real curvature $Theta_epsilon gt.eq - epsilon k$. Thus
  $ P_epsilon = Theta_epsilon + 2 epsilon k $
  is positive definite. At a point where $Theta_epsilon$ has a negative eigenvalue, write its eigenvalues relative to $k$ as $lambda_1 \, dots.h \, lambda_n$ and choose $j$ with $lambda_j < 0$. Then
  $ \| lambda_j \| lt.eq epsilon \, #h(2em) \| lambda_i \| lt.eq lambda_i + 2 epsilon quad \( i eq.not j \) . $
  Consequently
  $ lr(|product_(i = 1)^n lambda_i|) lt.eq epsilon product_(i eq.not j) \( lambda_i + 2 epsilon \) lt.eq epsilon sum_(j = 1)^n product_(i eq.not j) \( lambda_i + 2 epsilon \) . $
  In terms of volume forms this is
  #[#set math.equation(numbering: n => "(9.2)")
   $ \| Theta_epsilon^n \| lt.eq n epsilon thin P_epsilon^(n - 1) and k $ <eq:negative-index-mass>]
  on the entire locus with a negative eigenvalue. The right-hand side has integral
  $ n epsilon integral_X \( beta + 2 epsilon \[ k \] \)^(n - 1) and \[ k \] = O \( epsilon \) . $
  The implied constant is independent of the chosen metric: the remaining cohomological integral is a fixed polynomial in $epsilon$, bounded for $0 lt.eq epsilon lt.eq 1$.
  The degenerate locus contributes zero to $Theta_epsilon^n$. Removing the loci of index at least two from its total integral therefore changes that integral by at most $O \( epsilon \)$ in absolute value. Since $integral_X Theta_epsilon^n = V$, we obtain
  $ integral_(X \( Theta_epsilon \, lt.eq 1 \)) Theta_epsilon^n gt.eq V - O \( epsilon \) > 0 $
  for a sufficiently small fixed $epsilon$. The criterion in Equation (9.1) applies to this one smooth metric and proves the assertion. In dimension one the locus of index at least two is empty; the same argument, with $P_epsilon^0 = 1$, applies without modification. ◻
]

Apply Lemma 22 to $L = K_X$, using Proposition 18 and Proposition 21. We conclude that $K_X$ is big and $X$ is Moishezon. The following established projectivity theorem now applies.

#thm([Theorem 9.2.])[
  (Moishezon’s projectivity theorem).  #emph[A compact Moishezon manifold that admits a Kähler metric is projective.]
] <thm:moishezon-projectivity>

For a primary source proving a stronger form of this theorem, see Theorem 6 in the author’s preprint of #cite(label("Namikawa2002")): it permits Moishezon spaces with $1$-rational singularities. A smooth manifold satisfies that hypothesis. Thus $X$ is now a smooth projective variety, and we may apply the projective cone theorem.

The following standard implication is recorded in #cite(label("DiverioTrapani2019")) Lemma 2.1. We give the argument through an effective perturbation of the canonical divisor and the log cone theorem.

#thm([Proposition 9.3.])[
  (Bigness in the absence of rational curves).  #emph[Let $X$ be a smooth projective variety over $bb(C)$. If $K_X$ is big and $X$ contains no rational curves, then $K_X$ is ample.]
] <prop:no-rational-ample>

#proof[
  Kodaira’s lemma gives an integer $m > 0$, an ample Cartier divisor $H$, and an effective divisor $E$ such that
  #[#set math.equation(numbering: n => "(9.3)")
   $ m K_X tilde.op H + E . $ <eq:kodaira-decomposition>]
  For the needed form of this lemma, choose a smooth very ample hyperplane section $H$. Bigness gives $h^0 \( X \, m K_X \) gt.eq c m^n$ along sufficiently divisible powers, whereas the weak holomorphic Morse inequality gives $h^0 \( H \, m K_X \|_H \) = O \( m^(n - 1) \)$ #cite(label("Demailly1985")) Theorem 0.1(a). The restriction sequence therefore gives a nonzero section of $m K_X - H$ for some $m$, producing $E$. For $n = 1$, $H$ is a finite set and the same estimate is $O \( 1 \)$.
  Choose a sufficiently small positive rational number $eta$ so that $\( X \, eta E \)$ is Kawamata log terminal. This choice is possible even when $E$ is singular or nonreduced. Choose a log resolution $pi : Y arrow.r X$ of $\( X \, E \)$, whose existence follows from #cite(label("Kollar2007")) Theorem 35, and write
  $ K_Y - pi^(*) K_X = sum_i a_i F_i \, #h(2em) pi^(*) E = tilde(E) + sum_i b_i F_i \, $
  where $F_i$ are exceptional prime divisors and $tilde(E)$ is the strict transform with its multiplicities. The discrepancy criterion for a Kawamata log terminal pair is given in #cite(label("Fujino2011")) §4.4. The exceptional discrepancies have the form $a_i - eta b_i$, with $a_i gt.eq 0$ because $X$ is smooth and $b_i gt.eq 0$ because $E$ is effective. There are finitely many such coefficients. Taking $eta > 0$ sufficiently small keeps each discrepancy greater than $- 1$ and each strict-transform boundary coefficient less than one, which is the required condition.
  The log cone theorem says that a projective Kawamata log terminal pair $\( X \, Delta \)$ over $bb(C)$ with effective rational boundary has a rational curve of negative $\( K_X + Delta \)$-degree whenever $K_X + Delta$ is not nef. This follows, for example, from the cone decomposition and rational-curve assertion in #cite(label("Fujino2011")) Theorem 1.1, especially part (5); for a Kawamata log terminal pair the non-log-canonical locus in that statement is empty. The theorem has no restriction on the dimension.
  Since $X$ has no rational curves, it follows that
  $ N = K_X + eta E $
  is nef, in the numerical sense that its degree on every curve is nonnegative. Combining this with Equation (9.3) gives
  $ \( 1 + eta m \) K_X tilde.op_(bb(Q)) N + eta H . $
  The sum of a nef rational divisor and an ample rational divisor on a projective variety is ample by Kleiman’s ampleness criterion #cite(label("Fujino2011")) Definition 4.9 and Theorem 4.10: it is positive on every nonzero element of the closed cone of curves. Hence $\( 1 + eta m \) K_X$ is ample. Clearing the positive rational coefficient shows that a positive integral multiple of $K_X$ is ample, and therefore $K_X$ itself is ample. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 1.] A rational curve in $X$ would give a nonconstant holomorphic map $bb(P)^1 arrow.r X$ through its normalization. Its restriction to $bb(C) subset bb(P)^1$ would still be nonconstant, by the identity theorem. The hypothesis therefore excludes rational curves. We have proved that $X$ is projective and $K_X$ is big, so Proposition 24 proves that $K_X$ is ample. Equivalently, a sufficiently high positive tensor power of $K_X$ is very ample and its global holomorphic sections define a holomorphic embedding into projective space. This is the assertion in every positive complex dimension. ◻
]

== 10 Two consequences <sec:consequences>

We now combine canonical ampleness with two separate results. The first gives an explicit exponent for global generation of the pluricanonical bundles. The second describes a finite cover when the universal cover has an additional semialgebraic realization. Neither companion result is used in the proof of Theorem 1.

#thm([Corollary 10.1.])[
  (Pluricanonical freeness).  #emph[Let $X$ be a compact connected Brody-hyperbolic Kähler manifold of complex dimension $n gt.eq 1$. Then $K_X^(⊗ m)$ is generated by its global sections for every integer $m gt.eq n + 2$.]
] <cor:pluricanonical-freeness>

#proof[
  Theorem 1 makes $X$ smooth projective with $K_X$ ample. Apply Fujita freeness in its all-powers form #cite(label("OpenAIFujita2026")) Corollary 6.3 with $L = K_X$ and exponent $m - 1 gt.eq n + 1$; the resulting globally generated adjoint bundle is $K_X ⊗ L^(⊗ \( m - 1 \)) = K_X^(⊗ m)$. ◻
]

#thm([Corollary 10.2.])[
  (Finite-cover product).  #emph[Let $X$ be a compact connected Brody-hyperbolic Kähler manifold of positive complex dimension. Suppose its ordinary universal cover is biholomorphic to a semialgebraic open subset of a complex projective variety, with openness in the ordinary complex topology. Then $X$ admits a connected finite étale cover biholomorphic to 
$ \( D \/ Gamma_0 \) times F \, $

 where $D$ is a bounded symmetric domain, $Gamma_0$ is a discrete group of biholomorphisms acting freely, properly discontinuously and cocompactly on $D$, and $F$ is a simply connected compact Brody-hyperbolic projective manifold. Either $D$ or $F$ may be a point.]
] <cor:semialgebraic-product>

#proof[
  Theorem 1 makes $X$ projective. The semialgebraic-cover classification #cite(label("OpenAISemialgebraicCovers2026")) Theorem 1.1 gives $tilde(X) tilde.eq D times bb(C)^m times F$, with $F$ simply connected, normal and projective. Smoothness of this product forces $F$ to be smooth. Brody hyperbolicity passes to covers and factors, so $m = 0$ and $F$ is Brody hyperbolic. If $dim F > 0$, Theorem 1 makes $K_F$ ample, and Kobayashi’s finite-automorphism theorem #cite(label("Kobayashi1959")) Theorem, p. 184 shows that $"Aut" \( F \)$ is finite. This also holds when $F$ is a point.
  For a deck transformation of $D times F$, the first coordinate is constant on each compact connected fiber $F$. Applying the same observation to its inverse shows that its base map is an automorphism of $D$ and its fiber maps are automorphisms of $F$. Since $D$ is connected and $"Aut" \( F \)$ is finite, these fiber maps are independent of the base point. Thus the deck group $Gamma$ acts by products. The kernel $Gamma_0$ of its homomorphism to $"Aut" \( F \)$ has finite index and acts faithfully and freely on $D$. Proper discontinuity on $D$ follows by applying the deck-action property to $K times F$ for compact $K subset D$; in particular $Gamma_0$ is discrete. Hence $tilde(X) \/ Gamma_0 tilde.eq \( D \/ Gamma_0 \) times F$ is a connected finite unramified holomorphic cover of $X$, and therefore a finite étale cover of the projective manifold $X$. Its compactness implies that $D \/ Gamma_0$ is compact. ◻
]

== 11 Smoothing a bounded positive potential <app:smoothing>

We prove Lemma 17. The problem is to smooth a bounded potential while losing arbitrarily little positivity. Bounded plurisubharmonic functions need not be continuous, so uniform convergence of their regularizations is unavailable. Instead, we compare regularizations at fixed multiples of the same small radius. The comparison becomes uniformly small and permits gluing by a regularized maximum.

#thm([Lemma 11.1.])[
  (Fixed-factor changes of radius).  #emph[Let $psi$ be plurisubharmonic on a domain in $bb(C)^n$. Suppose that all closed balls $overline(B) \( x \, R \)$ with centers in a fixed set $E$ are contained in the domain, and that $m lt.eq psi lt.eq M$ on their union. Put 
$ S_x \( r \) = sup_(\| z - x \| lt.eq r) psi \( z \) \, #h(2em) 0 < r lt.eq R . $

 For every $A > 1$ and $A r < R$, 
#[#set math.equation(numbering: n => "(11.1)")
 $ 0 lt.eq S_x \( A r \) - S_x \( r \) lt.eq frac(\( M - m \) log A, log \( R \/ r \)) \, #h(2em) x in E . $ <eq:nef-radius-comparison>]

 For each sufficiently small fixed $r$, the function $x mapsto S_x \( r \)$ is plurisubharmonic on its open domain of definition.]
] <nef:radius-comparison>

#proof[
  First, $t mapsto S_x \( e^t \)$ is nondecreasing and convex. To see convexity, fix $0 < r_1 < r_2 lt.eq R$ and compare the restriction of $psi$ to each complex line through $x$ with the harmonic function on its annulus $r_1 < \| z - x \| < r_2$ that is affine in $log \| z - x \|$ and takes the constant values $S_x \( r_1 \)$ and $S_x \( r_2 \)$ on the boundary circles. The subharmonic maximum principle bounds $psi$ by this function on each annulus. On the inner ball the bound follows from the monotonicity of the interpolation. Taking the supremum over an intermediate ball proves convexity.
  Apply this convexity at the three logarithmic radii $log r$, $log r + log A$, and $log R$. It gives
  $ S_x \( A r \) - S_x \( r \) lt.eq frac(log A, log \( R \/ r \)) #scale(x: 120%, y: 120%)[\(] S_x \( R \) - S_x \( r \) #scale(x: 120%, y: 120%)[\)] \, $
  which implies Equation (11.1).
  For fixed $r$, the supremum over the closed translation ball is upper semicontinuous. Indeed, for a convergent sequence of centers, choose maximizing translation vectors and pass to a convergent subsequence in $overline(B) \( 0 \, r \)$; upper semicontinuity of $psi$ gives the required upper bound. It is also a locally bounded supremum of the plurisubharmonic translations $x mapsto psi \( x + zeta \)$, $\| zeta \| lt.eq r$. Its upper semicontinuity therefore makes it plurisubharmonic. ◻
]

#proof[
  #strong[Local potentials and regularization.] Choose finitely many coordinate patches $U_i$, smooth real functions $a_i$ with $alpha = i partial accent(partial a, ‾)_i$ on neighborhoods of $overline(U)_i$, and open sets
  $ V_i subset.double W_i subset.double U_i $
  such that the $V_i$ cover $M$. Such local potentials exist because $alpha$ is a smooth closed real $\( 1 \, 1 \)$-form. On overlaps, $a_i - a_j$ is pluriharmonic.
  The distributional positivity of $alpha + i partial accent(partial u, ‾)$ means that $a_i + u$ has a unique plurisubharmonic representative $psi_i$. These representatives are locally bounded: their almost-everywhere bounds follow from boundedness of $u$ and smoothness of $a_i$, and the submean inequality and upper semicontinuity extend these bounds to every point. Moreover,
  $ psi_i - psi_j = a_i - a_j $
  pointwise on overlaps, since the two plurisubharmonic functions $psi_i$ and $psi_j + a_i - a_j$ agree almost everywhere. Thus, after replacing $u$ on a set of measure zero, we may write $psi_i = a_i + u$ everywhere. The functions $psi_i$ are bounded above and below on $U_i$, with bounds uniform over the finite collection. The positive distances between the compact sets $overline(W)_i$ and the boundaries of $U_i$ allow all subsequent regularizations to be defined on neighborhoods of $overline(W)_i$.
  In the coordinates of $U_i$, let
  $ S_(i \, b) \( x \) = sup_(\| y - x \| lt.eq b) psi_i \( y \) . $
  Fix a smooth nonnegative kernel of integral one supported in the unit ball, and let $rho_(b \/ 4)$ be its rescaling to radius $b \/ 4$. For all sufficiently small $b > 0$, set
  $ phi_(i \, b) = S_(i \, b) * rho_(b \/ 4) $
  near $overline(W)_i$. Lemma 27 and convolution show that $phi_(i \, b)$ is smooth and plurisubharmonic. If $\| y - x \| lt.eq b \/ 4$, then
  $ B \( x \, b \/ 2 \) subset B \( y \, b \) subset B \( x \, 2 b \) . $
  Taking suprema and then averaging proves
  #[#set math.equation(numbering: n => "(11.2)")
   $ S_(i \, b \/ 2) \( x \) lt.eq phi_(i \, b) \( x \) lt.eq S_(i \, 2 b) \( x \) . $ <eq:nef-convolution-bounds>]
  ===== 11.1 Comparison on overlaps. <comparison-on-overlaps.>
  We next prove the uniform overlap comparison
  #[#set math.equation(numbering: n => "(11.3)")
   $ sup_(W_i ∩ W_j) lr(|\( phi_(i \, b) - a_i \) - \( phi_(j \, b) - a_j \)|) arrow.r 0 quad upright("as ") b arrow.b 0 . $ <eq:nef-overlap-comparison>]
  All coordinate changes and their inverses have bounded derivatives on neighborhoods of the compact overlap sets $overline(W)_i ∩ overline(W)_j$. After decreasing the allowed radius, coordinate balls centered on these overlaps are therefore comparable by fixed factors. Thus there are constants $c \, C > 0$, independent of the center and of $b$, such that an $i$-coordinate ball of radius $b$ contains the $j$-coordinate ball of radius $c b$ and is contained in the $j$-coordinate ball of radius $C b$. The balls in question lie in $U_i ∩ U_j$.
  The identity $psi_i - psi_j = a_i - a_j$ holds on this intersection, and the smooth function $a_i - a_j$ varies by $O \( b \)$ across any such ball, uniformly in the center. These facts, together with Equation (11.2), give constants $c_1 \, c_2 \, C_2 > 0$ for which
  $ S_(j \, c_1 b) \( x \) - a_j \( x \) - C_2 b lt.eq phi_(i \, b) \( x \) - a_i \( x \) lt.eq S_(j \, c_2 b) \( x \) - a_j \( x \) + C_2 b . $
  The analogous bounds for $phi_(j \, b) - a_j$ have radii $b \/ 2$ and $2 b$. Lemma 27, using a fixed radius available near each compact overlap, compares all four suprema. It bounds their differences by $O \( 1 \/ \| log b \| \)$. This proves Equation (11.3), in fact with an error bounded by $O \( 1 \/ \| log b \| \) + O \( b \)$. All constants can be chosen uniformly because there are only finitely many pairs of patches.
  ===== 11.2 Gluing the local functions. <gluing-the-local-functions.>
  Choose smooth functions $chi_i$ on neighborhoods of $overline(W)_i$ such that
  $ - 3 lt.eq chi_i lt.eq 0 \, #h(2em) chi_i = 0 upright(" on ") V_i \, #h(2em) chi_i = - 3 upright(" near ") partial W_i . $
  There is a fixed constant $C_0 gt.eq 0$ satisfying $i partial macron(partial) chi_i gt.eq - C_0 k$ for every $i$. Given $sigma > 0$, choose $b$ so small that every discrepancy in Equation (11.3) is less than $sigma$, and set on $W_i$
  $ f_i = phi_(i \, b) - a_i + sigma chi_i . $
  Here is a precise regularized maximum with the compatibility needed when the set of available patches changes. Fix a smooth even probability density $eta_sigma$ on $bb(R)$, supported in $\( - sigma \/ 4 \, sigma \/ 4 \)$. For each nonempty finite index set $I$ define
  $ cal(M)_I \( \( t_i \)_(i in I) \) = integral_(bb(R)^I) max_(i in I) \( t_i + s_i \) product_(i in I) eta_sigma \( s_i \) thin upright(d) s_i . $
  This is smooth, convex, nondecreasing in every argument, and satisfies
  #[#set math.equation(numbering: n => "(11.4)")
   $ cal(M)_I \( t + c upright(bold(1)) \) = cal(M)_I \( t \) + c . $ <eq:nef-max-translation>]
  If $t_i$ is more than $sigma \/ 2$ below the maximum of the other arguments, then it never attains the shifted maximum in the integrand. Its removal leaves exactly $cal(M)_(I \\ { i })$, because the unused probability density integrates to one.
  For $x in M$, put $I \( x \) = { i : x in W_i }$ and define
  $ u_sigma \( x \) = cal(M)_(I \( x \)) \( \( f_i \( x \) \)_(i in I \( x \)) \) . $
  This is globally smooth. To verify the only issue, fix $x_0 in partial W_i$ and choose $j$ with $x_0 in V_j$. On a neighborhood of $x_0$ within $W_i$, we have $chi_i = - 3$ and $chi_j = 0$, so the overlap comparison implies
  $ f_i < f_j - 2 sigma . $
  Thus branch $i$ is inactive throughout this neighborhood, including under all the allowed shifts. The exact deletion property just proved removes it from the formula before crossing $partial W_i$. There are finitely many indices, so this argument removes all indices whose patch boundaries pass through $x_0$, leaving a smooth formula on a neighborhood of $x_0$.
  ===== 11.3 The curvature estimate. <the-curvature-estimate.>
  Work near any point in a fixed coordinate patch with local potential $a_j$ for $alpha$. Each active branch has
  $ a_j + f_i = phi_(i \, b) + \( a_j - a_i \) + sigma chi_i . $
  The difference $a_j - a_i$ is pluriharmonic, since both functions are local potentials for $alpha$. Hence
  #[#set math.equation(numbering: n => "(11.5)")
   $ i partial macron(partial) \( a_j + f_i \) gt.eq - C_0 sigma k . $ <eq:nef-branch-curvature>]
  By Equation (11.4), $a_j + u_sigma$ is the regularized maximum of these branches. The first derivatives of $cal(M)_I$ are nonnegative and sum to one; its Hessian is positive semidefinite. The complex Hessian chain rule therefore expresses $i partial macron(partial) \( a_j + u_sigma \)$ as a convex combination of the branch Hessians plus a nonnegative $\( 1 \, 1 \)$-form. Equation (11.5) consequently gives
  $ alpha + i partial accent(partial u, ‾)_sigma = i partial macron(partial) \( a_j + u_sigma \) gt.eq - C_0 sigma k . $
  Choose $sigma > 0$ with $C_0 sigma lt.eq epsilon$, and rename this function $u_epsilon$. The resulting smooth closed form represents $\[ alpha \]$ and has the required lower bound. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
