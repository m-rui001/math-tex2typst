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

#align(center)[#text(size: 16pt, weight: "bold")[Symmetry of semialgebraic bounded domains \
with compact quotient]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A bounded symmetric domain is a bounded domain in a complex vector space with a holomorphic involution at every point for which that point is an isolated fixed point. Such domains are distinguished by their large automorphism groups. A compact quotient imposes a different kind of uniformity: every point can be moved into a fixed compact set, but the automorphism group need not be assumed transitive. We show that a semialgebraic realization converts this weaker uniformity into symmetry.

We regard an affine variety as a reduced complex algebraic set, and fix a closed algebraic embedding into some $bb(C)^N$. A subset is semialgebraic if it is given by a finite Boolean combination of polynomial equalities and inequalities in the real and imaginary coordinates. Boundedness is in this embedding. The open set below is open in the complex-space topology; it need not initially be a manifold.

#thm([Theorem 1.1.])[
  #emph[Let $U$ be a nonempty connected semialgebraic bounded open subset of a complex affine variety. Suppose that a group $Gamma$ of biholomorphisms acts properly discontinuously on $U$ and that $U \/ Gamma$ is compact. Then $U$ is smooth and is biholomorphic to a bounded symmetric domain.]
] <thm:main>

Proper discontinuity is understood as properness of the action when $Gamma$ has the discrete topology. Finite stabilizers are allowed. No smoothness or projectivity assumption is made on the quotient. We use the usual nonempty-domain convention; a connected zero-dimensional $U$ is a point and gives the zero-dimensional case of the theorem.

===== 1.1 The problem and its predecessors. <the-problem-and-its-predecessors.>

Kollár and Pardon posed the bounded semialgebraic affine-domain question in their study of algebraic varieties with semialgebraic universal covers [6] arXiv version 2, Question 25. Theorem 1 answers that question affirmatively. It concerns the geometry of the domain itself: the affine ambient variety may be singular, and the compact quotient may have finite quotient singularities. The semialgebraic hypothesis describes the domain in one affine embedding; it imposes no algebraicity requirement on the biholomorphisms in $Gamma$. This bounded-domain question is distinct from the broader universal-cover classification proposed in the same paper. The companion article [7] Theorem 1.1 establishes that classification for ordinary universal covers of connected normal projective complex varieties. The proof below is independent of that classification.

The question arises when one tries to pass from quasi-projective universal covers to semialgebraic ones. As Kollár and Pardon explain [6] arXiv version 2, Section 3, p. 13, when a free properly discontinuous action on a bounded open subset of a Stein manifold has compact quotient, that quotient is projective and its canonical bundle is ample. Consequently, the argument that excludes varieties of general type in the quasi-projective-cover setting does not extend to this case. The bounded-domain question asks what geometry replaces that exclusion.

Earlier rigidity theorems explain why boundary geometry is a natural way to approach the problem. Wong’s characterization of the ball and Rosay’s subsequent localization theorem show that a bounded domain with an automorphism orbit accumulating at a $C^2$ strongly pseudoconvex boundary point is biholomorphic to a ball [12,9]. Rosay’s argument uses a holomorphic peak function to force an entire sequence of automorphisms toward the same boundary point [9] Section 3, Lemma 2. The first step of our proof extends this localization mechanism to an open subset of a possibly singular, nonnormal affine variety. A polynomial factor first excludes the ambient singular locus, and bounded holomorphic functions on finite branched charts provide the compactness needed before smoothness has been established.

Frankel proved that a convex hyperbolic domain with compact quotient is biholomorphic to a bounded symmetric domain [3] Theorem 1. He also treated a broader condition on the boundary, called $h$-convexity [3] Theorem 2.6 and Definition 7.3. His proof relates compact-quotient rigidity to limits of rescaled automorphisms [3] Section 3. Although his initial theorem is stated for a free action, he explicitly removes that restriction later in the paper [3] p. 144, following Lemma 11.8. Thus finite stabilizers are part of the earlier rigidity picture as well. The issue here is to extract the appropriate model from semialgebraicity without assuming convexity or a boundary regularity condition. In the setting of a bounded domain covering a compact complex manifold, Zimmer proved that a $C^(1 \, 1)$ boundary already forces the domain to be a ball [13] Theorem 1.1. That regularity theorem and the present semialgebraic theorem apply under different hypotheses.

An important earlier rigidity theorem is due to Vey: a divisible generalized Siegel domain is symmetric [11] Theorem 1 and the following paragraph. This class was introduced by Kaup, Matsushima, and Ochiai, as Vey recalls at the start of his paper. Here divisibility means a properly discontinuous action with a compact covering set; it does not require a free action. The present problem is to reach a domain to which that theorem applies without assuming a regular boundary, convexity, or homogeneity. We do so by a rescaling construction and verify Vey’s hypotheses explicitly in Section 6.

Semialgebraicity provides finite geometric descriptions, but it does not make the relevant boundary a smooth hypersurface. Corners may have several complex-normal directions, and their normal fibers can shrink at rates that depend on the tangential parameters. The proof consequently uses compatible Nash cell decomposition and semialgebraic selection [2] Sections 1.1–1.2, followed by a parameter argument that keeps the tangential variables and the scale together. Analytic discs then turn a family of approaching interior graphs into balls with a definite size after dilation. This is the step that prevents the normal limit from collapsing.

===== 1.2 The boundary construction. <the-boundary-construction.>

In positive dimension, the essential intermediate result is a global equivalence, for integers $m gt.eq 0$ and $k gt.eq 1$ with $m + k = dim_(bb(C)) U$,

$ U tilde.eq { \( z \, w \) in bb(C)^m times bb(C)^k : "Im" w - H \( z \, z \) in C } \, $

where $C subset bb(R)^k$ is a nonempty connected open cone and $H : bb(C)^m times bb(C)^m arrow.r bb(C)^k$ is a vector of Hermitian forms. Independent real linear functionals on the normal variables are strictly positive on $C$ and give positive-definite scalar Hermitian forms after composition with $H$. The displayed domain is invariant under real translations of $w$, scalar unit rotations of $z$, and the weighted dilations $\( z \, w \) mapsto \( sqrt(r) thin z \, r w \)$, $r > 0$. The support inequalities give a bounded realization in $bb(C)^(m + k)$. Together with the transferred compact quotient, these are precisely the properties used in Vey’s theorem. They are conclusions of the construction.

Two features of that construction are useful beyond a smooth hypersurface setting. First, semialgebraicity supplies a boundary stratum at which normal-offset distance functions have limits jointly in the tangential parameter and the scale. A measure argument selects such a point together with enough independent holomorphic supports to control every complex-normal direction. Second, analytic discs produce interior slice balls whose radius is comparable to their distance from that point. This rules out collapse of the normal limit even when the boundary has higher real codimension. Both statements are formulated with the parameter uniformity needed for weighted rescaling.

===== 1.3 Proof outline. <proof-outline.>

Section 2 first removes the singularities of $U$. A polynomial-weighted maximum gives a peak at a smooth ambient point; cocompactness moves each point of $U$ into that smooth neighborhood. The same compact-covering property makes the intrinsic chain-of-discs distance proper and gives a continuity principle for analytic-disc deformations.

Section 3 constructs the supported boundary point and the joint normal-offset limits. Section 4 proves that the limiting interior contains an open cone. In Section 5, tangential dilation by $t^(- 1 \/ 2)$ and normal dilation by $t^(- 1)$ yield the quadratic model. The proof uses both interior and excluded-point convergence: normal-family limits of the maps and their inverses give a global biholomorphism, not merely an embedding into a candidate model. Section 6 then applies Vey’s theorem and completes the proof.

Figure 1 records where the two boundary inputs enter. The independent supports control the scaled automorphisms in every normal direction; the interior balls establish that there is a nonempty model to which their inverses can be applied. Both sides of the set convergence are then needed to identify the entire image of the limiting map.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 11.59cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#144b69"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Boundedness and cocompactness#linebreak()Smoothness of $U$; proper intrinsic distance; disc continuity]]])])
  content((0, -2.064), [#box(width: 11.59cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#144b69"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Semialgebraic boundary preparation#linebreak()Joint normal-offset limits at a point with independent peaks]]])])
  content((-0.35, -3.546), [#box(width: 5.294cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#144b69"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Independent peaks#linebreak()Control every scaled normal coordinate]]])], anchor: "north-east")
  content((0.35, -3.546), [#box(width: 5.294cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#144b69"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Regularized analytic discs#linebreak()Interior balls prevent collapse]]])], anchor: "north-west")
  content((0, -6.728), [#box(width: 11.59cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#144b69"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Two-sided weighted scaling#linebreak()Interior inclusion $+$ excluded points $arrow.r.double.long$ global equivalence]]])])
  content((0, -8.792), [#box(width: 11.59cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#144b69"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Quadratic model with a bounded realization and compact quotient#linebreak()Vey's theorem $arrow.r.double.long$ bounded symmetric domain]]])])
  line((0, -0.5819), (0, -1.482), stroke: (paint: rgb("#144b69"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#144b69"))))
  line((0, -2.646), (0, -2.946), (-2.997, -2.946), (-2.997, -3.546), stroke: (paint: rgb("#144b69"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#144b69"))))
  line((0, -2.646), (0, -2.946), (2.997, -2.946), (2.997, -3.546), stroke: (paint: rgb("#144b69"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#144b69"))))
  line((-2.997, -4.71), (-2.997, -5.01), (0, -5.01), (0, -6.146), stroke: (paint: rgb("#144b69"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#144b69"))))
  line((2.997, -4.71), (2.997, -5.01), (0, -5.01), (0, -6.146), stroke: (paint: rgb("#144b69"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#144b69"))))
  line((0, -7.31), (0, -8.21), stroke: (paint: rgb("#144b69"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#144b69"))))
})],
  caption: [Figure 1: The two boundary inputs have different roles. Peaks bound the forward scaling maps, while discs ensure a nonempty normal interior. The two-sided convergence then identifies the global quadratic model. ],
) <fig:proof>

== 2 Smoothness and a proper intrinsic distance <sec:geometry>

We first establish two consequences of boundedness and cocompactness that do not use semialgebraicity: the open set is smooth, and analytic discs cannot escape it during a deformation whose boundaries remain inside. These facts will allow us to work at the boundary without assuming its regularity. The peak-function localization has its classical predecessor in Rosay’s argument at a strictly pseudoconvex boundary point [9] Section 3, Lemma 2. Here a finite-projection argument allows the localization to begin before the open set is known to be smooth.

Embed the initial reduced affine variety in $bb(C)^N$ in coordinates in which $U$ is bounded. Its closure $overline(U)$ is compact. There is a compact set $K subset U$ such that $Gamma K = U$. Indeed, the quotient map is open, and the images of relatively compact open neighborhoods in $U$ cover $U \/ Gamma$; finitely many suffice. Their closures give $K$. This argument does not require the action to be free.

#thm([Lemma 2.1.])[
  #emph[Let $W$ be an open subset of a reduced complex affine algebraic set. The family of holomorphic functions $h$ on $W$ with $\| h \| lt.eq 1$ is locally equicontinuous. Every sequence in this family has a subsequence converging uniformly on compact subsets to a continuous function $h_oo$. If $h_oo \( q \) = 1$ at a point $q in W$, then $h_oo = 1$ in a neighborhood of $q$. In particular, if $W$ is connected, then $h_oo equiv 1$.]
] <lem:singular-montel>

#proof[
  We give the argument at a possibly singular and nonnormal point $q$. Work first on one irreducible algebraic component $V_0$ through $q$, of positive dimension $d$. Noether normalization [10] Lemma 10.115.4, Tag 00OY gives a finite algebraic map $pi : V_0 arrow.r bb(C)^d$. Translate so that $pi \( q \) = 0$. By properness and finiteness, we may restrict over a sufficiently small polydisc $B$ about $0$ and retain just the part $Omega$ near $q$, with
  $ pi : Omega arrow.r B quad upright("proper and finite") \, #h(2em) pi^(- 1) \( 0 \) ∩ Omega = { q } \, #h(2em) Omega subset W . $
  To make this restriction, take disjoint neighborhoods of the finitely many points over $0$ and shrink $B$ until its entire inverse image lies in their union. The part near $q$ is then both open and closed in that inverse image. Outside a proper algebraic hypersurface $E$ in $B$, the restricted map is a covering with a fixed number $r gt.eq 1$ of holomorphic sheets. This follows also directly from separability of the finite function-field extension: discard the denominators and discriminant of a primitive element.
  For $\| h \| lt.eq 1$, form the monic polynomial of its sheet values,
  $ P_h \( z \, T \) = product_(x in pi^(- 1) \( z \) ∩ Omega) \( T - h \( x \) \) = T^r + sum_(nu = 0)^(r - 1) a_(nu \, h) \( z \) T^nu \, #h(2em) z in B \\ E . $
  The coefficients are single-valued holomorphic functions bounded by constants depending only on $r$. They extend holomorphically across $E$ by the removable-singularity theorem for bounded holomorphic functions. One elementary proof uses a complex line through the point that is not contained in $E$, a small circle on that line missing $E$, and the Cauchy integral on nearby parallel circles. Properness and continuity of $h$ give
  $ P_h \( 0 \, T \) = \( T - h \( q \) \)^r . $
  The polynomial identity $P_h \( pi \( x \) \, h \( x \) \) = 0$ holds on all of $Omega$ by continuity, since the sheet locus is dense. Cauchy estimates for the uniformly bounded coefficients, on a smaller polydisc, therefore yield
  $ \| h \( x \) - h \( q \) \|^r = \| P_h \( 0 \, h \( x \) \) - P_h \( pi \( x \) \, h \( x \) \) \| lt.eq C parallel pi \( x \) parallel . $
  Here $C$ is independent of $h$. This proves equicontinuity at $q$ on $V_0$. There are only finitely many components through $q$; applying the argument to each proves the assertion on their union. A zero-dimensional component requires no argument. Local compactness, a countable compact exhaustion, and the Arzelà–Ascoli theorem now give compact convergence of a subsequence.
  For the maximum assertion, use the same chart and consider the sheet average
  $ b_h \( z \) = 1 / r sum_(x in pi^(- 1) \( z \) ∩ Omega) h \( x \) . $
  It extends holomorphically to $B$, satisfies $\| b_h \| lt.eq 1$, and has $b_h \( 0 \) = h \( q \)$. If $h_j arrow.r h_oo$ locally uniformly and $h_oo \( q \) = 1$, ordinary normal-family compactness on $B$ gives, after another extraction, a holomorphic limit of the sheet averages with value $1$ at $0$. The usual maximum principle makes that limit identically $1$. On every regular fiber, an average of numbers in the closed unit disc can equal $1$ only if every number equals $1$. Thus $h_oo = 1$ on the sheet locus near $q$, hence everywhere near $q$ by continuity. Apply this on every component through $q$. Finally, ${ h_oo = 1 }$ is both closed and open in $W$, which proves the connected case. No identification of weakly holomorphic functions with holomorphic functions on a nonnormal space was used. ◻
]

#thm([Proposition 2.2.])[
  #emph[If $U$ is not a point, then it is a complex manifold of positive dimension and lies in the smooth locus of a single irreducible component $V$ of the ambient variety.]
] <prop:smoothness>

#proof[
  Choose a positive-dimensional irreducible component $V_0$ whose smooth points not shared with another component meet $U$. Such a component exists: these points are dense in each positive-dimensional component, whereas a zero-dimensional irreducible component is isolated and cannot meet the connected nonsingleton $U$. There is a polynomial $P$ vanishing on the other components and on the singular locus of $V_0$, but not identically on $V_0$. In particular, $P$ is nonzero somewhere in $U$.
  Maximize $log \| P \( q \) \| + parallel q parallel^2$ on $overline(U)$, with value $- oo$ at zeros of $P$. A maximizer $p$ has $P \( p \) eq.not 0$, so it is a smooth, unshared point of $V_0$. It belongs to $partial U$: near such a point the function is strictly plurisubharmonic, and hence cannot have an interior maximum. The entire function
  $ h \( q \) = frac(P \( q \), P \( p \)) exp #scale(x: 120%, y: 120%)[\(] 2 overline(p) dot.op \( q - p \) #scale(x: 120%, y: 120%)[\)] $
  satisfies
  #[#set math.equation(numbering: n => "(2.1)")
   $ \| h \( q \) \| lt.eq exp #scale(x: 120%, y: 120%)[\(] - parallel q - p parallel^2 #scale(x: 120%, y: 120%)[\)] quad \( q in overline(U) \) \, #h(2em) h \( p \) = 1 . $ <eq:initial-peak>]
  Indeed, the logarithm of the left-hand side is at most $parallel p parallel^2 - parallel q parallel^2 + 2 "Re" \( overline(p) dot.op \( q - p \) \)$.
  Choose $q_j in U$ tending to $p$, and write $q_j = gamma_j k_j$ with $k_j in K$. After extraction, $k_j arrow.r k in K$, and Lemma 2 gives locally uniform convergence of $h compose gamma_j$. Equicontinuity at the moving points $k_j$ shows that the limit has value $1$ at $k$. It is therefore identically $1$ on $U$. Equation (2.1) implies that $gamma_j$ converges to $p$ uniformly on every compact subset of $U$.
  For each $q in U$, the point $gamma_j \( q \)$ eventually lies in a smooth ambient neighborhood of $p$. Since a biholomorphism preserves smoothness of the complex space, $q$ is smooth. A smooth point belongs to exactly one irreducible component of the ambient variety; the component is locally constant on $U$, and hence constant by connectedness. This gives $V$. ◻
]

The singleton is the zero-dimensional bounded symmetric domain, so henceforth we work on this irreducible $V$ and put $n = dim_(bb(C)) U gt.eq 1$.

We use Kobayashi’s intrinsic distance, defined through holomorphic disc chains [5] Section 2. Its contraction property is built into this definition; properness here will follow from cocompactness. Let $rho$ denote the Poincaré distance on the unit disc $bb(D)$. For $x \, y in U$, define $d_U \( x \, y \)$ as the infimum of

$ sum_(j = 1)^s rho \( alpha_j \, beta_j \) $

over finite chains of holomorphic maps $a_j : bb(D) arrow.r U$ with $a_1 \( alpha_1 \) = x$, $a_s \( beta_s \) = y$, and $a_j \( beta_j \) = a_(j + 1) \( alpha_(j + 1) \)$. By its definition, holomorphic maps decrease this chain-of-discs distance, and biholomorphisms preserve it.

#thm([Proposition 2.3.])[
  #emph[The function $d_U$ is a finite distance inducing the usual topology of $U$. Every closed $d_U$-ball is compact.]
] <prop:proper-distance>

#proof[
  Coordinate balls give finite disc chains locally, hence globally by connectedness. Bounded ambient coordinate functions and the Schwarz lemma give a constant $c > 0$ such that
  #[#set math.equation(numbering: n => "(2.2)")
   $ d_U \( x \, y \) gt.eq c parallel x - y parallel . $ <eq:distance-lower-bound>]
  For example, send each bounded coordinate to $bb(D)$; the Poincaré distance there dominates a constant times Euclidean distance, and sum along a chain. Conversely, small affine complex discs in a manifold chart give a local upper bound tending to zero with the coordinate separation. Thus $d_U$ is a distance and induces the original topology.
  Choose a relatively compact neighborhood of $K$ in $U$. Equation (2.2) and compactness of $K$ give an $r > 0$ for which every closed $r$-ball centered in $K$ lies in that neighborhood’s compact closure. Such a ball is closed in the original topology, hence compact. Translating by $Gamma$ shows that every closed $r$-ball in $U$ is compact, with the same $r$.
  We spell out why this uniform local statement implies properness. Fix $x$, and suppose $overline(B)_(d_U) \( x \, R \)$ is compact. Cover it by finitely many open $r \/ 4$-balls centered at $x_1 \, dots.h \, x_l$. For $d_U \( x \, y \) lt.eq R + r \/ 4$, choose a disc chain of total Poincaré length less than $d_U \( x \, y \) + r \/ 4$. Replace each disc link by a Poincaré geodesic segment. If the total length exceeds $R$, the point at accumulated length $R$ lies in $overline(B)_(d_U) \( x \, R \)$, and the remaining length is less than $r \/ 2$. Hence $y$ belongs to an $r$-ball centered at some $x_i$. If the total length is at most $R$, the same conclusion is immediate. Consequently
  $ overline(B)_(d_U) \( x \, R + r \/ 4 \) subset union.big_(i = 1)^l overline(B)_(d_U) \( x_i \, r \) . $
  The set on the left is closed and the union on the right is compact. Starting at $R = r$ and iterating proves compactness for every radius. ◻
]

#thm([Lemma 2.4.])[
  (Continuity principle).  #emph[Let $Omega$ be a smooth ambient coordinate neighborhood, and let $A : \[ 0 \, 1 \] times overline(bb(D)) arrow.r Omega$ be continuous, with each $A_t = A \( t \, dot.op \)$ holomorphic on $bb(D)$. Suppose 
$ A_t \( partial bb(D) \) subset U quad \( 0 lt.eq t lt.eq 1 \) \, #h(2em) A_0 \( overline(bb(D)) \) subset U . $

 Then $A_t \( overline(bb(D)) \) subset U$ for every $t$. In particular, this applies to continuous deformations of closed $C^1$ analytic discs; holomorphic extension through the boundary circle is not required.]
] <lem:continuity>

#proof[
  The set $T = { t : A_t \( overline(bb(D)) \) subset U }$ is relatively open in $\[ 0 \, 1 \]$ by compactness of the closed disc. To see that it is closed, let $t_j in T$ tend to $t_(*)$. The boundary condition and continuity give a fixed collar $1 - epsilon lt.eq \| zeta \| lt.eq 1$ whose images, for $t$ near $t_(*)$, lie in a compact set $L subset U$. Fix $zeta_0$ in the interior of this collar and $x_0 in U$. By Proposition 4, $M = max_(x in L) d_U \( x_0 \, x \)$ is finite. For each fixed $zeta in bb(D)$, the earlier discs take values in $U$, so Schwarz contraction gives
  $ d_U \( x_0 \, A_(t_j) \( zeta \) \) lt.eq M + rho \( zeta_0 \, zeta \) . $
  Properness places these values in a fixed compact subset of $U$. Their ambient limit $A_(t_(*)) \( zeta \)$ therefore belongs to $U$. The boundary already lies in $U$, so $t_(*) in T$. Since $T$ is nonempty, open, and closed in $\[ 0 \, 1 \]$, it is all of $\[ 0 \, 1 \]$. ◻
]

== 3 Boundary preparation and independent supports <sec:preparation>

We now work in the setting furnished by Proposition 3: $V subset bb(C)^N$ is irreducible of complex dimension $n gt.eq 1$, and $U subset V_(upright("reg"))$ is a domain. The purpose of this section is to choose a boundary point with two simultaneous properties. Its normal fibers have limits uniform in the tangential parameters, and it admits enough global holomorphic supports to control all complex-normal directions. Neither property is asserted for an arbitrary supported boundary point.

We use the elementary semialgebraic facts of cell decomposition, selection, and generic real analyticity. More precisely, a semialgebraic set admits a finite decomposition into connected real-analytic cells with algebraic analytic parametrizations; a choice in nonempty semialgebraic fibers can be made semialgebraically; and a semialgebraic function on an open set is algebraic analytic off a lower-dimensional set. For projection and real-analytic cell decomposition, see [2] Sections 1.1–1.2. These facts apply equally to descriptions using real quantifiers. Lower-dimensional exceptional sets have Lebesgue measure zero.

We first separate boundary cells that admit normal graph coordinates from those contained in a proper complex algebraic subset. The latter can be excluded from a maximizing construction by a polynomial factor.

#thm([Lemma 3.1.])[
  (Complex rank of a boundary cell).  #emph[Let $S$ be a connected real-analytic semialgebraic cell in $V_(upright("reg"))$. Either 
#[#set math.equation(numbering: n => "(3.1)")
 $ T_p S + i T_p S = T_p V $ <eq:generic-cell>]

 outside an intrinsic null set of $S$, or $S$ is contained in a proper complex algebraic subset of $V$.]
] <lem:rank-dichotomy>

#proof[
  Put $d = dim_(bb(R)) S$, and write the ambient complex coordinate functions of an algebraic analytic parametrization of $S$ as $q_1 \( s \) \, dots.h \, q_N \( s \)$, where $s = \( s_1 \, dots.h \, s_d \)$. Complexify the parameters. These germs belong to a common finite algebraic extension of $bb(C) \( s_1 \, dots.h \, s_d \)$. In characteristic zero, the dimension of the span of their differentials is
  $ "trdeg"_(bb(C)) bb(C) \( q_1 \, dots.h \, q_N \) . $
  Indeed, a transcendence basis among the $q_j$ has independent differentials, as seen by extending it to a transcendence basis of the ambient field; all remaining $q_j$ are separably algebraic over it and add no independent differentials. This number is also the generic complex rank of the complexified parametrization and the dimension of its complex Zariski closure. The latter lies in $V$.
  If the rank is less than $n$, a polynomial vanishing on that closure but not identically on $V$ vanishes on an open patch of $S$, hence on all of $S$ by real-analytic continuation. If the rank is $n$, its failure locus is defined locally by nontrivial analytic minors and has intrinsic measure zero. The complex image of the differential is exactly $T_p S + i T_p S$, which proves the alternative. ◻
]

Decompose $partial U ∩ V_(upright("reg"))$ into finitely many such cells. Every cell has positive real codimension, since the boundary of an open set has empty interior. On a cell satisfying Equation (3.1), write

$ k = 2 n - dim_(bb(R)) S \, #h(2em) m = n - k \, #h(2em) 1 lt.eq k lt.eq n . $

At a point satisfying Equation (3.1), choose semialgebraic holomorphic coordinates, obtained locally from a linear projection of $V$ followed by a complex-linear change, in which a patch of $S$ is

#[#set math.equation(numbering: n => "(3.2)")
 $ "Im" w_0 = phi.alt \( s \) \, #h(2em) s = \( z_0 \, "Re" w_0 \) in B \, #h(2em) \( z_0 \, w_0 \) in bb(C)^m times bb(C)^k . $ <eq:boundary-graph>]

Here $B$ is an open real parameter box and $phi.alt$ is real analytic and semialgebraic. This follows from the real implicit function theorem after putting the tangent space in the form ${ "Im" w_0 = 0 }$. Shrinking the patch ensures that its intersection with each fixed-$z_0$ slice is totally real in $bb(C)^k$.

Choose $rho > 0$ so that the points with $s in B$ and $\| v \| < rho$ below stay in the coordinate patch, and put

#[#set math.equation(numbering: n => "(3.3)")
 $ v & = "Im" w_0 - phi.alt \( s \) \, #h(2em) s = \( z_0 \, x_0 \) \, quad x_0 = "Re" w_0 \,\
A_s & = { v in bb(R)^k : \| v \| < rho \, med \( z_0 \, x_0 + i \( phi.alt \( s \) + v \) \) in U } . $ <eq:offset-fibers>]

Thus the $A_s$ are open semialgebraic fibers, and $0 in.not A_s$. The cutoff $rho$ will disappear under every bounded-coordinate scaling as $t arrow.b 0$.

We need two properties of these fibers at the same parameter: analytic families of offsets in $A_s$ approaching zero, and distance functions for the complements of $t^(- 1) A_s$ that stabilize as $s$ moves and $t$ tends to zero. The joint limit matters because later coordinate changes move the tangential parameter at the same time as the normal scale. The following parameter version of ramification supplies both properties outside a null set.

#thm([Lemma 3.2.])[
  (Ramification with parameters).  #emph[Let $B subset bb(R)^d$ be a semialgebraic open set and let $b : B times \( 0 \, t_0 \) arrow.r bb(R)$ be a bounded semialgebraic function. There is a null set $E subset B$ such that, for every $s_(*) in B \\ E$, there are a neighborhood $B_(*)$ of $s_(*)$, an integer $l gt.eq 1$, a number $epsilon > 0$, and a real-analytic function $tilde(b)$ on $B_(*) times \( - epsilon \, epsilon \)$ satisfying 
$ b \( s \, u^l \) = tilde(b) \( s \, u \) #h(2em) \( s in B_(*) \, med 0 < u < epsilon \) . $

 In particular, $b \( s \, t \)$ has a limit as $\( s \, t \) arrow.r \( s_(*) \, 0 \)$ with $t > 0$, without any restriction on the relative rates of approach.]
  #emph[Finitely many such functions can use a common ramification and neighborhood. For countably many functions there is a common full-measure set of good points, with the conclusion applied separately to each function; no common ramification or neighborhood is asserted.]
] <lem:ramified-parameters>

#proof[
  Use cylindrical decomposition with $s$ preceding $t$. Away from a lower-dimensional subset of $B$, the region immediately above $t = 0$ lies in a cell on which $b$ is an algebraic analytic branch. Locally at such an $s_(*)$, shrink to a rectangle $B_(*) times \( 0 \, epsilon_0 \)$ on which this holds. Choose a square-free polynomial equation
  $ R \( s \, t \, b \( s \, t \) \) = 0 $
  with polynomial coefficients in $\( s \, t \)$ and nonzero leading coefficient and discriminant in the last variable. Remove the zero sets of the first nonzero $t$-coefficients of these latter two polynomials. After shrinking again, each is a power of $t$ times a nonvanishing holomorphic function on a complex $s$-polydisc times a complex $t$-disc.
  For $t eq.not 0$ the roots therefore form a finite unramified covering of this product with the $t$-origin deleted. The $s$-polydisc is simply connected, so its monodromy is generated by one finite permutation around $t = 0$. The substitution $t = u^l$ kills this permutation for some $l$. The chosen branch becomes holomorphic for $u eq.not 0$. The polynomial root bound, applied after division by the leading coefficient, bounds this branch by $C \| u \|^(- M)$ on a smaller complex polydisc, for some finite $M$. Thus it has at worst a pole at $u = 0$, whose negative Laurent coefficients are holomorphic in $s$. Boundedness of the original function for real $s$ and positive $u$ makes those coefficients vanish for every real $s$ in the rectangle. They vanish identically by holomorphic uniqueness. The branch consequently extends holomorphically through $u = 0$, giving the stated real-analytic extension.
  There are only finitely many decomposition branches and exceptional polynomial zero sets. This proves the assertion outside a null set. For finitely many functions take a common multiple of their exponents and shrink the neighborhoods. For countably many, discard the union of their exceptional null sets; the individual conclusions suffice. ◻
]

#thm([Proposition 3.3.])[
  (Generic boundary data).  #emph[In the coordinates of Equation (3.2), almost every $s_(*) in B$ has the following two properties.]
  + #emph[There are a neighborhood $B_(*) subset B$ of $s_(*)$, a number $epsilon > 0$, and a real-analytic map $psi : B_(*) times \( - epsilon \, epsilon \) arrow.r bb(R)^k$ such that 
$ psi \( s \, 0 \) = 0 \, #h(2em) psi \( s \, u \) in A_s quad \( s in B_(*) \, med 0 < u < epsilon \) . $

]
  + #emph[Set 
$ E \( s \, t \) = bb(R)^k \\ t^(- 1) A_s \, #h(2em) d \( s \, t \; v \) = min { 1 \, "dist" \( v \, E \( s \, t \) \) } . $

 There is a $1$-Lipschitz function $d_(*) : bb(R)^k arrow.r \[ 0 \, 1 \]$ such that, for every compact $L subset bb(R)^k$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ lim_(s arrow.r s_(*)\
t arrow.b 0) sup_(v in L) \| d \( s \, t \; v \) - d_(*) \( v \) \| = 0 . $ <eq:joint-offset-limit>]

 The set $F = { v : d_(*) \( v \) = 0 }$ is a closed cone, invariant under every positive real dilation, and $0 in F$.]
  #emph[In particular, for every sequence $s_j arrow.r s_(*)$, $t_j arrow.b 0$, and $v_j arrow.r v$, one has $d \( s_j \, t_j \; v_j \) arrow.r d_(*) \( v \)$. If $v in F$, then 
$ "dist" \( v_j \, E \( s_j \, t_j \) \) arrow.r 0 . $

 If $v in.not F$, some fixed ball about $v$ is contained in $t_j^(- 1) A_(s_j)$ for all sufficiently large $j$.]
] <prop:boundary-data>

#proof[
  The function
  $ a \( s \) = min { 1 \, "dist" \( 0 \, A_s \) } \, $
  with value $1$ for an empty fiber, is semialgebraic and continuous on an open full-measure subset $B' subset B$. It is zero there. In fact, if $a \( s_0 \) > 0$ at a continuity point, it is bounded below near $s_0$; but the boundary point with parameters $\( s_0 \, 0 \)$ is a limit of points of $U$, whose parameters $\( s_j \, v_j \)$ satisfy $s_j arrow.r s_0$ and $v_j arrow.r 0$. This is a contradiction.
  On $B' times \( 0 \, t_0 \)$ semialgebraic selection therefore supplies $v \( s \, t \) in A_s$ with $\| v \( s \, t \) \| < t$. Apply Lemma 7 to its finitely many coordinates. At almost every $s_(*)$ this gives a jointly analytic $psi \( s \, u \) = v \( s \, u^l \)$. The bound $\| psi \( s \, u \) \| < u^l$ proves $psi \( s \, 0 \) = 0$ for every $s$ in its neighborhood. This proves (i).
  For (ii), apply Lemma 7 separately to $d \( s \, t \; v \)$ for every $v in bb(Q)^k$. Their exceptional sets have a null union. At a remaining $s_(*)$, each rational test has a limit along every joint approach $\( s \, t \) arrow.r \( s_(*) \, 0 \)$, $t > 0$. For every $s \, t$,
  $ \| d \( s \, t \; v \) - d \( s \, t \; v' \) \| lt.eq \| v - v' \| . $
  The rational limits therefore extend uniquely to a $1$-Lipschitz function $d_(*)$ on $bb(R)^k$. A finite rational net in a compact set, together with this inequality, proves Equation (3.4). Notice that this argument uses only finitely many test neighborhoods at a time; it does not require a common neighborhood for all rational tests.
  The zero set $F$ is closed and contains $0$, since $0 in E \( s \, t \)$. For $c > 0$ the exact identity
  $ E \( s \, c t \) = c^(- 1) E \( s \, t \) $
  shows, on taking $s = s_(*)$ and $t arrow.b 0$, that the distance from $v$ to the left-hand side tends to zero if and only if the distance from $c v$ to $E \( s_(*) \, t \)$ does. Truncation at $1$ does not affect vanishing of a limit. Consequently $v in F$ if and only if $c v in F$.
  The assertion for moving vectors follows from the same Lipschitz inequality. If $d_(*) \( v \) = 0$, convergence of the truncated distance to zero is convergence of the untruncated distance to zero. If $d_(*) \( v \) > 0$, the distance of $v$ from $E \( s_j \, t_j \)$ is eventually at least $d_(*) \( v \) \/ 2$, so any smaller fixed ball is in the scaled interior. ◻
]

Using countably many patches of the form Equation (3.2), we obtain an intrinsic full-measure set of points on every cell in the first alternative of Lemma 6, each with the data of Proposition 8. Call these points #emph[good]. The cone $F$ at a good point might still equal all of $bb(R)^k$; Proposition 11 will rule this out. We first choose a good point carrying independent supports.

#thm([Proposition 3.4.])[
  (A good supported point).  #emph[There are a boundary cell $S$ in the first alternative of Lemma 6, a good point $p in S$, and $k = 2 n - dim_(bb(R)) S$ entire functions $h_1 \, dots.h \, h_k$ on $bb(C)^N$ such that 
#[#set math.equation(numbering: n => "(3.5)")
 $ h_j \( p \) = 1 \, #h(2em) \| h_j \( q \) \| lt.eq exp \( - \| q - p \|^2 \) quad \( q in overline(U) \) \, #h(2em) 1 lt.eq j lt.eq k . $ <eq:peak>]

 The real covectors 
$ d log \| h_j \|\|_(T_p V) $

 are linearly independent and annihilate $T_p S$. Consequently, in coordinates $\( z \, w \) in bb(C)^(n - k) times bb(C)^k$ centered at $p$ with $T_p S = { "Im" w = 0 }$, their holomorphic logarithmic differentials have the form 
$ d log h_j \( p \) = i beta_j thin d w \, $

 where the $beta_j$ are linearly independent real rows.]
] <prop:supported-point>

#proof[
  We vary the real linear term in the weighted maximum used in the smoothness proof. We seek one good point at which the maximum is attained for a positive-measure set of linear terms, measured within the set of all terms making that point critical on its boundary cell. The corresponding conormals will provide $k$ independent supports.
  Choose a polynomial $P$ vanishing on $V_(upright("sing"))$ and on the proper complex algebraic subsets containing all cells in the second alternative of Lemma 6, but not identically on $V$. Such a polynomial exists because the union is finite and $V$ is irreducible. For $a in bb(C)^N$, maximize on the compact set $overline(U)$ the upper-semicontinuous function
  $ Phi_a \( q \) = log \| P \( q \) \| + \| q \|^2 + "Re" \( a dot.op q \) \, $
  with value $- oo$ where $P = 0$. Its maximum $M \( a \)$ is finite, because $P$ is not identically zero on the open set $U$. Every maximizer has $P eq.not 0$, lies in $V_(upright("reg"))$, and belongs to $partial U$: on the smooth locus with $P eq.not 0$, strict plurisubharmonicity forbids an interior maximum. Thus every maximizer lies on a retained boundary cell.
  Fix one retained cell $S$, of real dimension $d$, and restrict to $S^compose = S ∩ { P eq.not 0 }$. Its critical-pair space is
  $ cal(E)_S = { \( p \, a \) in S^compose times bb(C)^N : d \( Phi_a \|_S \)_p = 0 } . $
  Ambient real linear functionals restrict onto $T_p^(*) S$, so these are $d$ independent real affine equations on the $2 N$ real coordinates of $a$. Therefore $cal(E)_S arrow.r S^compose$ is a smooth affine bundle with fiber dimension $2 N - d$ and total dimension $2 N$.
  The subset $cal(M)_S subset cal(E)_S$ of actual maximizers is Borel. Indeed, $M \( a \)$ is Lipschitz in $a$, since
  $ \| M \( a \) - M \( a' \) \| lt.eq #scale(x: 120%, y: 120%)[\(] sup_(q in overline(U)) \| q \| #scale(x: 120%, y: 120%)[\)] \| a - a' \| \, $
  and $cal(M)_S$ is defined by the continuous equality $Phi_a \( p \) = M \( a \)$ on $cal(E)_S$. Projection $cal(E)_S arrow.r bb(C)^N$ is a smooth map between manifolds of the same real dimension and sends null sets to null sets: in countably many relatively compact coordinate charts it is Lipschitz. Its restrictions to the finitely many sets $cal(M)_S$ cover all of $bb(C)^N$. Hence at least one $cal(M)_S$ has positive measure in $cal(E)_S$.
  In local bundle coordinates, the points lying over the nongood null subset of $S$ form a null set, by Fubini. Applying Fubini again to $cal(M)_S$, in countably many bounded bundle charts, gives a good point $p$ for which the set of actual maximizing parameters in the critical fiber has positive $\( 2 N - d \)$-dimensional measure. Fix this $p$ and write that subset as $cal(A)_p$.
  Each $a in cal(A)_p$ supplies the entire function
  $ h_a \( q \) = frac(P \( q \), P \( p \)) exp #scale(x: 120%, y: 120%)[\(] \( 2 overline(p) + a \) dot.op \( q - p \) #scale(x: 120%, y: 120%)[\)] . $
  The inequality $Phi_a \( q \) lt.eq Phi_a \( p \)$ gives
  $ log \| h_a \( q \) \| lt.eq \| p \|^2 - \| q \|^2 + 2 "Re" #scale(x: 120%, y: 120%)[\(] overline(p) dot.op \( q - p \) #scale(x: 120%, y: 120%)[\)] = - \| q - p \|^2 \, $
  with the desired modulus inequality also at $P \( q \) = 0$.
  The affine map from the full critical fiber to the conormal space
  $ a mapsto d log \| h_a \|\|_(T_p V) in N_p^(*) S := { lambda in T_p^(*) V : lambda \|_(T_p S) = 0 } $
  is surjective. Indeed, on $T_p V$,
  $ d log \| h_a \|_p = d \( log \| P \| + \| q \|^2 \)_p + "Re" \( a dot.op d q \) . $
  For any $lambda in N_p^(*) S$, extend $lambda - d \( log \| P \| + \| q \|^2 \)_p$ to an ambient real linear functional $"Re" \( a dot.op d q \)$. The resulting total differential is $lambda$, so its restriction to $T_p S$ vanishes and $a$ belongs to the critical fiber. Since $dim_(bb(R)) N_p^(*) S = k$, the inverse image of any proper linear subspace of $N_p^(*) S$ has measure zero in the critical fiber. The positive-measure set $cal(A)_p$ cannot be contained in such an inverse image. Selecting successively outside the span already chosen gives $k$ independent conormals and corresponding functions $h_1 \, dots.h \, h_k$.
  Finally choose the local branches of $log h_j$ with value zero at $p$. Their real differentials vanish on $bb(C)^(n - k) times bb(R)^k = T_p S$. Complex linearity forces the $d z$ coefficients to be zero and the $d w$ coefficients to be purely imaginary. Independence of the real conormals is exactly independence of the resulting real rows $beta_j$. ◻
]

Fix the resulting $p$, its chart $\( z_0 \, w_0 \)$, the data $s_(*) \, psi \, F$ of Proposition 8, and the support functions for the rest of the proof.

== 4 An open cone of limiting interior <sec:noncollapse>

The excluded cone supplied by Proposition 8 could, at this stage, be all of $bb(R)^k$. We rule this out by constructing actual interior balls whose radii are comparable to their distance from the chosen boundary point. The analytic interior graphs and the continuity principle are the essential inputs; the supporting functions will enter only in the next section. The construction uses the analytic-disc method introduced by Bishop [1]. In particular, the nonlinear boundary equation expresses the real part in terms of the imaginary part through harmonic conjugation; see Hill–Taiani [4] Section 2, Equation (2.1) and Proposition 2.1, pp. 330–331 for its classical formulation. We prove here the parameter estimates and the regularization needed to obtain included balls from the approaching graphs.

We first isolate the analytic-disc construction. All balls in this section are Euclidean balls, with the real or complex ambient space indicated by their centers. In the application, we fix a complex-normal slice through the chosen boundary point and straighten its totally real boundary graph. The approaching interior graphs then satisfy the hypotheses of the lemma below. A ball in this slice will give a ball in a normal-offset fiber, which the joint limits of Section 3 can detect.

#thm([Lemma 4.1.])[
  (Interior balls from approaching graphs).  #emph[Let $Omega$ be open in a neighborhood of $0 in bb(C)^k$. Assume that the continuity principle of Lemma 5 holds for continuous deformations of closed analytic discs contained in that neighborhood. Suppose that $f \( X \, u \)$ is an $bb(R)^k$-valued real-analytic function for real $X$ near $0$ and real $u$ near $0$, that $f \( X \, 0 \) = 0$, and that 
$ X + i f \( X \, u \) in Omega #h(2em) upright("for all such ") X upright(" and all sufficiently small ") u > 0 upright(".") $

 Then there are constants $c \, C \, t_0 > 0$ and points $a_t in bb(C)^k$, for $0 < t < t_0$, such that 
#[#set math.equation(numbering: n => "(4.1)")
 $ \| a_t \| lt.eq C t \, #h(2em) B \( a_t \, c t \) subset Omega . $ <eq:disc-balls>]

 The discs used to obtain these balls stay in an arbitrarily small fixed neighborhood of $0$ after the graph neighborhood is restricted.]
] <lem:disc-family>

#proof[
  Write $f_u \( X \) = f \( X \, u \)$. Choose nonnegative smooth functions $lambda_0$ and $eta$ on the unit circle, both zero on a fixed arc about $1$, with $eta equiv.not 0$ and
  $ "supp" eta subset.double { lambda_0 > 0 } . $
  Set $lambda = alpha lambda_0$, where the positive constant $alpha$ will be fixed sufficiently small. For parameters $b \, e in bb(R)^k$ and $delta gt.eq 0$, we seek a holomorphic disc $A_(b \, e \, delta)$ whose boundary values $X + i Y$ satisfy
  #[#set math.equation(numbering: n => "(4.2)")
   $ X \( 0 \) = b \, #h(2em) Y \( theta \) = f_(lambda \( theta \) + delta) \( X \( theta \) \) + eta \( theta \) e . $ <eq:disc-boundary>]
  Here $X \( 0 \)$ means the value at the boundary angle $theta = 0$, not the value at the center of the disc.
  The parameters $b$ and $e$ have different geometric roles. When $delta = 0$, the boundary arc about $1$ maps into $bb(R)^k$, with endpoint $A_(b \, e \, 0) \( 1 \) = b$. Varying $b$ moves that endpoint in the real directions; the perturbation $eta e$, supported away from $1$, will change the inward radial derivative in all imaginary directions. For $B in bb(R)^k$, evaluation at $1 - t$ with $b = t B$ will therefore give independent displacements of order $t$ in all $2 k$ real directions. We first prove this derivative assertion and then use a positive $delta$ to put the evaluated discs inside $Omega$.
  ===== 4.1 Solving the boundary equation. <solving-the-boundary-equation.>
  Let $cal(H) = H^2 \( S^1 \, bb(R)^k \)$ be the real Sobolev space of functions with two square-integrable derivatives. The Fourier-series estimate
  $ sum_(j in bb(Z)) frac(j^2, \( 1 + j^2 \)^2) < oo $
  gives the continuous embedding $cal(H) arrow.r.hook C^1 \( S^1 \)$. This space is a Banach algebra under multiplication. Let $T$ be the bounded conjugation operator which recovers the real part of a holomorphic boundary value from its imaginary part, with real part of mean zero, and put
  $ cal(T) Y = T Y - \( T Y \) \( 0 \) . $
  Thus $cal(T)$ is bounded on $cal(H)$, and Equation (4.2) is equivalent to
  #[#set math.equation(numbering: n => "(4.3)")
   $ X = b + cal(T) #scale(x: 120%, y: 120%)[\(] f_(lambda + delta) \( X \) + eta e #scale(x: 120%, y: 120%)[\)] . $ <eq:disc-contraction>]
  Here is the smallness needed for contraction. The identity $f \( X \, 0 \) = 0$ gives a real-analytic factorization $f \( X \, u \) = u tilde(f) \( X \, u \)$. On a fixed small $cal(H)$-ball of functions $X$, the product rule through two derivatives, the embedding into $C^1$, and bounded derivatives of $tilde(f)$ give
  #[#set math.equation(numbering: n => "(4.4)")
   $ parallel f_(lambda + delta) \( X \) parallel_(cal(H)) + parallel D_X \[ f_(lambda + delta) \( X \) \] parallel_(cal(L) \( cal(H) \)) lt.eq C_0 \( alpha + \| delta \| \) . $ <eq:disc-composition-bound>]
  For example, both expressions contain the factor $lambda + delta$; derivatives falling on that factor are also $O \( alpha + \| delta \| \)$. The remaining composition and multiplication operators are uniformly bounded on the chosen ball. For all sufficiently small $alpha$ and $\| delta \|$, the Lipschitz constant in Equation (4.3) is less than $1 \/ 2$. On common sufficiently small $b \, e$ neighborhoods, its right side maps the chosen ball into itself. The contraction theorem gives a unique solution $X$.
  Smooth composition on $H^2$, or its direct proof by the same product estimates, shows that this equation is smooth in $X \, b \, e \, delta$. Its $X$-linearization is the identity minus an operator of norm less than $1 \/ 2$. The implicit function theorem therefore gives smooth parameter dependence in $cal(H)$. In particular $partial_e X$ is uniformly bounded as $alpha$ decreases; it need not be small. The boundary function $X + i Y$ extends holomorphically to the disc and continuously to its closure. All these conclusions hold also with $lambda$ replaced by $rho lambda$, $0 lt.eq rho lt.eq 1$. Shrinking the fixed $cal(H)$-ball keeps every disc in the prescribed coordinate neighborhood, by the boundary bound and the maximum principle.
  ===== 4.2 The limiting radial derivative. <the-limiting-radial-derivative.>
  For $delta = 0$, the function $Y$ vanishes on the fixed arc about $theta = 0$. Hence $A_(b \, e \, 0) \( 1 \) = b$, and reflection across that arc shows that the radial derivative there is purely imaginary. More explicitly, with $Y = Y_(b \, e \, 0)$, the Schwarz integral gives, near $zeta = 1$,
  $ A_(b \, e \, 0) \( zeta \) - b = frac(i, 2 pi) integral_(- pi)^pi (frac(e^(i theta) + zeta, e^(i theta) - zeta) - frac(e^(i theta) + 1, e^(i theta) - 1)) Y \( theta \) thin d theta . $
  There is no singularity on the support of $Y$. Expanding the kernel at $zeta = 1$ gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ A_(b \, e \, 0) \( 1 - t \) & = b + i t D \( b \, e \) + O \( t^2 \) \,\
D \( b \, e \) & = frac(1, 2 pi) integral_(- pi)^pi frac(2 Y_(b \, e \, 0) \( theta \), \| 1 - e^(i theta) \|^2) thin d theta . $ <eq:disc-radial>]
  The remainder is uniform with its first derivatives in $b \, e$ on a fixed smaller parameter neighborhood. This follows from the same integral formula and the smooth $cal(H)$-dependence proved above.
  Differentiating Equation (4.5) in $e$ gives
  $ partial_e D \( b \, e \) = c_eta I + R_alpha \( b \, e \) \, #h(2em) c_eta = frac(1, 2 pi) integral_(- pi)^pi frac(2 eta \( theta \), \| 1 - e^(i theta) \|^2) thin d theta > 0 . $
  The remainder contains $partial_X f_(lambda \( theta \)) \( X \) partial_e X$. The first factor is $O \( alpha \)$ and the second is uniformly bounded. Their product vanishes on the arc where $lambda = 0$, so the integral has a uniformly bounded kernel on its support. Thus $parallel R_alpha parallel lt.eq C_1 alpha$. The positive constant $c_eta$ is independent of $alpha$. Fix $alpha$ sufficiently small that $partial_e D \( 0 \, 0 \)$ is invertible, and only then fix the smaller $b \, e \, delta$ parameter neighborhoods ensuring all the conclusions above.
  ===== 4.3 Interior discs for positive regularization. <interior-discs-for-positive-regularization.>
  For this fixed positive $alpha$, on $"supp" eta$ the function $lambda$ has a positive minimum. As $X$ ranges in a fixed smaller closed real ball compactly contained in the graph chart, $theta$ ranges in this support, and $delta$ ranges in a sufficiently small closed interval $\[ 0 \, delta_0 \]$, the points
  $ X + i f_(lambda \( theta \) + delta) \( X \) $
  form a compact subset of $Omega$. Consequently, after reducing the allowed size of $e$, their displacements by $i eta \( theta \) e$ still belong to $Omega$, uniformly for $0 lt.eq delta lt.eq delta_0$. Outside this support there is no displacement. Thus for every $delta > 0$ all boundary values in Equation (4.2) are in $Omega$.
  For a fixed $delta > 0$, set $e = 0$ and increase $rho$ from $0$ to $1$ in $rho lambda$. At $rho = 0$ the solution is the constant disc $b + i f_delta \( b \)$. All boundary values during this deformation lie on interior graphs, so the continuity principle puts every disc in $Omega$. Next increase the displacement from $0$ to $e$, now with $lambda$ fixed. The same principle applies by the preceding compact interior bound. We have proved
  #[#set math.equation(numbering: n => "(4.6)")
   $ A_(b \, e \, delta) \( overline(bb(D)) \) subset Omega #h(2em) \( delta > 0 \) . $ <eq:positive-discs>]
  No inclusion is claimed for $delta = 0$. The final radius allowed for $e$ may depend on the fixed $alpha$. No uniform lower bound as $alpha arrow.b 0$ is needed: the included-ball constants below are fixed only after these choices.
  ===== 4.4 Interior balls. <interior-balls.>
  For real parameters $\( B \, e \)$ in a fixed small ball in $bb(R)^(2 k)$, define
  $ Psi_t^0 \( B \, e \) = t^(- 1) A_(t B \, e \, 0) \( 1 - t \) . $
  Equation (4.5) gives convergence in $C^1$ on that ball:
  #[#set math.equation(numbering: n => "(4.7)")
   $ Psi_t^0 \( B \, e \) arrow.r Psi_0 \( B \, e \) := B + i D \( 0 \, e \) . $ <eq:disc-scaled-limit>]
  The real differential $J = D Psi_0 \( 0 \, 0 \)$ is invertible. Smooth parameter dependence and bounded evaluation on the closed disc also give, on a fixed compact parameter set,
  $ parallel A_(b \, e \, delta) - A_(b \, e \, 0) parallel_(C^1 \( \( b \, e \) \; thin C^0 \( overline(bb(D)) \) \)) lt.eq C_2 delta . $
  Indeed, integrate the uniformly bounded derivatives $partial_delta A$, $partial_b partial_delta A$, and $partial_e partial_delta A$ over $\[ 0 \, delta \]$; their bounds in $H^2$ control the displayed norm. We may therefore take the explicit positive regularization $delta \( t \) = t^2$ for sufficiently small $t$. The maps
  $ Psi_t \( B \, e \) = t^(- 1) A_(t B \, e \, t^2) \( 1 - t \) $
  differ from $Psi_t^0$ by $O \( t \)$ in $C^1$: the value and $e$-derivative errors are $O \( delta \/ t \)$, while the $B$-derivative error is $O \( delta \)$. They therefore satisfy the same limit in Equation (4.7). By Equation (4.6), their images lie in $t^(- 1) Omega$.
  For completeness, this $C^1$ convergence gives included balls, not merely interior limit points. Choose a closed parameter ball $overline(B) \( 0 \, r \)$ so small that $parallel J^(- 1) \( D Psi_0 - J \) parallel < 1 \/ 4$ there. For small $t$ the corresponding bound for $Psi_t$ is less than $1 \/ 2$. If
  $ \| y - Psi_t \( 0 \) \| < frac(r, 2 parallel J^(- 1) parallel) \, $
  the map $x mapsto x - J^(- 1) \( Psi_t \( x \) - y \)$ is a contraction of $overline(B) \( 0 \, r \)$ into itself. Its fixed point proves that $y$ is in the image of $Psi_t$. These images thus contain balls of one fixed positive radius, centered at the bounded points $Psi_t \( 0 \)$. Multiplication by $t$ proves Equation (4.1). ◻
]

#thm([Proposition 4.2.])[
  (Noncollapse).  #emph[At the point selected in Proposition 9, the excluded cone in Proposition 8 satisfies $F eq.not bb(R)^k$.]
] <prop:noncollapse>

#proof[
  Keep the old coordinates $\( z_0 \, w_0 \)$ and fix the complex slice $z_0 = z_0 \( p \)$. The graph of $S$ in this slice is totally real and real analytic. Its parametrization by $"Re" w_0$ therefore has invertible complexified derivative, and its complexification provides a local biholomorphic change of coordinates sending this graph to $bb(R)^k$ and $p$ to $0$.
  Restrict the analytic interior graphs from Proposition 8 to this slice. In the new coordinates their real-part projection is the identity at $u = 0$. The real-analytic implicit function theorem consequently writes them, on a common neighborhood, as
  $ X + i f_u \( X \) \, #h(2em) f_0 \( X \) = 0 . $
  The identity at $u = 0$ holds for every $X$ in this neighborhood, not just for $X = 0$. For $u > 0$ these graphs lie in the slice of $U$. The continuity principle in the ambient smooth chart applies to discs in this fixed slice, and is unchanged by its biholomorphic coordinate change. Lemma 10 now gives slice balls of radii $c t$ with centers $O \( t \)$ from $p$.
  Return to the $w_0$-coordinates. Uniform bounds for the coordinate change and its inverse, after one fixed shrinking, give constants $c' \, C' > 0$ and centers $w_t$ such that
  $ B \( w_t \, c' t \) subset { w_0 : \( z_0 \( p \) \, w_0 \) in U } \, #h(2em) \| w_t - w_0 \( p \) \| lt.eq C' t . $
  Set
  $ s_t = \( z_0 \( p \) \, "Re" w_t \) \, #h(2em) v_t = "Im" w_t - phi.alt \( s_t \) . $
  Intersecting each complex ball with the real affine slice $"Re" w_0 = "Re" w_t$ gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ B \( v_t \, c' t \) subset A_(s_t) \, #h(2em) s_t arrow.r s_(*) \, #h(2em) \| v_t \| = O \( t \) . $ <eq:offset-balls>]
  The last estimate uses the smoothness of $phi.alt$ and the fact that $p$ lies on its graph.
  Choose a sequence $t_j arrow.b 0$ for which $v_(t_j) \/ t_j arrow.r v$. Equation (4.8) implies
  $ "dist" #scale(x: 120%, y: 120%)[\(] v \, bb(R)^k \\ t_j^(- 1) A_(s_(t_j)) #scale(x: 120%, y: 120%)[\)] gt.eq c' - \| v - v_(t_j) \/ t_j \| gt.eq c' \/ 2 $
  for large $j$. If $v$ belonged to $F$, the moving-parameter excluded-offset conclusion of Proposition 8 would force this distance to tend to zero. Thus $v in.not F$, as required. ◻
]

== 5 Weighted scaling and the quadratic model <sec:scaling>

We now turn the boundary data into a global model of $U$. There are two distinct convergence statements to retain: compact subsets of the proposed limit eventually lie in the scaled domains, and points forbidden by the limit are approached by excluded points. The latter will prevent the limiting biholomorphism from acquiring an unwanted image component or a boundary value. Boundary scaling is a method developed by Pinchuk [8] Section 2, pp. 73–75; Frankel’s compact-quotient argument likewise studies limits of normalized automorphisms [3] Section 3. We give the set convergence and the forward and inverse compactness arguments in the form required by the possibly higher-codimensional boundary cell chosen here.

Fix the point $p$, cell $S$, old coordinates $\( z_0 \, w_0 \)$, excluded cone $F$, and $k$ support functions $h_1 \, dots.h \, h_k$ supplied by Proposition 9. We retain the old parameters $s = \( z_0 \, "Re" w_0 \)$ and offsets $v = "Im" w_0 - phi.alt \( s \)$ when invoking Proposition 8. By Proposition 11, $F eq.not bb(R)^k$.

Choose translated, complex-linearly adjusted coordinates $\( z \, w \)$ centered at $p$ such that

$ T_p S = { "Im" w = 0 } \, #h(2em) \( z \, w \) in bb(C)^m times bb(C)^k \, #h(2em) m = n - k . $

Let $Phi$ denote the inverse coordinate chart, with $Phi \( 0 \) = p$, and shrink its neighborhood $Omega$ in $V$ when necessary. Put

$ delta_t \( Z \, W \) = \( sqrt(t) thin Z \, t W \) \, #h(2em) D_t = delta_t^(- 1) #scale(x: 120%, y: 120%)[\(] Phi^(- 1) \( U ∩ Omega \) #scale(x: 120%, y: 120%)[\)] quad \( t > 0 \) . $

Every fixed compact subset of $bb(C)^n$ lies in the domain of $Phi compose delta_t$ for all sufficiently small $t$; membership in $D_t$ then means exactly that its image lies in $U$.

#thm([Proposition 5.1.])[
  (Two-sided convergence of the scaled sets).  #emph[There are an invertible real linear map $L : bb(R)^k arrow.r bb(R)^k$ and a vector $Q$ of real quadratic forms on $bb(C)^m$ such that, with 
$ R \( Z \, W \) = L \( "Im" W \) - Q \( Z \) \, #h(2em) cal(O) = { \( Z \, W \) : R \( Z \, W \) in.not F } \, $

 the following hold.]
  + #emph[Every compact subset of $cal(O)$ is contained in $D_t$ for all sufficiently small $t > 0$.]
  + #emph[For every $xi in bb(C)^n$ with $R \( xi \) in F$ and every sequence $t_j arrow.b 0$, there are $xi_j in.not D_(t_j)$ such that $xi_j arrow.r xi$. These excluded points can be chosen within the scaled coordinate charts.]
] <prop:scaling-limit>

#proof[
  Regard the old offset $v$ as a real analytic function of the new coordinates. Its differential has kernel $T_p S$, so $d v_0 \( z \, w \) = L \( "Im" w \)$ with $L$ invertible. Taylor expansion therefore gives
  #[#set math.equation(numbering: n => "(5.1)")
   $ R_t \( Z \, W \) := t^(- 1) v #scale(x: 120%, y: 120%)[\(] Phi \( sqrt(t) thin Z \, t W \) #scale(x: 120%, y: 120%)[\)] arrow.r L \( "Im" W \) - Q \( Z \) $ <eq:residual-scaling>]
  uniformly on compact sets. Here $- Q$ is the part of the quadratic Taylor term involving only $z$; the mixed and normal quadratic terms disappear after division by $t$. The old parameter $s_t \( Z \, W \) = s \( Phi \( sqrt(t) thin Z \, t W \) \)$ tends uniformly on compact sets to $s_(*)$.
  For clarity, the distance convergence in Proposition 8 says that
  $ d \( s \, t \; u \) = min { 1 \, "dist" \( u \, bb(R)^k \\ t^(- 1) A_s \) } arrow.r d_(*) \( u \) quad upright("as ") \( s \, t \) arrow.r \( s_(*) \, 0^(+) \) \, $
  locally uniformly in $u$, with $F = { d_(*) = 0 }$. In particular it applies to moving vectors $u_j arrow.r u$, as well as to moving parameters $s_j$. If assertion (i) failed, a compactness argument would give $xi_j arrow.r xi in cal(O)$ and $t_j arrow.b 0$ with $xi_j in.not D_(t_j)$. The corresponding offsets $R_(t_j) \( xi_j \)$ are excluded from $t_j^(- 1) A_(s_(t_j) \( xi_j \))$. Their distances to the excluded sets are thus zero, whereas their limit has distance value $d_(*) \( R \( xi \) \) > 0$. This is a contradiction.
  For assertion (ii), set $q_j = Phi \( delta_(t_j) xi \)$ and retain its old parameter $s_j = s \( q_j \)$. Since $R_(t_j) \( xi \) arrow.r R \( xi \) in F$, the same joint convergence supplies
  $ u_j in bb(R)^k \\ t_j^(- 1) A_(s_j) \, #h(2em) u_j - R_(t_j) \( xi \) arrow.r 0 . $
  In the old chart change only the imaginary normal coordinate, replacing the offset $v \( q_j \)$ by $t_j u_j$. The resulting point $q'_j$ is outside $U$, has the same $s_j$, and differs from $q_j$ by $o \( t_j \)$ in old coordinates. It remains in $Omega$ for large $j$. The fixed coordinate change is smooth, so the change is also $o \( t_j \)$ in the new coordinates. Consequently
  $ xi_j := delta_(t_j)^(- 1) Phi^(- 1) \( q'_j \) arrow.r xi \, #h(2em) xi_j in.not D_(t_j) . $
  Indeed an $o \( t_j \)$ change becomes $o \( sqrt(t_j) \)$ in the $Z$ coordinates and $o \( 1 \)$ in the $W$ coordinates. All points used here approach $p$, so the local cutoffs in the definition of $A_s$ do not affect the argument. ◻
]

Choose a connected component $C$ of the nonempty open cone $L^(- 1) \( bb(R)^k \\ F \)$, and set

#[#set math.equation(numbering: n => "(5.2)")
 $ P_2 = L^(- 1) Q \, #h(2em) D_0 = { \( Z \, W \) : "Im" W - P_2 \( Z \) in C } . $ <eq:preliminary-model>]

Every positive dilation preserves $C$: for $a in C$, the path $r mapsto r a$ stays in the complement cone and connects $a$ to any positive multiple. The real coordinate change

$ \( Z \, W \) mapsto \( Z \, "Re" W \, "Im" W - P_2 \( Z \) \) $

identifies $D_0$ with $bb(C)^m times bb(R)^k times C$. Thus $D_0$ is connected and is precisely one connected component of $cal(O)$.

#thm([Theorem 5.2.])[
  (Quadratic model).  #emph[Under the hypotheses of Theorem 1, with $n gt.eq 1$, there are integers $1 lt.eq k lt.eq n$, $m = n - k$, a nonempty connected open cone $C subset bb(R)^k$, and a vector $H$ of Hermitian forms on $bb(C)^m$ such that $U$ is biholomorphic to 
#[#set math.equation(numbering: n => "(5.3)")
 $ D = { \( z \, w \) in bb(C)^m times bb(C)^k : "Im" w - H \( z \, z \) in C } . $ <eq:model>]

 Here $C$ is invariant under every positive dilation, and $H$ is complex linear in its first argument. There are independent real linear functionals $ell_1 \, dots.h \, ell_k$ on $bb(R)^k$ and a constant $c > 0$ such that 
#[#set math.equation(numbering: n => "(5.4)")
 $ ell_a \( y \) > 0 quad \( y in C \) \, #h(2em) ell_a \( H \( z \, z \) \) gt.eq c lr(bar.v.double z bar.v.double)^2 quad \( z in bb(C)^m \) \, #h(2em) 1 lt.eq a lt.eq k . $ <eq:strict-supports>]

 The original action transfers to a properly discontinuous action on $D$ with compact quotient. No freeness assumption is required.]
] <thm:quadratic-model>

#proof[
  We first prove $U tilde.eq D_0$, and then remove the pure quadratic terms and pass the support inequalities to the limit.
  ===== 5.1 Normalization and forward bounds. <normalization-and-forward-bounds.>
  Choose $a_0 in C$ and write $b_0 = \( 0 \, i a_0 \) in D_0$. By Proposition 12, for any sufficiently small sequence $t_j arrow.b 0$ the points $p_j = Phi \( 0 \, i t_j a_0 \)$ belong to $U$. The compact covering set $K$ gives
  $ gamma_j \( k_j \) = p_j \, #h(2em) gamma_j in Gamma \, quad k_j in K . $
  After extraction, $k_j arrow.r k_(*) in K$.
  Each support $h_a$ maps $U$ into the unit disc, satisfies $h_a \( p \) = 1$, and has $h_a \( p_j \) = 1 + O \( t_j \)$. For a fixed compact subset $E subset U$, $d_U \( q \, k_j \)$ is bounded uniformly for $q in E$. Schwarz contraction for the chain-of-discs distance implies that $h_a \( gamma_j q \)$ is at uniformly bounded hyperbolic distance from $h_a \( p_j \)$. If two disc points $alpha \, beta$ have pseudohyperbolic distance at most $rho < 1$, then
  $ \| beta - alpha \| lt.eq frac(rho \( 1 - \| alpha \|^2 \), 1 - rho \| alpha \|) lt.eq frac(2 rho, 1 - rho) \( 1 - \| alpha \| \) . $
  It follows that, uniformly on $E$,
  #[#set math.equation(numbering: n => "(5.5)")
   $ h_a \( gamma_j q \) = 1 + O_E \( t_j \) \, #h(2em) 1 lt.eq a lt.eq k . $ <eq:scaled-support-bound>]
  The peak inequality in Equation (3.5) now gives
  $ lr(bar.v.double gamma_j q - p bar.v.double)^2 lt.eq - log \| h_a \( gamma_j q \) \| = O_E \( t_j \) . $
  Here and below the norm of points in $V$ is the norm in its fixed affine embedding. In particular, the images of $E$ eventually lie in $Omega$, and their new coordinates satisfy $\( z \, w \) = O_E \( sqrt(t_j) \)$.
  The $k$ supports sharpen the bound in all the normal directions. Their real logarithmic differentials annihilate $T_p S = { "Im" w = 0 }$ and are independent. Therefore, taking the local logarithms normalized by $log h_a \( p \) = 0$, we have
  #[#set math.equation(numbering: n => "(5.6)")
   $ d \( log h_a \)_p = i ell_a \( d w \) \, $ <eq:normal-linear-supports>]
  where $ell_1 \, dots.h \, ell_k$ are independent real rows, extended complex linearly when applied to $w$. Indeed a complex linear form whose real part vanishes on all $z$ and real $w$ has no $z$ term and purely imaginary $w$ coefficients. Taylor expansion, the preliminary $O_E \( sqrt(t_j) \)$ bound, and Equation (5.5) give
  $ i ell_a \( w \) = O_E \( t_j \) \, #h(2em) 1 lt.eq a lt.eq k . $
  Invertibility of the matrix of these rows gives $w = O_E \( t_j \)$. Consequently the holomorphic maps
  $ f_j = delta_(t_j)^(- 1) compose Phi^(- 1) compose gamma_j $
  are eventually defined on a neighborhood of every compact subset of $U$ and are locally uniformly bounded. A diagonal normal-family extraction gives a holomorphic limit $f : U arrow.r bb(C)^n$.
  ===== 5.2 Inverse compactness. <inverse-compactness.>
  For each $j$ the inverse coordinate map
  $ g_j = gamma_j^(- 1) compose Phi compose delta_(t_j) : D_(t_j) arrow.r U $
  is defined on all of $D_(t_j)$ and satisfies $g_j \( b_0 \) = k_j$. Every compact subset of $D_0$ is eventually contained in its domain, by Proposition 12. More importantly, for every compact $E subset D_0$ there is a compact $K_E subset U$ containing $g_j \( E \)$ for all sufficiently large $j$.
  To see this last assertion, cover $E$ by finitely many balls $B \( x_nu \, r_nu \)$ with $overline(B) \( x_nu \, 2 r_nu \) subset D_0$. Connectedness and small balls along paths give a fixed finite disc chain from $b_0$ to each $x_nu$, with all closed disc images in $D_0$. For $x in B \( x_nu \, r_nu \)$, append the disc
  $ zeta mapsto x_nu + 2 zeta \( x - x_nu \) \, $
  whose parameters $0$ and $1 \/ 2$ join $x_nu$ to $x$. All these chains lie in one compact subset of $D_0$, and their total Poincaré lengths have a common bound. That compact subset is contained in $D_(t_j)$ for all large $j$, so composition with $g_j$ proves
  $ d_U \( g_j \( x \) \, k_j \) lt.eq M_E #h(2em) \( x in E \) $
  with $M_E$ independent of $j$. Since $k_j in K$ and $d_U$ is proper by Proposition 4, this is the claimed compactness.
  Montel’s theorem in the bounded ambient affine coordinates, followed by diagonal extraction, now gives a holomorphic map $g : D_0 arrow.r U$ with $g_j arrow.r g$ locally uniformly. The compact containment just proved puts the limit in $U$, rather than merely in its closure. It also allows the composition identities to pass to the limit: on each compact subset of $D_0$, the points $g_j \( x \)$ lie in a common compact subset of $U$, where $f_j arrow.r f$. Thus
  #[#set math.equation(numbering: n => "(5.7)")
   $ f compose g = "id"_(D_0) . $ <eq:one-composition>]
  In particular, $f$ has full rank at every point of $g \( D_0 \)$.
  This identity has not yet located the rest of $f \( U \)$ or proved global injectivity. The next step uses the excluded-point conclusion of Proposition 12 to settle both issues.
  ===== 5.3 Excluding additional image points. <excluding-additional-image-points.>
  The maps $f_j$ have nonzero Jacobian wherever they are defined. Their local Jacobian determinants converge to that of $f$. The zero-free limit principle says that a limit of zero-free holomorphic functions is either zero-free or identically zero; in several variables this follows by restriction to complex lines. Thus the full-rank locus and its complement are both open: a zero of a local limiting determinant forces that determinant to vanish throughout its coordinate ball. Equation (5.7) makes the full-rank locus nonempty, so connectedness of $U$ implies that $f$ has nonzero Jacobian everywhere.
  Fix $q in U$. Local inverse stability gives a neighborhood $B$ of $f \( q \)$ such that
  #[#set math.equation(numbering: n => "(5.8)")
   $ B subset f_j \( V_q \) subset D_(t_j) $ <eq:stable-image-ball>]
  for all sufficiently large $j$, where $V_q subset.double U$ is a fixed coordinate neighborhood of $q$. Here is an explicit justification of the stability assertion. Center source coordinates at $q$ and normalize the target by the inverse of $d f_q$. On a sufficiently small closed source ball the normalized derivative of $f$ differs from the identity by less than $1 \/ 4$. Local uniform convergence of the holomorphic maps gives the same bound with $1 \/ 2$ for $f_j$ on that ball. For every target point in a fixed smaller ball about $f \( q \)$, the equation $f_j \( x \) = y$ is then solved by a contraction of the closed source ball into itself, since $f_j \( q \) arrow.r f \( q \)$. This proves Equation (5.8).
  If $R \( f \( q \) \) in F$, assertion (ii) of Proposition 12 supplies points outside $D_(t_j)$ converging to $f \( q \)$, contradicting Equation (5.8). Thus $f \( U \) subset cal(O)$. The set $f \( U \)$ is connected and contains $D_0$ by Equation (5.7), so it lies in that same connected component: $f \( U \) = D_0$. Finally, for each $q in U$ the points $f_j \( q \)$ eventually lie in a compact neighborhood of $f \( q \)$ inside $D_0$. Passing to the limit in $g_j \( f_j \( q \) \) = q$ yields $g \( f \( q \) \) = q$. We have proved that $f : U arrow.r D_0$ and $g : D_0 arrow.r U$ are inverse biholomorphisms.
  ===== 5.4 The Hermitian form and its supports. <the-hermitian-form-and-its-supports.>
  The real quadratic vector $P_2$ has a unique decomposition
  $ P_2 \( z \) = H \( z \, z \) + "Re" B \( z \) \, $
  where $H$ is a vector of Hermitian forms and $B$ a vector of holomorphic homogeneous quadratic polynomials. The triangular holomorphic change
  $ \( Z \, W \) mapsto \( z \, w \) = \( Z \, W - i B \( Z \) \) $
  is globally invertible and transforms $D_0$ into $D$ of Equation (5.3).
  The functionals in Equation (5.6) retain their independence. We claim that throughout $D$ they satisfy
  #[#set math.equation(numbering: n => "(5.9)")
   $ ell_a \( "Im" w \) gt.eq c lr(bar.v.double z bar.v.double)^2 \, #h(2em) 1 lt.eq a lt.eq k \, $ <eq:model-support-bound>]
  for a common $c > 0$. To prove this, fix $\( z \, w \) in D$ and consider the unscaled point
  $ q_t = Phi #scale(x: 120%, y: 120%)[\(] sqrt(t) thin z \, t \( w + i B \( z \) \) #scale(x: 120%, y: 120%)[\)] . $
  It lies in $U$ for every sufficiently small $t$, by Proposition 12 applied before the triangular change. The local holomorphic logarithm of a support has expansion
  $ log h_a \( Phi \( z \, w \) \) = i ell_a \( w \) + A_a \( z \) + O #scale(x: 120%, y: 120%)[\(] lr(bar.v.double z bar.v.double)^3 + lr(bar.v.double z bar.v.double) lr(bar.v.double w bar.v.double) + lr(bar.v.double w bar.v.double)^2 #scale(x: 120%, y: 120%)[\)] \, $
  where $A_a$ is holomorphic homogeneous quadratic. Dividing the peak inequality $- log \| h_a \( q_t \) \| gt.eq lr(bar.v.double q_t - p bar.v.double)^2$ by $t$ and passing to the limit gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ ell_a \( "Im" w \) + "Re" #scale(x: 120%, y: 120%)[\(] ell_a \( B \( z \) \) - A_a \( z \) #scale(x: 120%, y: 120%)[\)] gt.eq lr(bar.v.double J z bar.v.double)^2 \, #h(2em) J = d_z Phi_0 . $ <eq:unaveraged-support>]
  The linear map $J$ is injective. Thus, when $m > 0$, its right-hand side is bounded below by $c lr(bar.v.double z bar.v.double)^2$ with $c > 0$. When $m = 0$, the same inequality holds with any positive $c$, since $z = 0$.
  For each real $theta$, the point $\( e^(i theta) z \, w \)$ also lies in $D$, because $H \( e^(i theta) z \, e^(i theta) z \) = H \( z \, z \)$. Average Equation (5.10) over $theta$. The holomorphic quadratic terms have average zero, whereas $lr(bar.v.double J \( e^(i theta) z \) bar.v.double) = lr(bar.v.double J z bar.v.double)$. This proves Equation (5.9).
  Putting $z = 0$ gives $ell_a \( y \) gt.eq 0$ on $C$. Since $C$ is open and $ell_a eq.not 0$, equality at a point of $C$ would produce a nearby negative value. Hence $ell_a \( y \) > 0$ for every $y in C$. Next fix $y in C$. For every $r > 0$,
  $ \( z \, i \( H \( z \, z \) + r y \) \) in D . $
  Apply Equation (5.9) and let $r arrow.b 0$ to obtain $ell_a \( H \( z \, z \) \) gt.eq c lr(bar.v.double z bar.v.double)^2$. This proves both parts of Equation (5.4). Conjugating the original group by the resulting biholomorphism transfers proper discontinuity and cocompactness to $D$, completing the proof. ◻
]

== 6 Symmetry of the quadratic model <sec:symmetry>

The remaining step is an established theorem of Vey. We state precisely the form we need, with the normal variable written second to match Equation (5.3). A domain is #emph[divisible] if a group of holomorphic automorphisms acts properly when given the discrete topology and has a compact covering set. This definition does not require a free action.

#thm([Theorem 6.1.])[
  (Vey).  #emph[Let $D subset bb(C)^m times bb(C)^k$ be a connected domain biholomorphic to a bounded domain. Suppose that $D$ contains a point $\( 0 \, w \)$ and is invariant under 
$ \( z \, w \) mapsto \( z \, w + a \) \, #h(2em) \( z \, w \) mapsto \( e^(i theta) z \, w \) \, #h(2em) \( z \, w \) mapsto \( r^(1 \/ 2) z \, r w \) $

 for every $a in bb(R)^k$, $theta in bb(R)$, and $r > 0$. If $D$ is divisible, it is biholomorphic to a bounded symmetric domain. The case $m = 0$ is included.]
] <thm:model-symmetry>

In Vey’s terminology these hypotheses define a divisible $S$-domain of exponent $1 \/ 2$, after reversing the variable blocks. His Theorem 1 asserts homogeneity, and the immediately following consequence asserts symmetry [11] p. 479. The zero-block convention is explicit in [11] pp. 480–481. Neither convexity of a defining cone nor regularity of its boundary is an input to this theorem. Vey obtains the symmetry consequence from the earlier work of Hano, Koszul, and Borel [11] p. 479; we use his combined statement rather than separately invoke those antecedent results.

#proof[
  #emph[Completion of the proof of Theorem 1.] The zero-dimensional case is a point. Otherwise, Theorem 13 identifies $U$ biholomorphically with the domain in Equation (5.3). We check every hypothesis of Theorem 14.
  First we give an explicit bounded realization in the intrinsic dimension $n = m + k$. Boundedness of the original affine embedding places $U$ inside $bb(C)^N$; the realization needed here is as a domain in $bb(C)^n$. Extend the real forms $ell_1 \, dots.h \, ell_k$ complex linearly to $bb(C)^k$, and write $u_j = ell_j \( w \)$. For $\( z \, w \) in D$, Equation (5.4) gives
  $ "Im" u_j = ell_j #scale(x: 120%, y: 120%)[\(] "Im" w - H \( z \, z \) #scale(x: 120%, y: 120%)[\)] + ell_j #scale(x: 120%, y: 120%)[\(] H \( z \, z \) #scale(x: 120%, y: 120%)[\)] > c lr(bar.v.double z bar.v.double)^2 gt.eq 0 . $
  Consequently the map
  #[#set math.equation(numbering: n => "(6.1)")
   $ cal(B) \( z \, w \) = (frac(u_1 - i, u_1 + i) \, dots.h \, frac(u_k - i, u_k + i) \, frac(z, u_1 + i)) $ <eq:bounded-realization>]
  is holomorphic. Its first $k$ coordinates have modulus less than one. If $m > 0$ and $y = "Im" u_1$, then
  $ lr(bar.v.double frac(z, u_1 + i) bar.v.double) lt.eq frac(sqrt(y \/ c), 1 + y) lt.eq frac(1, 2 sqrt(c)) . $
  Here $\| u_1 + i \| gt.eq 1 + y$, and $2 sqrt(y) lt.eq 1 + y$. Thus $cal(B) \( D \)$ is bounded. Inverting the Cayley coordinates recovers each $u_j$ holomorphically. Independence of the $ell_j$ then recovers $w$, and multiplication by $u_1 + i$ recovers $z$. These formulas give a holomorphic local inverse on an open neighborhood of every image point, so $cal(B)$ is a biholomorphism onto a bounded domain in $bb(C)^(k + m)$. When $m = 0$, omit the final coordinate block and its estimate.
  Choose $a_0 in C$. Then $\( 0 \, i a_0 \) in D$. Real translations of $w$ preserve the defining residual, as do scalar unit rotations of $z$, because $H$ is Hermitian. Under the positive dilation in Theorem 14, that residual becomes
  $ "Im" \( r w \) - H \( r^(1 \/ 2) z \, r^(1 \/ 2) z \) = r #scale(x: 120%, y: 120%)[\(] "Im" w - H \( z \, z \) #scale(x: 120%, y: 120%)[\)] . $
  Since $r C = C$ for every $r > 0$, these maps preserve $D$ in both directions.
  Finally, conjugate the given action on $U$ by the biholomorphism $U tilde.eq D$. Proper discontinuity and the existence of a compact covering set are preserved by conjugacy. This is exactly divisibility in Vey’s definition, including when point stabilizers are nontrivial. In particular, we do not replace the action by a free action or assume that its quotient is a manifold. Theorem 14 applies and proves the assertion. ◻
]

#heading(level: 1)[References]
#bibitem([1])[E. Bishop, #emph[Differentiable manifolds in complex Euclidean space], Duke Math. J. #strong[32] (1965), no.~1, 1--21. #link("https://doi.org/10.1215/S0012-7094-65-03201-1")[doi:10.1215/S0012-7094-65-03201-1].]
#bibitem([2])[M. Coste, #emph[Real algebraic sets], lecture notes, March 23, 2005. #link("https://indico.ictp.it/event/a04204/session/10/contribution/7/material/0/0.pdf")[Author's text].]
#bibitem([3])[S. Frankel, #emph[Complex geometry of convex domains that cover varieties], Acta Math. #strong[163] (1989), 109--149. #link("https://doi.org/10.1007/BF02392734")[doi:10.1007/BF02392734].]
#bibitem([4])[C. D. Hill and G. Taiani, #emph[Families of analytic discs in $bb(C)^n$ with boundaries on a prescribed CR submanifold], Ann. Scuola Norm. Sup. Pisa Cl. Sci. (4) #strong[5] (1978), no.~2, 327--380. #link("https://www.numdam.org/item/ASNSP_1978_4_5_2_327_0.pdf")[Digitized original].]
#bibitem([5])[S. Kobayashi, #emph[Invariant distances on complex manifolds and holomorphic mappings], J. Math. Soc. Japan #strong[19] (1967), no.~4, 460--480. #link("https://doi.org/10.2969/jmsj/01940460")[doi:10.2969/jmsj/01940460].]
#bibitem([6])[J. Kollár and J. Pardon, #emph[Algebraic varieties with semialgebraic universal cover], J. Topol. #strong[5] (2012), no.~1, 199--212. #link("https://doi.org/10.1112/jtopol/jts001")[doi:10.1112/jtopol/jts001]. Preprint: #link("https://arxiv.org/abs/1104.2309v2")[arXiv:1104.2309v2]. Question numbering in this article refers to this preprint version.]
#bibitem([7])[OpenAI, #emph[Semialgebraic universal covers of normal projective varieties], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Semialgebraic-universal-covers-of-normal-projective-varieties-September-24-2026/paper.pdf")[OAI:Semialgebraic-universal-covers-of-normal-projective-varieties-September-24-2026], 2026.]
#bibitem([8])[S. I. Pinchuk, #emph[Holomorphic inequivalence of some classes of domains in $bb(C)^n$], Math. USSR-Sb. #strong[39] (1981), no.~1, 61--86. Russian original: Mat. Sb. (N.S.) #strong[111(153)] (1980), no.~1, 67--94. #link("https://doi.org/10.1070/SM1981v039n01ABEH001470")[doi:10.1070/SM1981v039n01ABEH001470].]
#bibitem([9])[J.-P. Rosay, #emph[Sur une caractérisation de la boule parmi les domaines de $bb(C)^n$ par son groupe d'automorphismes], Ann. Inst. Fourier (Grenoble) #strong[29] (1979), no.~4, 91--97. #link("https://doi.org/10.5802/aif.768")[doi:10.5802/aif.768].]
#bibitem([10])[The Stacks Project Authors, #emph[The Stacks Project], Noether normalization, Lemma~10.115.4, Tag~00OY. #link("https://stacks.math.columbia.edu/tag/00OY").]
#bibitem([11])[J. Vey, #emph[Sur la division des domaines de Siegel], Ann. Sci. École Norm. Sup. (4) #strong[3] (1970), no.~4, 479--506. #link("https://www.numdam.org/article/ASENS_1970_4_3_4_479_0.pdf")[Digitized original].]
#bibitem([12])[B. Wong, #emph[Characterization of the unit ball in $bb(C)^n$ by its automorphism group], Invent. Math. #strong[41] (1977), 253--257. #link("https://doi.org/10.1007/BF01403050")[doi:10.1007/BF01403050].]
#bibitem([13])[A. Zimmer, #emph[Smoothly bounded domains covering compact manifolds], Indiana Univ. Math. J. #strong[70] (2021), no.~6, 2653--2676. Preprint: #link("https://arxiv.org/abs/1910.05288v2")[arXiv:1910.05288v2].]


